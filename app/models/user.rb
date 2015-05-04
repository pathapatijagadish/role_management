class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:date_of_birth,:status,:type
  # attr_accessible :title, :body

  def to_s
  	first_name.to_s+" "+last_name.to_s
  end

  def active?
  	status?
  end

  def admin?
  	type=='Admin'
  end

  def manager?
  	type=='Manager'  	
  end

  def customer?
  	type=='Customer'
  end
  #Check if user is active before allowing user to sign in with devise
  def active_for_authentication?
    super && self.active?
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end
end
