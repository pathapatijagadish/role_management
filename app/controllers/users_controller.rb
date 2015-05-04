class UsersController < ApplicationController
	before_filter :autherize_admin?
	def index
		@users = User.order("created_at DESC")
	end

	def new
		type = case params[:type]
		when 'Admin'
			'Admin'
		when 'Manager'
			'Manager'
		else			
			'Customer'
		end
		@user = User.new(:type=>type)
	end

	def create		
		@user = User.new(params[:user])
		if @user.save
        redirect_to users_path, :notice => "#{@user.type} was successfully created."
	    else
	        render :action => "new"
	    end				
	end

	def edit
		@user = User.find params[:id]		
	end

	def update			
		@user = User.find(params[:id])		
	    if @user.update_attributes(params[:user])
	       redirect_to users_path, :notice => "#{@user.type} was successfully updated."
	    else
	      render :action => "edit"
	    end
	end

	def destroy
		@user = User.find(params[:id])		
		@user.destroy		
		redirect_to users_path, :notice => "#{@user.type} was successfully removed."
	end
end
