class MessagesController < ApplicationController

  before_action :set_room

  def index
    @messages = @room.messages.includes(:user)
    @message = @room.messages.new
  end

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.new message_params
    if @message.save
      respond_to do |format|
        format.html { redirect_to room_messages_path(@room) }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message", locals: { message: @message })
        end
      end
    else
      render :new
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
