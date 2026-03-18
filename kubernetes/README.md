# Kubernetes Documentation

Container orchestration guides and cluster management.

## 📖 Contents

### [Kubernetes Notes](../kubernetes.md)
Kubernetes cluster setup and management essentials:

#### 🏗️ Multi-Node Cluster Setup
```bash
# Reference: CoreOS Kubernetes
https://github.com/coreos/coreos-kubernetes/tree/master/multi-node/vagrant

# Check cluster health
kubectl get cs
```

#### 🌐 Service Discovery & DNS

**Service DNS Format:**
```
{service-name}.{namespace}.svc.cluster.local
```

**Default Namespace:**
```
{service-name}.default.svc.cluster.local
```

**Cross-Namespace Access:**
```
{my-service}.{my-namespace}.svc.cluster.local
```

#### ⚙️ Key Components

**Supervisord:**
- Mix of Docker and Kubelet process management
- [Documentation](http://supervisord.org/)

**Fluentd:**
- Logging aggregation for Kubernetes
- [Quickstart Guide](https://docs.fluentd.org/v0.12/articles/quickstart)

#### 📋 Best Practices

1. **Use Labels & Selectors** - Assign nodes to run specific pods
2. **Never use file options to delete** - Avoid `kubectl delete -f` for services/deployments
3. **Service Endpoints** - Automatically redirect to pods based on selectors
4. **DNS Services** - Creates DNS records for each service
5. **Load Balancer** - Service names auto-resolve to DNS with built-in LB + proxy

#### 🎓 Tutorial Resources

**Sample Projects:**
1. [Kubernetes Dev Environment](https://github.com/janakiramm/Kubernetes-dev-env)
2. [Kubernetes 101](https://github.com/janakiramm/kubernetes-101)
3. [Multi-Container Pods](https://github.com/janakiramm/Kubernetes-multi-container-pod)

#### 🔍 Common Operations

```bash
# Get cluster components status
kubectl get cs

# View all pods with labels
kubectl get pods --show-labels

# Describe service endpoints
kubectl describe endpoints <service-name>

# Check DNS resolution
kubectl exec -it <pod-name> -- nslookup <service-name>
```

---

### [DCOS Local Universe](../dcos-local-universe.md)
DC/OS local universe creation for offline deployments:

#### 📦 Setup Steps

**1. Clone Repository:**
```bash
git clone https://github.com/mesosphere/universe
cd universe
```

**2. Install Python 3:**
```bash
# Find Python 3 package
yum provides python3

# Install corresponding package
yum install python3
```

**3. Install Docker:**
```bash
# Install Docker
yum install docker

# Start daemon
systemctl start docker
systemctl enable docker
```

**4. Docker Proxy Configuration:**
```bash
# Create directory
sudo mkdir -p /etc/systemd/system/docker.service.d

# Create proxy config
sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf
```

**Add to http-proxy.conf:**
```ini
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:8080"
Environment="HTTPS_PROXY=https://proxy.example.com:8080"
Environment="NO_PROXY=localhost,127.0.0.1"
```

**5. Reload and Restart:**
```bash
# Reload systemd
sudo systemctl daemon-reload

# Restart Docker
sudo systemctl restart docker

# Verify proxy settings
systemctl show --property=Environment docker
```

**6. Configure Universe:**
```bash
# Modify JSON files:
# - marathon.json
# - config.json
# - package.json
# - resource.json
```

#### 📚 Reference
- [Docker HTTP/HTTPS Proxy](https://docs.docker.com/engine/admin/systemd/#httphttps-proxy)

---

## 🔗 Related Documents

- [Docker Commands](../docker.md) - Container management basics
- [Blogs & References](../blogs.md) - Container technology articles

---

## 💡 Best Practices

### Kubernetes

1. **Resource Limits**
   ```yaml
   resources:
     requests:
       memory: "64Mi"
       cpu: "250m"
     limits:
       memory: "128Mi"
       cpu: "500m"
   ```

2. **Health Checks**
   ```yaml
   livenessProbe:
     httpGet:
       path: /health
       port: 8080
   readinessProbe:
     httpGet:
       path: /ready
       port: 8080
   ```

3. **ConfigMaps & Secrets**
   - Use ConfigMaps for non-sensitive configuration
   - Use Secrets for passwords, tokens, keys
   - Mount as volumes or environment variables

4. **Namespaces**
   - Separate environments (dev, staging, prod)
   - Isolate teams and projects
   - Apply resource quotas per namespace

5. **Service Types**
   - **ClusterIP**: Internal cluster communication (default)
   - **NodePort**: Expose on each node's IP
   - **LoadBalancer**: Cloud provider load balancer
   - **ExternalName**: CNAME record for external service

### DC/OS

1. **Proxy Configuration**
   - Always configure Docker proxy in enterprise environments
   - Test proxy with: `curl --proxy http://proxy:8080 https://example.com`

2. **Offline Deployment**
   - Build local universe for air-gapped environments
   - Keep local package repository updated
   - Document custom configuration changes

3. **Marathon Configuration**
   - Use JSON validation before deployment
   - Version control all JSON configuration files
   - Test in local universe before production

---

## 🔍 Quick Reference

### Kubernetes Commands

```bash
# Cluster Info
kubectl cluster-info
kubectl get nodes
kubectl get cs

# Pods
kubectl get pods -A
kubectl describe pod <pod-name>
kubectl logs <pod-name>
kubectl exec -it <pod-name> -- /bin/bash

# Services
kubectl get svc
kubectl describe svc <service-name>
kubectl expose deployment <name> --port=80

# Deployments
kubectl get deployments
kubectl scale deployment <name> --replicas=3
kubectl rollout status deployment/<name>

# ConfigMaps & Secrets
kubectl create configmap <name> --from-file=<path>
kubectl create secret generic <name> --from-literal=key=value

# Debugging
kubectl describe pod <name>
kubectl logs <name> --previous
kubectl top nodes
kubectl top pods
```

### DC/OS Commands

```bash
# Service Management
dcos service list
dcos service log <service-name>

# Marathon
dcos marathon app list
dcos marathon app add <config.json>
dcos marathon app remove <app-id>

# Package Management
dcos package list
dcos package install <package>
dcos package uninstall <package>

# Node Management
dcos node list
dcos node ssh <node-id>
```

---

## 📚 Additional Resources

**Kubernetes:**
- [Official Documentation](https://kubernetes.io/docs/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Kubernetes Patterns](https://k8spatterns.io/)

**DC/OS:**
- [DC/OS Documentation](https://dcos.io/docs/)
- [Mesosphere Universe](https://github.com/mesosphere/universe)

---

*Part of [Technical Documentation Repository](../README.md)*
