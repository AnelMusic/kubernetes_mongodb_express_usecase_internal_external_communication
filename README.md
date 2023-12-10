# kubernetes_mongodb_express_usecase_internal_external_communication
Minikube-powered Kubernetes cluster setup showcasing internal and external pod communication. Demonstrates MongoDB and Mongo Express deployments utilizing LoadBalancer and ClusterIP services. Internal pod interaction via ClusterIP and external access to MongoDB provided through a user-friendly interface via LoadBalancer. 


## Directory structure
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
