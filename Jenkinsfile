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
        
        stage('package') {
            steps {
                echo 'upload artifcats'
                sh "curl -v -u admin:admin123 --upload-file webapp.zip http://44.203.195.37:8081/repository/career-repo/webapp.zip"
            }
        }  
      }
}