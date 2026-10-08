pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t ghcr.io/padmapriya2121/django-docker-project:latest .'
            }
        }

        stage('Login to GHCR') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'ghcr-credentials',
                    usernameVariable: 'GHCR_USERNAME',
                    passwordVariable: 'GHCR_TOKEN'
                )]) {
                    bat 'echo %GHCR_TOKEN% | docker login ghcr.io -u %GHCR_USERNAME% --password-stdin'
                }
            }
        }

        stage('Push to GHCR') {
            steps {
                bat 'docker push ghcr.io/padmapriya2121/django-docker-project:latest'
            }
        }
    }
}