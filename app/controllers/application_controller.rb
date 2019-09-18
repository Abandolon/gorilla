class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :description, :veteran, :gender, :age,
                                      :pirate, :beach, :summer, :book, :vegetable, :bicycle, :photos])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    # maybe allow to change veteran to starter and the other way around in a later stage of the app
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  # Make sure your production HOST variable is set with your domain name.
  # If you deploy your code with Heroku for instance, just type in your
  # terminal heroku config:set HOST=www.my_product.com

end
