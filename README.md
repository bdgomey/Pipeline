run setup.sh script


sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
export PATH=/opt/maven/bin:$PATH
sudo service jenkins restart
restart terminal
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
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

Set up EKS Clusters and deploy to production

Set up AWS

    Ensure AWSCLI is installed (sudo apt install awscli)
    add global credentials (aws configure)

Set up EKS

    

    eksctl get clusters
    eksctl delete cluster --name name

