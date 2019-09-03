# azdmlrn-aks-cluster
AKS cluster on my personal Azure tenant and Azure DevOps azdmlrn organisation. This is used for personal and learning purposes, and hopefully a helpful resource for others.

# Kubernetes Monitoring Tools
| Tool | URL |
| --- | --- |
| Kubeman | https://github.com/dalemorson/kubeman |
| Octent | https://github.com/vmware/octant |
| Web UI (Dashboard) | https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/ |

# Deployment Resources
| Resource | URL |
| --- | --- | 
| cert-manager | https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html |

# Kubernetes Resources and Reading

| Website | URL |
| --- | --- |
| Linode | https://www.linode.com/docs/applications/containers/kubernetes/ |

# Getting Started
## Connect from new device using WSL2
Need to set everything up on my Surface Go running WSL2.

### Install dependencies
~~~bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
~~~

### Connect and install AKS Cluster
~~~bash
az login
az aks install-cli
az aks get-credentials --resource-group azdmlrn-aks-rg --name azdmlrn-aks-cluster
~~~

### Confirm
~~~bash
kubectl cluster-info
kubectl config get-contexts
~~~
