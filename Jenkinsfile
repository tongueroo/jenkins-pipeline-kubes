pipeline {
    agent {
        kubernetes {
            yamlFile 'pod.yaml'
        }
    }

    parameters {
        string(name: 'ENV_NAME', defaultValue: 'dev', description: 'Environment name')
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
                    '''
                }
            }
        }
    }
}
