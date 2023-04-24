pipeline {
    agent any
    environment {
        SSH_CRED = credentials('deploy-key')
        def CONNECT = 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-44-203-119-144.compute-1.amazonaws.com'
    }
    stages {
        
        stage('Build') {
            steps {
                echo 'packaging app'
                sh "ls"
                sh "pwd"
                sh "zip -r webapp.zip ."
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying'
                sshagent(['deploy-key']) {
                    sh 'scp -o StrictHostKeyChecking=no -i $SSH_CRED webapp.zip ubuntu@ec2-44-203-119-144.compute-1.amazonaws.com:/home/ubuntu'
                    sh '$CONNECT "curl ifconfig.io"'
                    sh '$CONNECT "sudo apt install zip -y"'
                    sh '$CONNECT "rm -rf /var/www/html/"'
                    sh '$CONNECT "mkdir /var/www/html/"'
                    // sh '$CONNECT "unzip /home/ubuntu/webapp.zip -d /home/ubuntu/app"'
                    sh '$CONNECT "unzip webapp.zip -d /var/www/html/"'
                    sh '$CONNECT "rm /var/www/html/config/connect.php"'
                    sh '$CONNECT "cp /home/ubuntu/connect.php /var/www/html/config/"'
                    sh '$CONNECT "sudo sh /var/www/html/database/test-db.sh"'
                    
                    // sh '$CONNECT "cp -r /home/ubuntu/app/. /var/www/html/"'
                    
                }
            }
        }

        stage('Clean-Up') {
            steps {
                echo 'Remove existing files'
                sshagent(['deploy-key']) {
                    sh '$CONNECT "sudo rm /home/ubuntu/webapp.zip"'
                }
            }
        }
    }
}
