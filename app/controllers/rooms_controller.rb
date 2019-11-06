class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
    @other_rooms = Room.where.not(id: @rooms.ids)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save!
    redirect_to rooms_url, notice: "Room「#{@room.name}」を作成しました。"
  end
end


private

def room_params
  params.require(:room).permit(:name)
end
