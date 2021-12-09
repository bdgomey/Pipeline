node ("jenkins_slave") {
  def image
  def mvnHome = tool 'Maven3'
     stage ('checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/bdgomey/Pipeline.git']]])      
        }
   
    stage ('Build') {
            sh 'mvn clean install'           
        }
       
       
    stage ('Docker Build') {
         // Build and push image with Jenkins' docker-plugin
            withDockerRegistry([credentialsId: "Docker", url: "https://index.docker.io/v1/"]) {
            image = docker.build("bjgomes/maven")
            image.push()    
            }
        }

      stage ('K8S Deploy') {
       
                kubernetesDeploy(
                    configs: 'deployment.yaml',
                    kubeconfigId: 'K8S',
                    enableConfigSubstitution: true
                    )               
        }
    
}
