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
                sh 'zip -r /var/lib/jenkins/workspace/webapp.zip  /var/lib/jenkins/workspace/web-app'
                sh 'echo $SSH_CRED'
                
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sshagent(['web-server-key']) {
                    sh 'scp -i $SSH_CRED /var/lib/jenkins/workspace/webapp.zip ubuntu@ec2-3-91-17-246.compute-1.amazonaws.com:/home/ubuntu'
                    sh '$CONNECT "curl ifconfig.io"'
                    sh '$CONNECT "sudo apt install zip"'
                    sh '$CONNECT "zip -d /home/ubuntu /home/ubuntu/webapp.zip"'
                }
            }
        }
    }
}