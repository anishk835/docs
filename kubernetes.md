# To install multi-node cluster refer the below link :
https://github.com/coreos/coreos-kubernetes/tree/master/multi-node/vagrant


# Supervisord : 
1. mix of docker and kublet

   http://supervisord.org/

# Fluentd : 
1. Logging in kubernetes

   https://docs.fluentd.org/v0.12/articles/quickstart

# Commands to check the health of cluster :
  `kubectl get cs`

`{nameofservice}.default.svc.cluster.local`

* kube proxy ip tables will do the re-direction to the pod running on the node of kubernetes cluster and based upon selector. Actually when we try to hit any node then service end point take the control and use selector and redirect to specific node running pod without any performance compromise.
* Using label and selectors we can assign node to run pod
* Never use or pass file options to delete any service or deployments
* DNS services creates set of dns records for each services and pods in other name space can access the service by adding name space to dns path e.g. `{my-service}.{my-namespace}`

# LoadBalanced port
`{actual service name}.default.svc.cluster.local`
* Using the service name it will automatically resolve to DNS within kubernetes and is combination of load balancer and proxy.

# Kubernetes tutorial practice sample :
1. https://github.com/janakiramm/Kubernetes-dev-env
2. https://github.com/janakiramm/kubernetes-101
3. https://github.com/janakiramm/Kubernetes-multi-container-pod
