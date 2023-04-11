pipeline {
    agent any
    environment {
        SSH_CRED = credentials('web-server-key')
        def CONNECT = 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-91-17-246.compute-1.amazonaws.com'
    }
    stages {
        
        stage('Build') {
            steps {
                echo 'packaging app'
                sh "ls"
                sh "pwd"
                sh 'echo $SSH_CRED'
                
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sshagent(['web-server-key']) {
                    sh '$CONNECT "curl ifconfig.io"'
                }
            }
        }
    }
}