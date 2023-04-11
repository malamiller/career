pipeline {
    agent any
    environment {
        SSH_CRED = credentials('web-server-key')
        def CONNECT = 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-54-174-143-215.compute-1.amazonaws.com'
    }
    stages {
        
        stage('Build') {
            steps {
                echo 'packaging app'
                sh "ls"
                sh "pwd"
                
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sh 'echo $SSH_CRED'
                sshagent(['web-server-key']) {
                    sh '$CONNECT "curl ifconfig.io"'
                }
            }
        }
    }
}