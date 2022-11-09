pipeline{
    agent any
    tools {
        terraform 'terraform'
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        sshCredsID = 'ssh_key'
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
        stage('Ansible playbook'){
            steps{
                ansiblePlaybook(
                    playbook: 'playbook.yml',
                    inventory: 'aws.yml',
                    credentialsId: "${sshCredsID}",
                    disableHostKeyChecking: true,
                    become: true,
                )
            }
        }
    }
}
