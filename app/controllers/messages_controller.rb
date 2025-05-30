class MessagesController < ApplicationController
  def create

    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user

    if @message.save
      redirect_to chat_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
