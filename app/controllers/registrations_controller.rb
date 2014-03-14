class RegistrationsController < Devise::RegistrationsController

    before_filter :set_plan, :only => :new
    def set_plan
        @plan = params[:plan]
    end
end