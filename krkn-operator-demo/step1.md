# Step 1: Download and Run the Setup Script

First, let's download the setup script from the krkn-operator repository and execute it to install OCM and the krkn-operator.

## Download the Setup Script

Download the script from GitHub:

```bash
curl -o setup-ocm-and-operator.sh https://raw.githubusercontent.com/krkn-chaos/krkn-operator/main/scripts/setup-ocm-and-operator.sh
chmod +x setup-ocm-and-operator.sh
```{{exec}}

## Run the Setup Script

Execute the script to install OCM and the krkn-operator:

```bash
./setup-ocm-and-operator.sh
```{{exec}}

This script will:
1. Install the ManagedServiceAccount addon on the hub cluster
2. Create ManagedServiceAccounts for managed clusters
3. Grant necessary RBAC permissions
4. Install the krkn-operator using Helm
5. Wait for all components to be ready

The installation may take a few minutes. Wait for the script to complete.

## Verify the Installation

Check that the krkn-operator pod is running:

```bash
kubectl config use-context kind-hub
kubectl get pods -n krkn-operator
```{{exec}}

You should see the krkn-operator pod in a Running state.
