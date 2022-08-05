class LogChannel < ApplicationCable::Channel

  def subscribed
    stream_from "log_stream"
  end

  def self.push latest_logs
    ActionCable.server.broadcast "log_stream", {
      message: latest_logs,
    }
  end

end
