pipeline {
    agent any

    parameters {
        string(name: 'region', defaultValue: 'ap-south-1', description: 'Region')
        string(name: 'output', defaultValue: 'text', description: 'Output format')
        string(name: 'namespace', defaultValue: 'vrt', description: 'Namespace')
        string(name: 'consul_version', defaultValue: '10.14.3', description: 'version')
        string(name: 'elasticsearch_version', defaultValue: '19.13.10', description: 'version')
        string(name: 'nginx_version', defaultValue: '9.2.22', description: 'version')
        string(name: 'kafka_version', defaultValue: '18.0.3', description: 'version')
        string(name: 'logstash_version', defaultValue: '5.1.13', description: 'version')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Ansbile dir creation') {
            steps {
                script {
                    git branch: 'ansible-pipeline', url: 'https://github.com/juleshkumar/final-jenkins.git'
                    dir('julesh-terraform/environments/dev/Ansible') {
                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'efs_dns_name=${env.EFS_DNS_NAME} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} region=${params.region}'"
                }
            }
        }
}
        stage('Tools Deploy') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/Tools') {

                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"

                    
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'efs_id=${env.EFS_ID} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace} region=${params.region} cluster_name=${params['cluster-name']} consul_version=${params.consul_version} elasticsearch_version=${params.elasticsearch_version} kafka_version=${params.kafka_version} nginx_ic_version=${params.nginx_version} logstash_version=${params.logstash_version}'"
                    }
                }
            }
        }
        stage('Apps Deploy') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/Apps') {

                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"

                    
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'redis_host=${env.redis_endpoint} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace}'"
                    }
                }
            }
        }
    }
}
