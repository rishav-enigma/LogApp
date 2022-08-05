require 'filewatcher'
load 'app/channels/log_channel.rb'

class LogFileWatcher
  @@log_file = "#{Rails.root}/README.log"
  @@iterator = 0

  def self.get_last_10_logs
    logs = `tail -n 10 #{@@log_file}`
    f = File.open(@@log_file)
    f.seek(0, :END)
    @@iterator = f.tell - 1
    f.close
    return logs
  end

  def self.get_latest_logs
    f = File.open(@@log_file)
    f.seek(@@iterator, :SET)
    logs = f.read
    @@iterator = f.tell - 1
    f.close
    return logs
  end

  def self.watch_log_file
    ::LogChannel.push get_latest_logs
  end
end
