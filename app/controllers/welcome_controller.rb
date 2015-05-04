class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  def index
  	if current_user
  		case current_user.type
	    when 'Admin'
	    	redirect_to admins_url
	    when 'Manager'
	    	redirect_to managers_url
	    when 'Customer'    	
	    	redirect_to customers_url
	    else	    	
	    end
  	end
  end
end
