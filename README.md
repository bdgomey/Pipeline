install Java

    yes "" | command
    sudo apt-get update
    sudo apt install openjdk-11-jdk -y
    
Install Maven

    cd /opt
    sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
    sudo tar -xzvf apache-maven-3.8.4-bin.tar.gz
    sudo mv apache-maven-3.8.4 maven
    sudo rm -rf apache-maven-3.8.4-bin.tar.gz

Install git

    sudo apt install git
    git config --global user.name "Brian"
    git config --global user.email "brian.james.gomes@gmail.com"



Install Jenkins

    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
        /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
        https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins

Install Docker

    sudo apt install docker.io -y
    sudo usermod -aG docker $USER
    sudo usermod -aG docker jenkins

sudo service jenkins restart
Restart terminal
___


Configure Jenkins

    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
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

Run first job

    do a top level maven job to show maven is working

Run first pipeline

    1. create pipeline
    2. initialize github webhook with webhook relay

        set up webhook with Github


            install WebHookRelay
                1. sudo wget -O /usr/local/bin/relay https://storage.googleapis.com/webhookrelay/downloads/relay-linux-amd64
                2. sudo chmod +wx /usr/local/bin/relay
                3. Login
                1. relay login -k your-token-key -s your-token-secret
                4. Set up forwarding
                1. relay forward --bucket github-jenkins http://localhost:8080/github-webhook/

            Guide: https://webhookrelay.com/blog/2017/11/23/github-jenkins-guide/
    3. Set up docker credentials using token

run pipeline

Set up AWS

    Ensure AWSCLI is installed (sudo apt install awscli)
    add global credentials (aws configure)

Set up EKS

    download and install eksctl
        curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
        sudo mv /tmp/eksctl /usr/local/bin
    
    create cluster
        eksctl create cluster --name name --region us-east-2 --node-type t3.micro --nodes 2


    eksctl get clusters
    eksctl delete cluster --name name

