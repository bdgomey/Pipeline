pipeline {
    agent any
    environment {
        registry = 'bjgomes/maven'
        registryCredential = 'Docker'
    }
    stages {
        stage('Build image') {
            steps {
                docker.build registry + ':latest'
            }
        }
        stage('push image') {
            steps {
                docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo this step saved for kubernetes!!!!'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}

