pipeline{
    agent any
    tools{
        maven "maven"
    }
    stages{
        stage("git clone"){
            steps{
                git branch: 'main', url: 'http://github.com/gopi720/airtelcare2.git'
            }
        }
        stage("build project"){
            steps{
                sh 'mvn clean verify'
            }
        }
        stage("terraform install"){
            steps{
                sh '''sudo chmod 600 installations.sh
                sh installations.sh'''
            }
        }
        stage("awscli installaton"){
            steps{
                sh 'sudo apt install -y awscli'
            }
        }
    }
}