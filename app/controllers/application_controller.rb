class ApplicationController < ActionController::Base
  before_action :authenticate_user! #, except "static_pages#home"
end
