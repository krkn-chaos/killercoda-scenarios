#!/bin/bash

cat <<EOF
Welcome to the Krkn Operator Demo!
Waiting for the environment to be ready...

EOF

# Wait for background setup to complete
while [ ! -f /tmp/setup-complete ]; do
    sleep 2
done

cat <<EOF
Environment is ready!
You can now proceed with the scenario steps.
EOF
