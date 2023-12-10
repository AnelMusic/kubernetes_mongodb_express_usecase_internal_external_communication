## Simple k8s setup
Demonstrates MongoDB and Mongo Express deployments utilizing LoadBalancer and ClusterIP services. Internal pod interaction via ClusterIP and external access to MongoDB provided through a user-friendly interface via LoadBalancer. Convenience scripts are added.

![Cluster](https://github.com/AnelMusic/kubernetes_mongodb_express_usecase_internal_external_communication/assets/32487291/c5b59417-51de-4369-a09b-44e5e85f235e)


### Prerequisites
- **Minikube:** Ensure [Minikube](https://minikube.sigs.k8s.io/docs/start/) is installed. It helps create and manage local Kubernetes clusters.
- **kubectl:** Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/), the Kubernetes command-line tool, to interact with Kubernetes clusters.

### Directory structure
```bash
configmaps/
└── mongodb-configmap.yaml                    

deployments/
├── mongodb
└── mongoexpress.yaml

secrets/
└──mongodb-secret.yaml

.env
apply_k8s_components.bat
run.bat
set_secrets.bat
```
