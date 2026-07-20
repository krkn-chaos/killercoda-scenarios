#!/bin/bash

clear
NODE_COUNT=$(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d ' ')
cat <<EOF
============================================================
   Krkn - Chaos Engineering for Kubernetes
============================================================

   'Break your cluster on purpose,
    before production does it for you.'

   What you'll do:
     1. Deploy a target app on a 2-node cluster
     2. Kill its pods with krknctl
     3. Verify recovery and read exit codes
     4. Stress a worker node's CPU
     5. Chain scenarios into a chaos graph
     6. Watch the impact in Krkn's web UI

   Environment: ${NODE_COUNT} node Kubernetes cluster

   Installing krknctl and pre-pulling scenario images
   in the background (this can take a couple of minutes,
   you can start Step 1 right away)...

============================================================
EOF
