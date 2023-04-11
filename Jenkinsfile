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
                sh 'zip -r webapp.zip .'
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
                    sh '$CONNECT "rm -rf /var/www/html/*"'
                    // sh '$CONNECT "unzip /home/ubuntu/webapp.zip -d /home/ubuntu/app"'
                    sh '$CONNECT "unzip /home/ubuntu/webapp.zip -d /var/www/html/"'
                    sh '$CONNECT "rm /var/www/html/config/connect.php"'
                    sh '$CONNECT "cp /home/ubuntu/connect.php /var/www/html/config/"'
                    // sh '$CONNECT "cp -r /home/ubuntu/app/. /var/www/html/"'
                    
                }
            }
        }

        stage('Clean-Up') {
            steps {
                echo 'Remove existing files'
                sshagent(['web-server-key']) {
                    sh '$CONNECT "sudo rm /home/ubuntu/webapp.zip"'
                }
            }
        }
    }
}