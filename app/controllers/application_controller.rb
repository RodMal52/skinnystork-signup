class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :reject_locked!, if: :devise_controller?
  
 protected
     
  # Devise permitted params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :username,
      :stripe_token,
      :coupon,
      :email, 
      :password, 
      :password_confirmation,
      :lose_fat_and_tone, 
     :better_my_endurance, 
     :get_stronger ,
     :connect_my_mind_and_body, 
     :eat_better, 
     :units, 
     :weight, 
     :height,
    :birthday,
     
     :doctor_clearance, 
     :currently_pregnant, 
     :heart_condition, 
     :shortness_breath, 
     :unusual_fatigue, 
     :coronary_heart_disease, 
     :high_pressure, 
     :stroke, 
     :diabetes, 
     :thyroid_problems, 
     :head_injury_epilepsy, 
     :hepatitis, 
     :arthritis, 
     :chronic_severe_headaches, 
     :anemia, 
     :liver_problems, 
     :lung_problems, 
     :others, 
     :no, 
     :contact_time_window,
     :contact_phone_number, 
     :own_roku,
     :first_name,
     :last_name, 
     :address_line_1, 
     :address_line_2, 
     :city, 
     :state, 
     :zip, 
     :country, 
     :reg_phone, 
     :plan_1_monthly, 
     :plan_1_trimonthly, 
     :plan_2_monthly, 
     :plan2_trimonthly, 
     :card_type, 
     :card_number, 
     :exp_month, 
     :exp_year, 
     :cvv, 
     :discount_code, 
     :billing_first_name, 
     :billing_last_name, 
     :billing_address_1, 
     :billing_address_2, 
     :billing_city, 
     :billing_state, 
     :billing_zip, 
     :billing_country, 
     :billing_phone ) 
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :username,
      :stripe_token,
      :coupon,
      :email, 
      :password, 
      :password_confirmation,
      :current_password
      ) 
    }
  end

  # Redirects on successful sign in
  def after_sign_in_path_for(resource) 
      case current_user.roles.first.name
        when 'admin' 
          users_path
        when 'bold_moves'
          content_bold_moves_path
        when 'fusion'
          content_fusion_path
        when 'fit_lifestyle'
          content_fit_lifestyle_path
        else
          root_path
      end 
  end
        
  def after_sign_up_path_for(resource)
      inside_path
  end
  
  # Auto-sign out locked users
  def reject_locked!
    if current_user && current_user.locked?
      sign_out current_user
      user_session = nil
      current_user = nil
      flash[:alert] = "Your account is locked."
      flash[:notice] = nil
      redirect_to root_url
    end
  end
  helper_method :reject_locked!
  
  # Only permits admin users
  def require_admin!
    authenticate_user!
    
    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
  helper_method :require_admin!
  
end
