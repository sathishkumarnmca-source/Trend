pipeline {
    agent any
 environment {
        DOCKERHUB_USER = credentials('sathishdocker3011')
        DOCKERHUB_PASS = credentials('Admin@123')
        IMAGE_NAME = "trend-app"
        DOCKER_REPO = "sathishdocker3011/trend-app"
    }


    stages {
        stage('Build') {
            steps {
                sh 'docker build -t trend-app .'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push sathishdocker3011/trend-app:latest'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
