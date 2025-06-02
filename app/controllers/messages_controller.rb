class MessagesController < ApplicationController
  def create

    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user

    if @message.save
      # redirect_to chat_path(@event)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
            target: "messages",
            locals: { message: @message, user: current_user })
        end
        format.html { redirect_to chat_path(@event) }
      end
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
