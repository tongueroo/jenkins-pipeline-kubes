# Pod Docker Image

The Dockerfile in this folder is used to build the pod that is used for the Jenkins Kubernetes pod workers.

* It's ubuntu based
* It has ruby installed
* It has the kubes tool installed

## Build Commands

    docker build -t gcr.io/boltops-learn/jenkins-worker .
    docker push gcr.io/boltops-learn/jenkins-worker
