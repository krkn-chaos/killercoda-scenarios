# Step 3: Test the Operator API

Now that the operator is exposed, let's test the API endpoints.

## Check Operator Health

Test the health endpoint:

```bash
curl http://localhost:30080/health
```{{exec}}

## Check Registration Status

View the registration status endpoint:

```bash
curl http://localhost:30080/api/registration/status
```{{exec}}

## Register First Admin User

If this is the first time running the operator, register the admin user:

```bash
curl -X POST http://localhost:30080/api/registration/register-first-admin \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "admin123",
    "email": "admin@example.com"
  }'
```{{exec}}

## Access the Operator UI

The krkn-operator is now accessible via your browser! Click the link below to access the web interface:

**Operator URL:** https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com

You can login with the credentials you just registered:
- **Username:** admin
- **Password:** admin123

## View Operator Logs

Check the operator logs to see its activity:

```bash
kubectl logs -n krkn-operator -l app.kubernetes.io/name=krkn-operator --tail=50
```{{exec}}

Congratulations! You have successfully installed and exposed the krkn-operator. The operator is now ready to manage chaos engineering experiments across your OCM-managed clusters.
