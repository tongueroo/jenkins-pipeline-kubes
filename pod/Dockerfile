FROM ubuntu
RUN apt-get update && apt-get install ruby -y
RUN gem install kubes --no-document

RUN apt-get update && apt-get install curl -y

COPY setup/kubectl.sh setup/kubectl.sh
RUN setup/kubectl.sh

COPY setup/gcloud.sh setup/gcloud.sh
RUN setup/gcloud.sh

COPY setup/docker.sh setup/docker.sh
RUN setup/docker.sh

ENV PATH="/google-cloud-sdk/bin:${PATH}"
