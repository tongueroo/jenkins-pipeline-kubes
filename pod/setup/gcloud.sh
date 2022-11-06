#!/bin/bash -eux
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-408.0.1-linux-x86_64.tar.gz
tar -xf google-cloud-cli-408.0.1-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
ln -s /google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud

# so gcloud container clusters get-credentials works
# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
gcloud components install gke-gcloud-auth-plugin -q

gcloud components install docker-credential-gcr -q
