require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LogApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    listener = Listen.to("#{Rails.root}") do |modified| 
      log_changed = modified.select { |m| m.include?("README.log") }
      ::LogFileWatcher.watch_log_file if log_changed
    end
    listener.start
  end
end
