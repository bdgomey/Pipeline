# Create VM in AWS

## run setup.sh script once VM is provisioned

    chmod +x setup.sh
    sudo ./setup.sh

## Run the following commands

    sudo usermod -aG docker $USER
    sudo usermod -aG docker jenkins
    export PATH=/opt/maven/bin:$PATH
    sudo service jenkins restart
    restart terminal

___


# Configure Jenkins

## Login to jenkins and create account

    sudo cat /var/lib/jenkins/secrets/initialAdminPassword

## Set up jenkins tools

    install suggested plugins
    install plugins
        1. maven integration
        2. maven invoker
        3. docker
        4. docker pipeline
        5. kubernetes
        6. kubernetes cli
        7. blue ocean
    set up global tools
        1. jdk: 
           1. Name: JAVA_HOME
           2. JAVA_HOME: /usr/lib/jvm/java-11-openjdk-amd64/
        2. Git
           1. Name: Git
           2. path to git: /usr/bin/git
        3. Maven
           1. Name: Maven
           2. MAVEN_HOME: /opt/maven

## set-up credentials in jenkins

    add docker creds
    add aws creds

___

# Run first pipeline

    1. create pipeline in jenkins
    2. initialize github webhook 
       1. http://<public-IP>/github-webhook/
    3. Set up docker credentials using token

run pipeline
___
# Set up EKS Clusters and deploy to production

## Set up AWS

    Ensure AWSCLI is installed (sudo apt install awscli)
    add global credentials (aws configure)

## Set up EKS    

    eksctl get clusters
    eksctl delete cluster --name name

