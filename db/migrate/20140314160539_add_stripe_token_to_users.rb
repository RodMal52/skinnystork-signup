class AddStripeTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_token, :string
    add_column :users, :coupon, :string
  end
end
