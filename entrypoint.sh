#!/bin/bash

# Configure DNS - example using resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Execute the main container command
exec "$@"
