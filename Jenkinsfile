pipeline {
    agent {
        kubernetes {
            yamlFile 'pod.yaml'
        }
    }

    parameters {
        string(name: 'ENV_NAME', defaultValue: 'dev', description: 'Environment name')
    }

    environment {
        // This is a path
        GOOGLE_APPLICATION_CREDENTIALS = credentials("google-creds") // Jenkins Credentials Secret File
    }

    stages {
        stage('Main') {
            steps {
                container('shell') {
                    sh '''#!/bin/bash
                        pwd
                        whoami
                        hostname
                        echo "ENV_NAME: $ENV_NAME"
                        type ruby
                        ruby -v
                        type kubes
                        kubes -v

                        curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-408.0.1-linux-x86_64.tar.gz
                        tar -xf google-cloud-cli-408.0.1-linux-x86_64.tar.gz
                        ./google-cloud-sdk/install.sh

                        gcloud container clusters get-credentials dev-cluster --zone us-central1-a --project boltops-learn
                        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
                        mv kubectl /usr/local/bin/kubectl
                        chmod +x /usr/local/bin/kubectl
                        type kubectl

                    '''
                }
            }
        }
    }
}
