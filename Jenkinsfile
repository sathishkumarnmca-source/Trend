pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t trendstore .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker tag trendstore:latest sathishdocker3011/trendstore:latest'
                    sh 'docker push sathishdocker3011/trendstore:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy stage goes here'
            }
        }
    }
}

