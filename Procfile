web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
filewatcher: filewatcher "README.log" "bundle exec rake log:push_logs_to_client"
