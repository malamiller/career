pipeline {
    agent any
    environment {
        SSH_CRED = credentials('web-server-key')
        def CONNECT = 'ssh -o StrictHostKeyChecking=no ubuntu@54.174.143.215'
    }
    stages {
        
        stage('Build') {
            steps {
                echo 'packaging app'
                sh "ls -la"
                sh "pwd"
                
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sh 'ssh -tt -i $SSH_CRED -o StrictHostKeyChecking=no ubuntu@54.174.143.215'
                sshagent(['web-server-key']) {
                    sh '$CONNECT "curl ifconfig.io"'
                }
            }
        }
    }
}