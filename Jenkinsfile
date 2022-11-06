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
                container('shell') {
                    sh '''#!/bin/bash -eux
                        git config --global --add safe.directory /home/jenkins/agent/workspace/jenkins-pipeline-kubes
                        gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
                        gcloud container clusters get-credentials dev-cluster --zone us-central1-a --project boltops-learn
                        kubes deploy
                    '''
                }
            }
        }
    }
}
