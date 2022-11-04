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
                        env | sort
                    '''
                }
            }
        }
    }
}
