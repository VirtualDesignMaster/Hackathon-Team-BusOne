class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # turn this on to force auth on every inherited controller
  # before_action :authenticate_user!
end
