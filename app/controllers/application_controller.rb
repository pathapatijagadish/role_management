class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!    
  
  def autherize_admin?
  	unless current_user.admin?
  		flash[:error] = 'You are not authorized to access this page.'
  		redirect_to root_url
  	end  	
  end

  def autherize_manager?
  	unless current_user.manager?
  		flash[:error] = 'You are not authorized to access this page.'
  		redirect_to root_url
  	end  	
  end

  def autherize_customer?
  	unless current_user.customer?
  		flash[:error] = 'You are not authorized to access this page.'
  		redirect_to root_url
  	end  	
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  def after_sign_in_path_for(resource)  	
    case resource.type
    when 'Admin'
    	admins_url
    when 'Manager'
    	managers_url
    when 'Customer'    	
    	customers_url
    else
    	root_url
    end    
  end
end
