module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def connect
      logs = LogFileWatcher.get_last_10_logs
      ActionCable.server.broadcast "log_stream", {
        message: logs
      }
    end

  end
end
