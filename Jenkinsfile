pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
    stages{
        stage('Git repo'){
            steps{
                git branch: 'main', credentialsId: '4ffc5d7e-a258-4b64-b1c8-65af28fd0a0a', url: 'https://github.com/imgoryachev/certwork.git'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }

}