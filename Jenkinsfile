pipeline {
    agent any
    stages {
        environment {
            SSH_CRED = credentials('us-east-key')
        }
        stage('Build') {
            steps {
                echo 'packaging app'
                sh "ls"
                sh "pwd"
                sh "echo $SSH_CRED"
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}