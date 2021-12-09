pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    environment {
        DOCKERHUB_CREDENTIALS=credentials('Docker')
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
                sh 'kubectl apply -f deployment.yaml'
            }
        }
        stage ('K8S Service') {
            steps {
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
