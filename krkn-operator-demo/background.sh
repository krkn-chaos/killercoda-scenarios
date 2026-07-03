#!/bin/bash

# Setup background environment
set -e

echo "Installing prerequisites..."

# Install kubectl if not present
if ! command -v kubectl &> /dev/null; then
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    mv kubectl /usr/local/bin/
fi

# Install kind
if ! command -v kind &> /dev/null; then
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
    chmod +x ./kind
    mv ./kind /usr/local/bin/kind
fi

# Install helm
if ! command -v helm &> /dev/null; then
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

# Install clusteradm for OCM
if ! command -v clusteradm &> /dev/null; then
    curl -L https://raw.githubusercontent.com/open-cluster-management-io/clusteradm/main/install.sh | bash
fi

echo "Prerequisites installed successfully!"

# Create kind cluster configuration with port mapping for NodePort
cat > /tmp/kind-config.yaml <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30080
    hostPort: 30080
    protocol: TCP
EOF

# Create kind clusters
echo "Creating kind clusters..."
kind create cluster --name hub --config /tmp/kind-config.yaml
kind create cluster --name cluster1
kind create cluster --name cluster2

echo "Kind clusters created successfully!"

# Mark setup as complete
touch /tmp/setup-complete

echo "Setup complete. Ready to proceed."
