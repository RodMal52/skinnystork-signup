class ContentController < ApplicationController
    before_filter :authenticate_user!
    
    def bold_moves
        authorize! :view, :bold_moves, :message => 'Access limited to The Bold Moves Plan subscribers.'
    end
    
    def fusion
        authorize! :view, :fusion, :message => 'Access limited to The 360 Fusion Plan subscribers.'
    end

    def fit_lifestyle
        authorize! :view, :fit_lifestyle, :message => 'Access limited to The Fit Lifestyle Plan subscribers.'
    end 
end