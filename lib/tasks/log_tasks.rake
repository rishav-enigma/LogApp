# frozen_string_literal: true
load 'app/channels/log_file_watcher.rb'

namespace :log do
  desc "If file changed then pushes to client"
  task :push_logs_to_client do
    ::LogFileWatcher.watch_log_file
  end
end
