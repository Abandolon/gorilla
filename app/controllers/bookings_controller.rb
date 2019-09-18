class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @vet = User.find(params[:id])
    @user = current_user
  end

  def create
    @vet = User.find(params[:user_id])
    @booking = Booking.new(bookings_params)
    @booking.veteran = @vet
    @booking.starter = current_user
    @booking.gym = @vet.gym
    if @booking.save!
      redirect_to dashboard_bookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:value]
      @booking.save
    if @booking.save!
      redirect_to dashboard_bookings_path
    else
      flash[:notice] = "Oops, something went wrong"
    end
  end

  def index
    @requests = Booking.where(veteran_id: current_user.id)
    @bookings = Booking.where(starter_id: current_user.id)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    if @booking.destroy!
      redirect_to dashboard_bookings_path
    else
      flash[:notice] = "Oops, something went wrong"
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:date, :status, :value, :gift_id)
  end

end
