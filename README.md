## Simple k8s setup
Demonstrates MongoDB and Mongo Express deployments utilizing LoadBalancer and ClusterIP services. Internal pod interaction via ClusterIP and external access to MongoDB provided through a user-friendly interface via LoadBalancer. Convenience scripts are added.

![Cluster](https://github.com/AnelMusic/kubernetes_mongodb_express_usecase_internal_external_communication/assets/32487291/c5b59417-51de-4369-a09b-44e5e85f235e)

The project involves the setup of a MongoExpress application serving as a fundamental Admin UI, facilitating interaction with a MongoDB database within a Kubernetes cluster. Here are the key details:

- **MongoExpress Pod**:
  - Functions as a basic Admin UI interface to manage the MongoDB database.
  - Connects internally to the MongoDB database within the cluster.
  - Exposes port 8081 internally via the `mongo-express-service` to enable communication within the cluster.

- **Services**:
  - **mongo-express-service**:
    - Allows internal communication within the Kubernetes cluster for the MongoExpress Pod via the standard port 8081.
  - **LoadBalancer Service (External)**:
    - Exposes a LoadBalancer Service with nodePort 30000 to facilitate external communication from outside the Kubernetes cluster.
    - Enables access to the MongoExpress UI externally, allowing users outside the cluster to interact with the MongoExpress Pod through port 30000.

- **MongoDB Pod**:
  - Interacts with the MongoExpress Pod using the `mongodb-service`.
  - Communication occurs via the standard MongoDB port 27017.
  - Does not allow direct external communication for security reasons, restricting access to the MongoDB Pod from outside the Kubernetes cluster.

This setup ensures that internal cluster communication occurs seamlessly between the MongoExpress Pod and the MongoDB Pod. External users or systems can interact with the MongoExpress UI through the LoadBalancer Service's nodePort 30000 while maintaining strict security measures by disallowing direct external access to the MongoDB Pod.

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

## Basic Workflows

#### 1. Fork project.
(https://github.com/AnelMusic/kubernetes_mongodb_express_usecase_internal_external_communication/fork)

#### 2. Create .env file with the following content:
```bash
MONGODB_ROOT_USERNAME=$YOUR_USER_NAME e.g username
MONGODB_ROOT_USERPASSWORD=$YOUR_USER_NAME e.g password
```
#### 3. Run convenienec script:
> This will extract your username and password from .env file, base64 encode them and into mongodb-secret.yaml.
> Then it will apply secrets and configmaps as well as deployments in the right order using kubectl
```bash
run.bat
```

#### Note: Make sure minikube is running + that on windows powershell is executed in admin mode



