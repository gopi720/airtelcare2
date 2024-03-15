pipeline{
    agent any
    tools{
        maven "maven"
        terraform "Terraform"
        ansible "ansible"
    }
    parameters {
        choice(
            name: 'SELECT', // Name of the parameter
            choices: ['create', 'destroy'], // List of available choices
            description: 'Select the option to deploy to' // Description for the user
        )
    }
    stages{
        stage("git clone"){
            when {
                expression {
                    params.SELECT == 'create' 
                }
            }
            steps{
                git branch: 'main', url: 'http://github.com/gopi720/airtelcare2.git'
            }
        }
        stage("build project"){
            when {
                expression {
                    params.SELECT == 'create' 
                }
            }
            steps{
                sh 'mvn clean verify'
            }
        }
        stage("terraform"){
            when {
                expression {
                    params.SELECT == 'create' 
                }
            }
            steps{
                sh 'terraform init'
                script{
                    withCredentials([string(credentialsId: 'accesskey', variable: 'accesskey'), string(credentialsId: 'secretkey', variable: 'secretkey')]) {
                     sh '''
                      terraform plan -var accesskey=${accesskey} -var secretkey=${secretkey} 
                      terraform apply -var accesskey=${accesskey} -var secretkey=${secretkey} -auto-approve '''
                    }
                }
            }  
        }
        stage("terraform destroy"){
            when {
                expression {
                    params.SELECT == 'destroy' 
                }
            }
            steps{
               script{
                    withCredentials([string(credentialsId: 'accesskey', variable: 'accesskey'), string(credentialsId: 'secretkey', variable: 'secretkey')]) {
                     sh 'terraform destroy -var accesskey=${accesskey} -var secretkey=${secretkey} -auto-approve '
                    }
                } 
            }
        }
        stage("playbookrun"){
            when {
                expression {
                    params.SELECT == 'create' 
                }
            }
            steps{
                script{
                    ansiblePlaybook credentialsId: 'ansible-ssh-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'host', playbook: 'playbook.yml'
                }
            }
            
        }
    }
}