class ChatRoomsController < ApplicationController

  def index
    @booking_starter = Booking.where(starter_id: current_user.id).where(status: "accepted")
    @booking_vet_approved = Booking.where(veteran_id: current_user.id).where(status: "accepted")
    @booking_vet_pending = Booking.where(veteran_id: current_user.id).where(status: "pending")
    @messages = Message.where(user_id: current_user.id)
  end

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(name: params[:name])
    if @chat_room.save
      @booking = Booking.find(params[:booking_id])
      @booking.chat_room_id = @chat_room.id
      @booking.save
      redirect_to chat_room_path(@chat_room)
    else
      flash[:notice] = "Oops, something went wrong"
    end
  end

  private

  def chat_room_params
   params.require(:chat_room).permit(:name)
  end
end
