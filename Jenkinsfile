pipeline {
    agent any
    environment {
        SSH_CRED = credentials('web-server-key')
        def CONNECT = 'ssh -o ubuntu@54.174.143.215'
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
                sshagent(['web-server-key']) {
                    sh '$CONNECT "curl ifconfig.io"'
                }
            }
        }
    }
}