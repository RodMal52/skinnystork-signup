module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | SkinnystorkSignup"      
    end
  end
end
