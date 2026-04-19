pipeline {
    agent any

    environment {
        DOCKERHUB_USER = credentials('sathishdocker3011')   // Jenkins credential ID
        DOCKERHUB_PASS = credentials('Admin@123')   // Jenkins credential ID
        IMAGE_NAME = "trend-app"
        DOCKER_REPO = "sathishdocker3011/trend-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sathishkumarnmca-source/Trend.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_REPO:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
                sh 'docker push $DOCKER_REPO:latest'
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed. Check logs.'
        }
    }
}
