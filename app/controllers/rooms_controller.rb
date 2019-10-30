class RoomsController < ApplicationController

  def index
    @rooms = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end
end
