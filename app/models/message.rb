class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "event_#{event.id}_messages",
                        partial: "messages/message",
                        target: "messages",
                        locals: { message: self, user: user }
  end
end
