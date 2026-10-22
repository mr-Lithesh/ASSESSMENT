pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'municipalcorp/road-hazard-portal:latest'
    }

    stages {
        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Safe roll-out deployment strategy
                    sh "kubectl apply -f deployment.yaml"
                    sh "kubectl rollout status deployment/road-hazard-portal"
                }
            }
        }
    }

    post {
        failure {
            echo "Deployment Failed! Initiating automated safe rollback mechanism..."
            sh "kubectl rollout undo deployment/road-hazard-portal"
        }
    }
}
