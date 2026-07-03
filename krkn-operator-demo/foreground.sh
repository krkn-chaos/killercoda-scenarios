#!/bin/bash

echo "Welcome to the Krkn Operator Demo!"
echo "Waiting for the environment to be ready..."
echo ""

# Wait for background setup to complete
while [ ! -f /tmp/setup-complete ]; do
    sleep 2
done

echo "Environment is ready!"
echo "You can now proceed with the scenario steps."
