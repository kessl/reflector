class SessionChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sessions'
  end

  def receive(data)
    ActionCable.server.broadcast('sessions', data)
  end
end
