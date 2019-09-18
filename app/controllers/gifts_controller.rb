class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    if @gift.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def gift_params
    params.require(:gift).permit(:name, :photo, :price, :time)
  end
end
