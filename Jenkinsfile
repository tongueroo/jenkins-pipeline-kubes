pipeline {
    agent {
        kubernetes {
            yamlFile 'pod.yaml'
        }
    }

    parameters {
        string(name: 'ENV_NAME', defaultValue: 'dev', description: 'Environment name')
        string(name: 'REPO', defaultValue: 'gcr.io/boltops-learn/jenkins-demo')
    }

    environment {
        // This is a path
        GOOGLE_APPLICATION_CREDENTIALS = credentials("google-creds") // Jenkins Credentials Secret File
    }

    stages {
        stage('Main') {
            steps {
                // container('docker') {
                //     sh '''#!/bin/bash -eux
                //         docker build -t test .
                //     '''
                // }
                container('shell') {
                    sh '''#!/bin/bash -eux
                        pwd
                        whoami
                        hostname
                        echo "ENV_NAME: $ENV_NAME"
                        echo "REPO: $REPO"
                        type ruby
                        ruby -v
                        type kubes
                        kubes -v
                        export USE_GKE_GCLOUD_AUTH_PLUGIN=True

                        git config --global --add safe.directory /home/jenkins/agent/workspace/jenkins-pipeline-kubes

                        type gcloud
                        gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
                        gcloud container clusters get-credentials dev-cluster --zone us-central1-a --project boltops-learn

                        type kubectl

                        type docker

                        kubes deploy
                    '''
                }
            }
        }
    }
}
