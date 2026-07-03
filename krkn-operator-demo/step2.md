# Step 2: Expose the Operator via NodePort

Now let's expose the krkn-operator service externally using a NodePort service.

## Create a NodePort Service

The operator is exposed internally via a ClusterIP service. Let's create a NodePort service to access it externally:

```bash
kubectl config use-context kind-hub
kubectl expose deployment krkn-operator -n krkn-operator \
  --type=NodePort \
  --name=krkn-operator-nodeport \
  --port=8080 \
  --target-port=8080 \
  --node-port=30080
```{{exec}}

## Verify the Service

Check that the NodePort service was created successfully:

```bash
kubectl get svc -n krkn-operator
```{{exec}}

You should see both the original ClusterIP service and the new NodePort service.

## Get Service Details

View the full details of the NodePort service:

```bash
kubectl describe svc krkn-operator-nodeport -n krkn-operator
```{{exec}}

The service is now accessible on port 30080 of any node in the cluster.
