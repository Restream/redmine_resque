# Redmine Resque plugin

[![Build Status](https://travis-ci.org/Undev/redmine_resque.png?branch=master)](https://travis-ci.org/Undev/redmine_resque)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_resque.png)](https://codeclimate.com/github/Undev/redmine_resque)

Adding "resque" and "resque-scheduler" gem and mount Resque front-end on a subpath "/resque".

## Description

Link at the top menu allows administrator see what's up with your queue.

## Requirements

Resque requires Redis.

## Install

1. Copy plugin directory into REDMINE_ROOT/plugins.
If you are downloading the plugin directly from GitHub,
you can do so by changing into your REDMINE_ROOT directory and issuing a command like

        git clone https://github.com/Undev/redmine_resque.git plugins/redmine_resque
        bundle install

2. Restart Redmine.

3. Run resque worker from REDMINE_ROOT directory or use a [Ubuntu/Debian upstart job](#ubuntudebian-upstart-job).

        bundle exec rake resque:work RAILS_ENV=production QUEUE=*
        
4. Run resque scheduler from REDMINE_ROOT directory or use a [Ubuntu/Debian upstart job](#ubuntudebian-upstart-job).

        bundle exec rake resque:scheduler RAILS_ENV=production

## Activate included jobs by adding it to the schedule

1. Create the worker schedule file in the redmine/config directory:

        nano config/worker_schedule.yml

2. Add any of following configuration sections to your schedule.

#### Mail reading

The parameters for this job is exactly the same as the normal Redmine rake task to receive emails with IMAP 
[as described here](http://www.redmine.org/projects/redmine/wiki/RedmineReceivingEmails).

        read_mail:
          cron: "* * * * *"
          class: "ReceiveEmailIMAP"
          queue: "mail"
          args:
          - host: imap.gmail.com
          - port: 993
          - ssl: true
          - username: some_user@gmail.com
          - password: some_password
          description: "Read mail sent to Redmine mailbox."

## Ubuntu/Debian upstart job

1. Copy the example upstart config files provided by this plugin to system directory:

        cp script/redmine_*.conf /etc/init

2. Edit the config files and scripts to reflect the correct system user and Redmine installation path.

        nano script/redmine_scheduler.sh
        nano script/redmine_worker.sh
        nano /etc/init/redmine_scheduler.conf
        nano /etc/init/redmine_worker.conf

3. Start or stop the scheduler and worker.

        service redmine_scheduler start
        service redmine_worker start

4. If you want non-root users to stop/start service, add them to the sudoers file:

        nano /etc/sudoers
        
        # Add these lines:
        your_user ALL=NOPASSWD: /usr/sbin/service redmine_scheduler *
        your_user ALL=NOPASSWD: /usr/sbin/service redmine_worker *


## Links

- http://www.redmine.org/
- https://github.com/resque/resque

## License

Copyright (C) 2014 Undev.ru

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
