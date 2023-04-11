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
                    sh '$CONNECT "sudo apt install zip -y"'
                    sh '$CONNECT "unzip -d /home/ubuntu/app /home/ubuntu/webapp.zip"'
                    sh '$CONNECT "cp -r /home/ubuntu/app/* /var/www/html/"'
                }
            }
        }

        stage('Clean-Up') {
            steps {
                echo 'Remove existing files'
                sshagent(['web-server-key']) {
                    sh '$CONNECT "sudo rm -r /home/ubuntu/app"'
                    sh '$CONNECT "sudo rm /home/ubuntu/webapp.zip"'
                }
            }
        }
    }
}