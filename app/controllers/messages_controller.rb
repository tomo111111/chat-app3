class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end
  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to room_messages_path(@message.room_id)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(room_id:params[:room_id],user_id:current_user.id)
  end
end
