pipeline {
    agent any
    environment {
        SSH_CRED = credentials('us-east-key')
    }
    stages {
        
        stage('Build') {
            steps {
                echo 'packaging app'
                sh "ls"
                sh "pwd"
                sh 'echo $SSH_CRED'
                sshagent(['us-east-key']) {
                    sh 'ssh ubuntu@ec2-52-91-76-233.compute-1.amazonaws.com "curl ifconfig.io"'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
            }
        }
    }
}