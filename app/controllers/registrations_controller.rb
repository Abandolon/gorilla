class RegistrationsController < Devise::RegistrationsController

  def create
    # add custom create logic here
    build_resource(sign_up_params)

    resource.save
    if params[:styles].present?
      params[:styles].each do |style|
        UserStyle.create(user_id: User.last.id, style_id: style)
      end
    end
    if params[:user]["gym_id"].present?
      a = User.last
      a.gym_id = params[:user]["gym_id"]
      a.save
    end

    yield resource if block_given?

    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    create_photos(resource)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to dashboard_path(current_user)
    else
      render :edit
    end
  end

private

  def create_photos(resource)
    images = params.dig(:user, :photos) || []
    images.each do |image|
      resource.photos.create(photo: image)
    end
  end

  def user_params
    params.require(:user).permit(:name, :gender, :user_id, :age, :discription, :photo, :veteran, :gym_id, :pirate,
                                 :beach, :summer, :book, :vegetable, :bicycle)
  end

end
