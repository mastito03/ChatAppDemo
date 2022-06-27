class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    stream_from "room_#{room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
