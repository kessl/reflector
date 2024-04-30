class SessionChannel < ApplicationCable::Channel
  after_unsubscribe do
    ActionCable.server.broadcast('sessions', { type: 'unsubscribe', client_id: @client_id })
  end

  def subscribed
    @client_id = params[:client_id]
    stream_from 'sessions'
  end

  def receive(data)
    ActionCable.server.broadcast('sessions', data)
  end
end
