pipeline {
    agent any

    parameters {
        string(name: 'INSTANCE_PUBLIC_IP', defaultValue: '13.201.141.73', description: 'jumpbox-instance-ip')
        string(name: 'EFS_DNS_NAME', defaultValue: 'fs-0f98b441ba19c9c90.efs.ap-south-1.amazonaws.com', description: 'efs dns name')
        string(name: 'EFS_ID', defaultValue: 'fs-0f98b441ba19c9c90', description: 'efs id')
        string(name: 'redis_endpoint', defaultValue: 'master.decimal-elasticache-replication.8g5lkl.aps1.cache.amazonaws.com', description: 'redis endpoint')
        string(name: 'redis_password', defaultValue: 'samepasswprdforredis', description: 'redis password')
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
                    git branch: 'main', url: 'https://github.com/juleshkumar/jenkins-test.git'
                    dir('julesh-terraform/environments/dev/Ansible') {
                        def inventoryContent = "[ec2]\n${params.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/workspace/erftghjkl/julesh-terraform/environments/dev/ec2-jumpbox/jumpbox-test-final-key.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'efs_dns_name=${params.EFS_DNS_NAME} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} region=${params.region}'"
                }
            }
        }
}
        stage('Tools Deploy') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/Tools') {

                        def inventoryContent = "[ec2]\n${params.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"

                    
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'efs_id=${params.EFS_ID} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace} region=${params.region} cluster_name=${params['cluster-name']} consul_version=${params.consul_version} elasticsearch_version=${params.elasticsearch_version} kafka_version=${params.kafka_version} nginx_ic_version=${params.nginx_version} logstash_version=${params.logstash_version}'"
                    }
                }
            }
        }
        stage('Apps Deploy') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/Apps') {

                        def inventoryContent = "[ec2]\n${params.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"

                    
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'redis_host=${params.redis_endpoint} redis_password=${params.redis_password} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace}'"
                    }
                }
            }
        }
    }
}
