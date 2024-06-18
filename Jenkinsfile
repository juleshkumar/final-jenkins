pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
        string(name: 'vpc_cidr', defaultValue: '10.0.0.0/16', description: 'Enter CIDR for VPC')
        string(name: 'public-subnet', defaultValue: '2', description: 'Enter the Number of public subnets')
        string(name: 'private-subnet', defaultValue: '2', description: 'Enter the Number of private subnets')
        string(name: 'nat-gateway', defaultValue: '2', description: 'Enter the Number of NAT gateways')
        string(name: 'public-subnet_mask', defaultValue: '4', description: 'subnetmask for public subnets')
        string(name: 'private-subnet_mask', defaultValue: '4', description: 'subnetmask for private subnets')
        string(name: 'environment', defaultValue: 'dev', description: 'Environment name')
        string(name: 'vpc_default_security_group', defaultValue: 'test-sg', description: 'Default Security group name')
        string(name: 'jumpbox_ami_id', defaultValue: 'ami-05e00961530ae1b55', description: 'AMI ID for EC2-jumpbox instances')
        string(name: 'jumpbox_key_name', defaultValue: 'jenkins-test-server2-keypair', description: 'Enter EC2 key pair name')
        string(name: 'jumpbox_instance_type', defaultValue: 't3a.medium', description: 'EC2-Jumpbox instance type')
        string(name: 'jumpbox_user', defaultValue: 'ec2-new-user', description: 'user for Jumpbox instance')
        string(name: 'autoscaling-group-name', defaultValue: 'vrt-asg', description: 'Auto x group name')
        string(name: 'kms_key_name', defaultValue: 'decimal-kms-key', description: 'Enter kms key name')
        string(name: 'eks-cluster-name', defaultValue: 'eks-decimal-test', description: 'Enter name for eks cluster')
        string(name: 'max-workers-demand', defaultValue: '5', description: 'maximum no of worker nodes for ondemand')
        string(name: 'max-workers-spot', defaultValue: '5', description: 'maximum no of worker nodes for spot')
        booleanParam(name: 'cloudwatch_logs', defaultValue: false, description: 'Select cloudwatch logs')
        booleanParam(name: 'cluster-autoscaler', defaultValue: false, description: 'cluster Auto Scaler Name')
        string(name: 'instance_capacity_types_demand', defaultValue: 'ON_DEMAND', description: 'on demand instance capacity type')
        string(name: 'instance_capacity_types_spot', defaultValue: 'ON_DEMAND', description: 'spot instance capacity type')
        string(name: 'node_instance_disk_size', defaultValue: '60', description: 'volume for instance nodegroup instances')
        string(name: 'node_instance_key_pair', defaultValue: 'null', description: 'Key pair for node group')
        string(name: 'num-workers-spot', defaultValue: '1', description: 'minimum number of spot worker nodes')
        string(name: 'num-workers-demand', defaultValue: '1', description: 'minimum number of on demand worker nodes')
        string(name: 'k8s_version', defaultValue: '1.28', description: 'Enter the eks version')
        string(name: 'instance-type-on-demand', defaultValue: 'r5a.large', description: 'Enter instance type for on demand')
        string(name: 'instance-type-spot', defaultValue: 'r5a.large', description: 'Enter instance type for spot instance')
        string(name: 'public_key_file', defaultValue: '/var/lib/jenkins/.ssh/id_rsa.pub', description: 'Enter public key file')
        string(name: 'eks_key_name', defaultValue: 'eks-key', description: 'Enter eks_key_name')
        string(name: 'vrt_db_instance_identifier', defaultValue: 'decimal-db-tech', description: 'Enter DB instance identifier name')
        string(name: 'vrt_db_security_group', defaultValue: 'decimal-rds-security', description: 'Enter DB security group name')
        string(name: 'vrt__db_cidr_range', defaultValue: '10.0.0.0/16', description: 'Enter cidr range')
        string(name: 'major_version', defaultValue: '12', description: 'Enter major_version for RDS') 
        string(name: 'vrt_db_allocated_storage', defaultValue: '20', description: 'Enter storage type for DB') 
        string(name: 'db_engine_version', defaultValue: '12.17', description: 'Enter rds engine version')     
        string(name: 'vrt_db_instance_type', defaultValue: 'db.m6g.large', description: 'Enter DB instance type')
        string(name: 'vrt_database_name', defaultValue: 'decimal_database_technologies', description: 'Enter database name')
        password(name: 'database_user', defaultValue: 'psq_demo', description: 'Enter username for database')
        password(name: 'database_password', defaultValue: 'Qwerty#789', description: 'Enter password for database')
        string(name: 'redis-replication-id', defaultValue: 'decimal-elasticache-replication', description: 'Enter elasticache replication-id')
        string(name: 'redis-cluster-name', defaultValue: 'elasticache-redis-cluster', description: 'Enter name for redis-cluster')
        string(name: 'redis-engine', defaultValue: 'redis', description: 'Enter redis engine name')
        string(name: 'redis-engine-version', defaultValue: '6.0', description: 'Enter redis engine version') 
        string(name: 'redis-node-type', defaultValue: 'cache.t3.small', description: 'Enter redis node type')
        string(name: 'environment', defaultValue: 'dev', description: 'environment tag')
        password(name: 'auth_token', defaultValue: 'PMZuzUmV85Bt+bh7aM5s2Pbl5d40PRwyx2RL29EiHds=', description: 'redis auth token')
        password(name: 'redis_password', defaultValue: 'samepasswprdforredis', description: 'password for redis')
        string(name: 'redis-user-id', defaultValue: 'redis-user-dc', description: 'user id for redis')
        string(name: 'redis-user-name', defaultValue: 'default', description: 'username for redis')
        booleanParam(name: 'rest_encryption', defaultValue: 'true', description: 'encryption type at rest')
        booleanParam(name: 'transit_encryption_enabled', defaultValue: 'true', description: 'transit encryption type')
        string(name: 'replicas-per-node-group', defaultValue: '1', description: 'The number of replica nodes in each node group (shard)')
        string(name: 'num-node-groups', defaultValue: '1', description: 'The number of node groups (shards) for this Redis replication group')
        string(name: 'parameter-group-family', defaultValue: 'redis6.x', description: 'Enter parameter group family for redis')
        string(name: 'efs-security-group', defaultValue: 'efs-mount-target-sg', description: 'Enter efs security group name')
        booleanParam(name: 'internal', defaultValue: 'false', description: 'Choose Internal or Internet Load balancer facing type')
        string(name: 'load_balancer_type', defaultValue: 'application', description: 'Choose Load balancer type')
        string(name: 'load_balancer_name', defaultValue: 'decimal-load-balancer', description: 'Enter Load balancer name')
        string(name: 'lb-port', defaultValue: '80', description: 'Enter Load balancer port')
        string(name: 'protocol', defaultValue: 'HTTP', description: 'protocol for Load balancer security group')
        string(name: 'autoscaling-group-name', defaultValue: 'vrt-asg', description: 'ASG name')
        string(name: 'target-group-name', defaultValue: 'tg-sg-lb', description: 'Enter target group name')
        string(name: 'lb_security_group', defaultValue: 'load-balancer-sg', description: 'Enter load balancer security group name')
        string(name: 'from_ports', defaultValue: '443', description: 'Enter Load balancer port')
        string(name: 'to_ports', defaultValue: '443', description: 'lb port')
        string(name: 'security-group-cidr', defaultValue: '0.0.0.0/0', description: 'source cidr')
        string(name: 'region', defaultValue: 'ap-south-1', description: 'AWS account Region')
        string(name: 'output', defaultValue: 'text', description: 'AWS account Output format')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('VPC Creation') {
            steps {
                script {
                    // Convert parameters to numbers
                    def publicCount = params['public-subnet'].toInteger()
                    def privateCount = params['private-subnet'].toInteger()
                    def natCount = params['nat-gateway'].toInteger()
                    def publicSubnetMask = params['public-subnet_mask'].toInteger()
                    def privateSubnetMask = params['private-subnet_mask'].toInteger()
                    
                    git branch: 'main', url: 'https://github.com/juleshkumar/jenkins-test.git'
                    dir('julesh-terraform/environments/dev/vpc') {
                        sh 'terraform init'


                        
                        def tfPlanCmd = "terraform plan -out=vpc_tfplan " +
                                        "-var 'vpc_cidr=${params.vpc_cidr}' " +
                                        "-var 'public-count=${publicCount}' " +
                                        "-var 'private-count=${privateCount}' " +
                                        "-var 'nat-count=${natCount}' " +
                                        "-var 'public-subnet_mask=${publicSubnetMask}' " +
                                        "-var 'private-subnet_mask=${privateSubnetMask}' " +
                                        "-var 'environment=${params.environment}' " +
                                        "-var 'security_group=${params.vpc_default_security_group}'"
                        sh tfPlanCmd
                        sh 'terraform show -no-color vpc_tfplan > vpc_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'vpc_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false vpc_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'vpc_cidr=${params.vpc_cidr}' " +
                            "-var 'public-count=${publicCount}' " +
                            "-var 'private-count=${privateCount}' " +
                            "-var 'nat-count=${natCount}' " +
                            "-var 'public-subnet_mask=${publicSubnetMask}' " +
                            "-var 'private-subnet_mask=${privateSubnetMask}' " +
                            "-var 'environment=${params.environment}' " +
                            "-var 'security_group=${params.vpc_default_security_group}'"
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                    }
                }
            }
        }
        
        stage('EFS Creation') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/efs') {
                        sh 'terraform init'
                        def tfPlanCmd = "terraform plan -out=efs_tfplan " +
                                        "-var 'cluster-name=${params['eks-cluster-name']}' " +
                                        "-var 'efs-security-group=${params['efs-security-group']}' "

                        sh tfPlanCmd
                        sh 'terraform show -no-color efs_tfplan > efs_tfplan.txt'
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'efs_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false efs_tfplan"
                        sh "terraform ${params.action} --auto-approve -var 'cluster-name=${params['eks-cluster-name']}' "+
                            "-var 'efs-security-group=${params['efs-security-group']}' "
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }

                    def efsDnsName = sh(returnStdout: true, script: "terraform output -json efs_mount_target_dns_names").trim()
                    def efsid = sh(returnStdout: true, script: "terraform output efs_file_system_id").trim()
                    def formattedEfsDnsName = efsDnsName.replaceAll('"', '')
                    def fromatedefsid = efsid.replaceAll('"', '')

                    env.EFS_DNS_NAME = formattedEfsDnsName
                    env.EFS_ID = fromatedefsid

                    }
                }
            }
        }
        stage('KMS Creation') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/kms') {
                        sh 'terraform init'
                        def tfPlanCmd = "terraform plan -out=kms_tfplan " +
                                        "-var 'kms_key_name=${params.kms_key_name}'"

                        sh tfPlanCmd
                        sh 'terraform show -no-color kms_tfplan > kms_tfplan.txt'
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'kms_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false kms_tfplan"
                        sh "terraform ${params.action} --auto-approve -var 'kms_key_name=${params.kms_key_name}' "
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }

                    }
                }
            }
        }
        
        stage('ec2-jumbox creation') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/ec2-jumpbox') {
                        sh 'terraform init'
                        def tfPlanCmd = "terraform plan -out=ec2_jumpbox_tfplan " +
                                        "-var 'ami=${params.jumpbox_ami_id}' " +
                                        "-var 'ec2_key_name=${params.jumpbox_key_name}' " +
                                        "-var 'ec2_instance_type=${params.jumpbox_instance_type}' " +
                                        "-var 'js_user=${params.jumpbox_user}'"
                        sh tfPlanCmd
                        sh 'terraform show -no-color ec2_jumpbox_tfplan > ec2_jumpbox_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'ec2_jumpbox_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false ec2_jumpbox_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'ami=${params.jumpbox_ami_id}' " +
                            "-var 'ec2_key_name=${params.jumpbox_key_name}' " +
                            "-var 'ec2_instance_type=${params.jumpbox_instance_type}' " +
                            "-var 'js_user=${params.jumpbox_user}'"
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }

                    def instancePublicIp = sh(returnStdout: true, script: "terraform output public_ip").trim()

                    env.INSTANCE_PUBLIC_IP = instancePublicIp
                    }
                }
            }
        }
        stage('Redis Creation') {
            steps {
                script {
                    def numnodegroup = params['num-node-groups'].toInteger()
                    def replicanodegroup = params['replicas-per-node-group'].toInteger()
                    dir('julesh-terraform/environments/dev/elasticache') {
                        sh 'terraform init'
                        
                        def tfPlanCmd = "terraform plan -out=ec_tfplan " +
                                        "-var 'replication-id=${params['redis-replication-id']}' " +
                                        "-var 'redis-cluster=${params['redis-cluster-name']}' " +
                                        "-var 'redis-engine=${params['redis-engine']}' " +
                                        "-var 'redis-engine-version=${params['redis-engine-version']}' " +
                                        "-var 'redis-node-type=${params['redis-node-type']}' " +
                                        "-var 'num-node-groups=${numnodegroup}' " +
                                        "-var 'replicas-per-node-group=${replicanodegroup}' " +
                                        "-var 'parameter-group-family=${params['parameter-group-family']}' " +
                                        "-var 'environment=${params.environment}' " +
                                        "-var 'auth_token=${params.auth_token}' " +
                                        "-var 'redis_password=${params.redis_password}' " +
                                        "-var 'redis-user-id=${params['redis-user-id']}' " +
                                        "-var 'redis-user-name=${params['redis-user-name']}' "

                        if (params.rest_encryption) {
                            tfPlanCmd += " -var 'rest_encryption=true'"
                        } else {
                            tfPlanCmd += " -var 'rest_encryption=false'"
                        }

                        if (params.transit_encryption_enabled) {
                            tfPlanCmd += " -var 'transit_encryption_enabled=true'"
                        } else {
                            tfPlanCmd += " -var 'transit_encryption_enabled=false'"
                        }

                        sh tfPlanCmd
                        sh 'terraform show -no-color ec_tfplan > ec_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'ec_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false ec_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var '-var 'replication-id=${params['redis-replication-id']}' " +
                            "-var 'redis-cluster=${params['redis-cluster-name']}' " +
                                        "-var 'redis-engine=${params['redis-engine']}' " +
                                        "-var 'redis-engine-version=${params['redis-engine-version']}' " +
                                        "-var 'redis-node-type=${params['redis-node-type']}' " +
                                        "-var 'num-node-groups=${numnodegroup}' " +
                                        "-var 'replicas-per-node-group=${replicanodegroup}' " +
                                        "-var 'parameter-group-family=${params['parameter-group-family']}' " +
                                        "-var 'environment=${params.environment}' " +
                                        "-var 'auth_token=${params.auth_token}' " +
                                        "-var 'redis_password=${params.redis_password}' " +
                                        "-var 'redis-user-id=${params['redis-user-id']}' " +
                                        "-var 'redis-user-name=${params['redis-user-name']}' "

                        if (params.rest_encryption) {
                            tfPlanCmd += " -var 'rest_encryption=true'"
                        } else {
                            tfPlanCmd += " -var 'rest_encryption=false'"
                        }

                        if (params.transit_encryption_enabled) {
                            tfPlanCmd += " -var 'transit_encryption_enabled=true'"
                        } else {
                            tfPlanCmd += " -var 'transit_encryption_enabled=false'"
                        }
                        
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                    def redisendpoint = sh(returnStdout: true, script: "terraform output -json redis_cluster_endpoint").trim()
                    def fromatedendpoint = redisendpoint.replaceAll('"', '')

                    env.redis_endpoint = fromatedendpoint
                    }
                }
            }
        }
        stage('RDS Creation') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/rds') {
                        sh 'terraform init'
                        
                        def tfPlanCmd = "terraform plan -out=rds_tfplan " +
                                        "-var 'vrt_db_instance_identifier=${params.vrt_db_instance_identifier}' " +
                                        "-var 'vrt_db_security_group=${params.vrt_db_security_group}' " +
                                        "-var 'vrt__db_cidr_range=${params.vrt__db_cidr_range}' " +
                                        "-var 'major_version=${params.major_version}' " +
                                        "-var 'vrt_db_allocated_storage=${params.vrt_db_allocated_storage}' " +
                                        "-var 'engine_version=${params.db_engine_version}' " +
                                        "-var 'vrt_db_instance_type=${params.vrt_db_instance_type}' " +
                                        "-var 'vrt_database_name=${params.vrt_database_name}' " +
                                        "-var 'database_user=${params.database_user}' " +
                                        "-var 'database_password=${params.database_password}'"
                        sh tfPlanCmd
                        sh 'terraform show -no-color rds_tfplan > rds_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'rds_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false rds_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'vrt_db_instance_identifier=${params.vrt_db_instance_identifier}' " +
                            "-var 'vrt_db_security_group=${params.vrt_db_security_group}' " +
                            "-var 'vrt__db_cidr_range=${params.vrt__db_cidr_range}' " +
                            "-var 'major_version=${params.major_version}' " +
                            "-var 'vrt_db_allocated_storage=${params.vrt_db_allocated_storage}' " +
                            "-var 'engine_version=${params.db_engine_version}' " +
                            "-var 'vrt_db_instance_type=${params.vrt_db_instance_type}' " +
                            "-var 'vrt_database_name=${params.vrt_database_name}' " +
                            "-var 'database_user=${params.database_user}' " +
                            "-var 'database_password=${params.database_password}'"
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                    }
                }
            }
        }
        stage('eks creation') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/eks') {
                        sh 'terraform init'
                        def tfPlanCmd = "terraform plan -out=eks_tfplan " +
                                        "-var 'cluster-name=${params['eks-cluster-name']}' " +
                                        "-var 'max-workers-demand=${params['max-workers-demand']}' " +
                                        "-var 'max-workers-spot=${params['max-workers-spot']}' " +
                                        "-var 'instance_capacity_types_demand=${params['instance_capacity_types_demand']}' " +
                                        "-var 'instance_capacity_types_spot=${params['instance_capacity_types_spot']}' " +
                                        "-var 'inst_disk_size=${params['node_instance_disk_size']}' " +
                                        "-var 'inst_key_pair=${params['node_instance_key_pair']}' " +
                                        "-var 'k8s_version=${params['k8s_version']}' " +
                                        "-var 'num-workers-spot=${params['num-workers-spot']}' " +
                                        "-var 'num-workers-demand=${params['num-workers-demand']}' " +
                                        "-var 'instance-type-on-demand=${params['instance-type-on-demand']}' " +
                                        "-var 'instance-type-spot=${params['instance-type-spot']}' " +
                                        "-var 'public_key_file=${params['public_key_file']}' " +
                                        "-var 'eks_key_name=${params['eks_key_name']}' "


                        if (params.cloudwatch_logs) {
                            tfPlanCmd += " -var 'cloudwatch_logs=true'"
                        } else {
                            tfPlanCmd += " -var 'cloudwatch_logs=false'"
                        }

                        if (params.cluster_autoscaler) {
                            tfPlanCmd += " -var 'cluster-autoscaler=true'"
                        } else {
                            tfPlanCmd += " -var 'cluster-autoscaler=false'"
                        }

                        sh tfPlanCmd
                        sh 'terraform show -no-color eks_tfplan > eks_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'eks_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false eks_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'cluster-name=${params['eks-cluster-name']}' " +
                            "-var 'max-workers-demand=${params['max-workers-demand']}' " +
                            "-var 'max-workers-spot=${params['max-workers-spot']}' " +
                            "-var 'instance_capacity_types_demand=${params['instance_capacity_types_demand']}' " +
                            "-var 'instance_capacity_types_spot=${params['instance_capacity_types_spot']}' " +
                            "-var 'inst_disk_size=${params['node_instance_disk_size']}' " +
                            "-var 'inst_key_pair=${params['node_instance_key_pair']}' " +
                            "-var 'k8s_version=${params['k8s_version']}' " +
                            "-var 'num-workers-spot=${params['num-workers-spot']}' " +
                            "-var 'num-workers-demand=${params['num-workers-demand']}' " +
                            "-var 'instance-type-on-demand=${params['instance-type-on-demand']}' " +
                            "-var 'instance-type-spot=${params['instance-type-spot']}' " +
                            "-var 'public_key_file=${params['public_key_file']}' " +
                            "-var 'eks_key_name=${params['eks_key_name']}' "

                        if (params.cloudwatch_logs) {
                            tfPlanCmd += " -var 'cloudwatch_logs=true'"
                        } else {
                            tfPlanCmd += " -var 'cloudwatch_logs=false'"
                        }

                        if (params.cluster_autoscaler) {
                            tfPlanCmd += " -var 'cluster-autoscaler=true'"
                        } else {
                            tfPlanCmd += " -var 'cluster-autoscaler=false'"
                        }

                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }


                        }
                }
            }
        }
        stage('Nodegorup creation') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/nodegroups') {
                        sh 'terraform init'
                        def tfPlanCmd = "terraform plan -out=ng_tfplan " +
                                        "-var 'cluster-name=${params['eks-cluster-name']}' " +
                                        "-var 'max-workers-demand=${params['max-workers-demand']}' " +
                                        "-var 'max-workers-spot=${params['max-workers-spot']}' " +
                                        "-var 'instance_capacity_types_demand=${params['instance_capacity_types_demand']}' " +
                                        "-var 'instance_capacity_types_spot=${params['instance_capacity_types_spot']}' " +
                                        "-var 'inst_disk_size=${params['node_instance_disk_size']}' " +
                                        "-var 'inst_key_pair=${params['node_instance_key_pair']}' " +
                                        "-var 'num-workers-spot=${params['num-workers-spot']}' " +
                                        "-var 'num-workers-demand=${params['num-workers-demand']}' " +
                                        "-var 'instance-type-on-demand=${params['instance-type-on-demand']}' " +
                                        "-var 'instance-type-spot=${params['instance-type-spot']}' " +
                                        "-var 'public_key_file=${params['public_key_file']}' " +
                                        "-var 'eks_key_name=${params['eks_key_name']}' "

                        if (params.cloudwatch_logs) {
                            tfPlanCmd += " -var 'cloudwatch_logs=true'"
                        } else {
                            tfPlanCmd += " -var 'cloudwatch_logs=false'"
                        }

                        if (params.cluster_autoscaler) {
                            tfPlanCmd += " -var 'cluster-autoscaler=true'"
                        } else {
                            tfPlanCmd += " -var 'cluster-autoscaler=false'"
                        }

                        sh tfPlanCmd
                        sh 'terraform show -no-color ng_tfplan > ng_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'ng_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false ng_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'cluster-name=${params['eks-cluster-name']}' " +
                            "-var 'max-workers-demand=${params['max-workers-demand']}' " +
                            "-var 'max-workers-spot=${params['max-workers-spot']}' " +
                            "-var 'instance_capacity_types_demand=${params['instance_capacity_types_demand']}' " +
                            "-var 'instance_capacity_types_spot=${params['instance_capacity_types_spot']}' " +
                            "-var 'inst_disk_size=${params['node_instance_disk_size']}' " +
                            "-var 'inst_key_pair=${params['node_instance_key_pair']}' " +
                            "-var 'num-workers-spot=${params['num-workers-spot']}' " +
                            "-var 'num-workers-demand=${params['num-workers-demand']}' " +
                            "-var 'instance-type-on-demand=${params['instance-type-on-demand']}' " +
                            "-var 'instance-type-spot=${params['instance-type-spot']}' " +
                            "-var 'public_key_file=${params['public_key_file']}' " +
                            "-var 'eks_key_name=${params['eks_key_name']}' "

                        if (params.cloudwatch_logs) {
                            tfPlanCmd += " -var 'cloudwatch_logs=true'"
                        } else {
                            tfPlanCmd += " -var 'cloudwatch_logs=false'"
                        }

                        if (params.cluster_autoscaler) {
                            tfPlanCmd += " -var 'cluster-autoscaler=true'"
                        } else {
                            tfPlanCmd += " -var 'cluster-autoscaler=false'"
                        }

                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }


                        }
                }
            }
        }
        stage('Load balancer Creation') {
            steps {
                script {
                    def lbport = params['lb-port'].toInteger()
                    def fromport = params['from_ports'].toInteger()
                    def toport = params['to_ports'].toInteger()
                    
                    dir('julesh-terraform/environments/dev/load_balancer') {
                        sh 'terraform init'
                        
                        def tfPlanCmd = "terraform plan -out=lb_tfplan " +
                                        "-var 'load_balancer_name=${params.load_balancer_name}' " +
                                        "-var 'lb-port=${lbport}' " +
                                        "-var 'from_ports=${fromport}' " +
                                        "-var 'to_ports=${toport}' " +
                                        "-var 'load_balancer_type=${params.load_balancer_type}' " +
                                        "-var 'protocol=${params.protocol}' " +
                                        "-var 'autoscaling-group-name=${params['autoscaling-group-name']}' " +
                                        "-var 'target-group-name=${params['target-group-name']}' " +
                                        "-var 'security-group-cidr=${params['security-group-cidr']}' " +
                                        "-var 'lb_security_group=${params.lb_security_group}'"
                        if (params.internal) {
                            tfPlanCmd += " -var 'internal=true'"
                        } else {
                            tfPlanCmd += " -var 'internal=false'"
                        }
                        sh tfPlanCmd
                        sh 'terraform show -no-color lb_tfplan > lb_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'lb_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false lb_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'load_balancer_name=${params.load_balancer_name}' " +
                            "-var 'lb-port=${lbport}' " +
                            "-var 'from_ports=${fromport}' " +
                            "-var 'to_ports=${toport}' " +
                            "-var 'load_balancer_type=${params.load_balancer_type}' " +
                            "-var 'protocol=${params.protocol}' " +
                            "-var 'autoscaling-group-name=${params['autoscaling-group-name']}' " +
                            "-var 'target-group-name=${params['target-group-name']}' " +
                            "-var 'security-group-cidr=${params['security-group-cidr']}' " +
                            "-var 'lb_security_group=${params.lb_security_group}'"
                        if (params.internal) {
                            tfPlanCmd += " -var 'internal=true'"
                        } else {
                            tfPlanCmd += " -var 'internal=false'"
                        }
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                    }
                }
            }
        }
        
        stage('EKS Addon') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/addon') {
                        sh 'terraform init'
                        
                        def tfPlanCmd = "terraform plan -out=as_tfplan " +
                                        "-var 'cluster-name=${params['eks-cluster-name']}'"
                        sh tfPlanCmd
                        sh 'terraform show -no-color as_tfplan > as_tfplan.txt'
                        
                        if (params.action == 'apply') {
                        if (!params.autoApprove) {
                            def plan = readFile 'as_tfplan.txt'
                            input message: "Do you want to apply the plan?",
                                  parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                        }
                        sh "terraform ${params.action} -input=false as_tfplan"
                    } else if (params.action == 'destroy') {
                        sh "terraform ${params.action} --auto-approve -var 'cluster-name=${params['eks-cluster-name']}' "
                    } else {
                        error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                    }
                    }
                }
            }
        }
        
        stage('security assesment') {
            steps {
                script {
                    dir('julesh-terraform/environments/dev/kubebench-scoregen') {
                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/keypairs/jenkins-test-server2-keypair.pem"
                        sh "echo '${inventoryContent}' > inventory.ini"
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'cluster_name=${params['eks-cluster-name']} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} region=${params.region}'"
                }
            }
        }
}
    }
}
