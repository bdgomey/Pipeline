pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    environment {
        DOCKERHUB_CREDENTIALS=credentials('Docker')
        AWS=credentials('AWS')
    }
    stages {
        stage('Build image') {
            steps {
                sh 'mvn clean install'
                sh 'docker build -t bjgomes/maven:latest .'
            }
        }
        stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('push image') {
            steps {
                sh 'docker push bjgomes/maven:latest'
            }
        }
        stage ('K8S Deploy') {
            steps {
                withAWS(credentials: 'AWS', region: 'us-east-2')
                sh 'kubectl apply -f deployment.yaml'
            }
        }
        stage ('K8S Service') {
            steps {
                withAWS(credentials: 'AWS', region: 'us-east-2')
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
