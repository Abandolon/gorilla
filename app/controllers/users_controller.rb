class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @gym = Gym.find(current_user.gym_id)
    @veterans = User.where(veteran: true, gym_id: current_user.gym_id)
  end

  def show
    @user = User.veteran.find(params[:id])
    @booking = Booking.new
    @gifts = @user.gifts
  end

  def show_starter
    @user = User.starter.find(params[:id])
    @booking_id = params[:request_id]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    # @user.gym_id = params[:gym_id]
    # @styles = params[:styles]
    # @styles.each do |style|
    # UserStyle.create(user_id: @user.id, style_id: style)
    # end
    # @user.save
    @gifts = params[:gifts]
    @gifts.each do |gift|
    UserGift.create(user_id: @user.id, gift_id: gift.id)
    end
    if @user.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :user_id, :age, :discription, :photo, :veteran, :gym_id, :pirate,
                                 :beach, :summer, :book, :vegetable, :bicycle, :gym_id)
  end
end
