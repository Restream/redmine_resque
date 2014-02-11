# Redmine Resque plugin

Adding "resque" gem and mount Resque front-end on a subpath "/resque".

## Description

Link at the top menu allows administrator see what's up with your queue. 

## Requirements

Resque requires Redis

## Install

1. Copy plugin directory into REDMINE_ROOT/plugins.
If you are downloading the plugin directly from GitHub,
you can do so by changing into your REDMINE_ROOT directory and issuing a command like

        git clone https://github.com/Undev/redmine_resque.git plugins/redmine_resque
        bundle install

2. Restart Redmine
3. Run resque worker from REDMINE_ROOT directory

        bundle exec rake environment resque:work QUEUE=* RAILS_ENV=production

## Links

- http://www.redmine.org/
- https://github.com/resque/resque

## License

Copyright (C) 2014 Undev.ru

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
