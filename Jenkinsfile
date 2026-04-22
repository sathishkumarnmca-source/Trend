pipeline {
    agent any

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
