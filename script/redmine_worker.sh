#!/bin/bash

# Change directory to Redmine root.
cd /opt/redmine/current

# Start the Redmine resque worker.
QUEUE=* bundle exec /usr/local/bin/rake resque:work RAILS_ENV="production"

