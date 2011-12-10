class ApplicationController < ActionController::Base
  protect_from_forgery
  
  Time.zone = "Pacific Time (US & Canada)"
end
