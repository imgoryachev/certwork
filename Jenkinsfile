pipeline{
    agent any
    tools {
        terraform 'terraform'
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        sshCredsID = 'ssh_key'
        registryCredsID = 'AWS_ECR_CREDENTIALS'
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
        stage('Check instances DNS names'){
            steps{
                script {
                    appBuilderDnsName = sh(
                    script: "terraform output -raw app_builder_dns_name",
                        returnStdout: true
                    ).trim()
                    prodServerDnsName = sh(
                        script: "terraform output -raw prod_server_dns_name",
                        returnStdout: true
                    ).trim()
                }
            }
        }
        stage('build image and push to awsecr'){
            environment {
                DOCKER_HOST="ssh://ubuntu@$(appBuilderDnsName)"
            }
            steps{
                sshagent( credentials:["${sshCredsID}"] ) {
                    sh "docker build -t boxfuse ."
                    sh "docker tag boxfuse 129701213363.dkr.ecr.us-east-1.amazonaws.com/cert_work_goryachev:boxfuse"
                }
            }
            steps{
                sshagent( credentials:["${sshCredsID}"] ) {
                    withDockerRegistry( [credentialsId:"${registryCredsID}", url:"https://129701213363.dkr.ecr.us-east-1.amazonaws.com"] ) {
                        sh "docker push 129701213363.dkr.ecr.us-east-1.amazonaws.com/cert_work_goryachev:boxfuse"
                    }
                }
            }
        }    
    }
}
