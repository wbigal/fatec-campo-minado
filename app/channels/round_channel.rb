class RoundChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'round'
  end

  def unsubscribed; end
end
