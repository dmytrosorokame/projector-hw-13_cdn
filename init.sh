#!/bin/bash

# Wait for BIND to be ready
until dig @172.30.0.2 assets.net > /dev/null 2>&1; do
    echo "Waiting for BIND..."
    sleep 2
done

echo "BIND is ready!" 