php_fastcgi puppet Module
=========================

When deploying web servers such as nginx
which do not have the ability to spawn their
own fastcgi sessions, it is useful to run
php5-cgi as a service. On distributions such
as ubuntu which ship with the upstart utility,
we have found that using an upstart script in
lieu of an init script that we are provided with
a more simplistic solution which affords us
further flexibility than an init script.

This module will allow an administrator to easily
configure the options she wants to run php5-cgi
with and create the upstart job with minimal
effort and wasted time.

Compatibility
-------------

This module has only been tested in Ubuntu 12.04.

This module requires [upstart](http://upstart.ubuntu.com/) in order
to properly function.

Basic usage
-----------

To install and run php5-cgi as an upstart job
with sensible defaults.

    include php_fastcgi

It is also possible to call php_fastcgi as a
paramterized class in order to modify default
settings.

    class {'php_fastcgi': 
      user  => 'www-data',
      group => 'www-data',
    }

Options
-------

All options below can be set as parameters
when calling the php_fastcgi class. Their
default values are shown next to the option.

User php5-cgi will run as:

    user          = 'www-data' 

Group php5-cgi will run as:

    group         = 'www-data'

Address php5-cgi will listen on:

    address       = '127.0.0.1'

Port php5-cgi will listen on:

    port          = '9000'
 
Number of children instances php5-cgi will spawn:

    children      = '1'

Max requests which php5-cgi will accept:

    max_requests  = '1000'
  
Whether or not php-fcgi should start by default:

    start         = true

Upstart events which trigger the php-fcgi job:

    start_on      = 'filesystem and static-network-up'

If php5-cgi dies, respawn:

    respawn       = true

Limit respawning to 10 times in 5 secons:

    respawn_limit = '10 5'

Command line options for the php5-cgi command:

    options       = '-q -b'

Contributors
------------

 * [James Awesome Morelli](james@mimedia.com)
 * [Nathan West](nathan@mimedia.com)

License
-------

Copyright (C) 2013 [MiMedia Inc.](http://www.mimedia.com/)

MiMedia can be contacted at: support@mimedia.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
