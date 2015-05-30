This is just a quick and hasty Vagrant build to try out running Vines, an XMPP server
written in Ruby. By default, this just builds an example configuration and foward 
tcp/5222 and tcp/5280 for the XMPP service and web interface, respectively.

To run, just do a "vagrant up" in this directory. It will download the upstream base
image from the Chef repo and execute the Chef provisioning.

