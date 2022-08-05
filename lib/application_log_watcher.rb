class ApplicationLogWatcher
  @@defined = false

  def initialize
    raise "Instance already defined" if @@defined
    @@defined = true
  end

  def perform
    ::LogFileWatcher.watch_log_file
  end
end
