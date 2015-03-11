# Redmine Resque Plugin

[![Build Status](https://travis-ci.org/Undev/redmine_resque.png?branch=master)](https://travis-ci.org/Undev/redmine_resque)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_resque.png)](https://codeclimate.com/github/Undev/redmine_resque)

This plugin adds a **resque** gem (https://github.com/resque/resque) and mounts the Resque front end on the "/resque" subpath.

The plugin creates a top-menu Redmine link that allows the administrator to see what happens in the job queue.  
![resque link](resque_1.png)

## Compatibility

This plugin version is compatible only with Redmine 2.1.x and later.

## Installation

1. To install the plugin
    * Download the .ZIP archive, extract files and copy the plugin directory into #{REDMINE_ROOT}/plugins.
    
    Or

    * Change you current directory to your Redmine root directory:  

            cd {REDMINE_ROOT}
            
      Copy the plugin from GitHub using the following commands:
      
            git clone https://github.com/Undev/redmine_resque.git plugins/redmine_resque
            
2. Install the required gems using the command:  

        bundle install  

    * In case of bundle install errors, remove the Gemfile.lock file, update the local package index and install the required dependencies. Then execute the bundle install command again:  

            rm Gemfile.lock
            sudo apt-get update
            sudo apt-get install -y libxml2-dev libxslt-dev libpq-dev
            bundle install
            
3. Restart Redmine.

4. Run resque worker from REDMINE_ROOT directory

        bundle exec rake resque:work RAILS_ENV=production QUEUE=*

Now you should be able to see the plugin in **Administration > Plugins**.

## Usage

This plugin is used by other Redmine plugins, for example, [Redmine Elastic Search Plugin](https://github.com/Undev/redmine_elasticsearch).

## License

Copyright (c) 2015 Undev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.