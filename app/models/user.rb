class User < ActiveRecord::Base
    rolify

 
  # Use friendly_id on Users
    extend FriendlyId
    friendly_id :friendify, use: :slugged
  
  # necessary to override friendly_id reserved word
    def friendify
        if username.downcase == "admin"
            "user-#{username}"
        else
            "#{username}"
        end
    end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  # Pagination
    paginates_per 100
  
  # Validations
  # :username
    validates :username, uniqueness: { case_sensitive: false }
    validates_format_of :username, with: /\A[a-zA-Z0-9]*\z/, on: :create, message: "can only contain letters and digits"
    validates :username, length: { in: 4..10 }
  # :email
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
    attr_accessor :stripe_token, :coupon
    before_save :update_stripe
    def update_stripe
        
        if customer_id.nil?
            if !stripe_token.present?
                raise "Stripe token not present. Can't create account."
            end
            if coupon.blank?
                customer = Stripe::Customer.create( 
                    :email => email,
                    :description => name,
                    :card => stripe_token,
                    :plan => roles.first.name )
            else
                customer = Stripe::Customer.create(
                    :email => email,
                    :description => name, 
                    :card => stripe_token, 
                    :plan => roles.first.name, 
                    :coupon => coupon
                )
            end 
        else
            customer = Stripe::Customer.retrieve(customer_id)
            if stripe_token.present?
                customer.card = stripe_token
            end
            customer.email = email customer.description = name
            customer.save
        end
        self.last_4_digits = customer.cards.data.first["last4"] 
        self.customer_id = customer.id
        self.stripe_token = nil
    rescue Stripe::StripeError => e
        logger.error "Stripe Error: " + e.message
        errors.add :base, "#{e.message}." 
        self.stripe_token = nil
        false
    end 


def self.paged(page_number)
    order(admin: :desc, username: :asc).page page_number
  end
  
  def self.search_and_order(search, page_number)
    if search
      where("username LIKE ?", "%#{search.downcase}%").order(
      admin: :desc, username: :asc
      ).page page_number
    else
      order(admin: :desc, username: :asc).page page_number
    end
  end
  
  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id","username","slug","created_at")
  end
  
  def self.last_signins(count)
    order(last_sign_in_at: 
    :desc).limit(count).select("id","username","slug","last_sign_in_at")
  end
  
  def self.users_count
    where("admin = ? AND locked = ?",false,false).count
  end
end
