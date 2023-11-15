class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  def after_sign_in_path_for(_resource)
    categories_path
  end
end
