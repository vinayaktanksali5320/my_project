pipeline {
    agent any
    environment {
        // Define Docker Hub credentials ID stored in Jenkins credentials store
        DOCKERHUB_CREDS = credentials('dockerhub')
    }
    stages {
        stage('Clone Repo') {
            steps {
                checkout scm
                sh 'ls -l'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t vinayaktanksali/project:$BUILD_NUMBER .'
            }
        }
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin' 
            }
        }
        stage('Docker PUSH') {
            steps {
                sh 'docker push vinayaktanksali/project:$BUILD_NUMBER' 
            }
        }
    }
    post {
        always {
            sh 'docker logout'
            sh 'docker system prune -af'
            echo "Pipeline finished successfully"         
        }
    }
}