class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      respond_to do |format|
        format.html { redirect_to rooms_path }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:rooms, partial: "rooms/room", locals: { room: @room })
        end
      end
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:subject)
  end

end
