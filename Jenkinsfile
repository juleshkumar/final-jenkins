pipeline {
    agent any

    parameters {
        string(name: 'EC2_IP', defaultValue: '3.7.209.143', description: 'EC2 IP Address')
        string(name: 'region', defaultValue: 'ap-south-1', description: 'Region')
        string(name: 'output', defaultValue: 'text', description: 'Output format')
        string(name: 'cluster-name', defaultValue: 'eks-decimal-test', description: 'eks cluster name')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Deploy in EC2') {
            steps {
                script {
                    def inventoryContent = "[ec2]\n${params.EC2_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                    sh "echo '${inventoryContent}' > inventory.ini"

                    git branch: 'ansible', url: 'https://github.com/juleshkumar/final-jenkins.git'
                    
                    sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'cluster_name=${params['cluster-name']} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} region=${params.region}'"
                }
            }
        }
    }
}
