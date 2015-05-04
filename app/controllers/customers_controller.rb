class CustomersController < ApplicationController
  before_filter	:autherize_customer?
  def index
  end
end
