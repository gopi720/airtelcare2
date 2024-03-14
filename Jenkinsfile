pipeline{
    agent {
        label 'node2'
    }
    tools{
        maven "maven"
        terraform "Terraform"
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
        stage("terraform"){
            steps{
                sh 'terraform init'
                script{
                    withCredentials([string(credentialsId: 'accesskey', variable: 'accesskey'), string(credentialsId: 'secretkey', variable: 'secretkey')]) {
                     sh '''
                      terraform plan -var accesskey=${accesskey} -var secretkey=${secretkey} --auto-approve
                      terraform apply -var accesskey=${accesskey} -var secretkey=${secretkey} --auto-approve '''
                    }
                }
            }  
        }
    }
}