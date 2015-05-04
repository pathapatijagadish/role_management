class ManagersController < ApplicationController
  before_filter :autherize_manager?
  def index
  end
end
