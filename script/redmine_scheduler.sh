#!/bin/bash

# Change directory to Redmine root.
cd /opt/redmine/current

# Start the Redmine resque scheduler
bundle exec /usr/local/bin/rake resque:scheduler RAILS_ENV="production"

