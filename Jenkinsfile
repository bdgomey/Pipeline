pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        CREDENTIALS=credentials('Docker')
        AWS_Credentials=('AWS')
    }
    stages {
        stage('clean and package') {
            steps {
                sh 'mvn clean package install'
            }
        }
        
        stage('Build image') {
            steps {
                sh 'docker build -t bjgomes/maven:latest .'
            }
        }
        stage('Login') {
			steps {
				sh 'echo $CREDENTIALS_PSW | docker login -u $CREDENTIALS_USR --password-stdin'
			}
		}
        stage('push image') {
            steps {
                sh 'docker push bjgomes/maven:latest'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo this step saved for kubernetes!!!'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}

