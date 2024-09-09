pipeline {
    agent any
    parameters {
      booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
      choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
      string(name: 'vpc_tags', defaultValue: '{Name = "test-vpc",Environment = "dev"}', description: 'please provide VPC Name and env tags')
      string(name: 'vpc_cidr', defaultValue: '10.0.0.0/16', description: 'Enter CIDR for VPC')
      string(name: 'public_subnet', defaultValue: '2', description: 'Enter the Number of public subnets')
      string(name: 'private_subnet', defaultValue: '2', description: 'Enter the Number of private subnets')
      string(name: 'public_subnet_mask', defaultValue: '4', description: 'subnetmask for public subnets')
      string(name: 'private_subnet_mask', defaultValue: '4', description: 'subnetmask for private subnets')
      string(name: 'environment', defaultValue: 'dev', description: 'please enter type UAT/dev/prod')
      string(name: 'vpc_default_security_group', defaultValue: 'test-sg', description: 'default security group created by aws vpc default and mandate')
      string(name: 'jumpbox_ami_id', defaultValue: 'ami-0f58b397bc5c1f2e8', description: 'AMI ID for EC2-jumpbox instances')
      string(name: 'jumpbox_key_name', defaultValue: 'test-eks-jumpbox', description: 'Enter EC2 key pair name')
      string(name: 'jumpbox_instance_type', defaultValue: 't3a.medium', description: 'EC2-Jumpbox instance type')
      string(name: 'jumpbox_user', defaultValue: 'ec2-new-user', description: 'user for Jumpbox instance')
      string(name: 'autoscaling_group_name', defaultValue: 'vrt-asg', description: 'Auto x group name')
      string(name: 'kms_key_name', defaultValue: 'decimal-kms-key', description: 'Enter kms key name')
      string(name: 'eks_cluster_name', defaultValue: 'eks-decimal-test', description: 'Enter name for eks cluster')
      string(name: 'tool_max_workers_decimal1', defaultValue: '5', description: 'maximum no of worker nodes for tools nodegroup')
      string(name: 'app_max_workers_decimal0', defaultValue: '5', description: 'maximum no of worker nodes for apps nodegorup')
      string(name: 'nginx_max_workers_decimal2', defaultValue: '5', description: 'maximum no of worker nodes for nginx nodegroup')
      string(name: 'cust_app_max_workers_decimal3', defaultValue: '5', description: 'maximum no of worker nodes for custom app nodegroup')
      booleanParam(name: 'cloudwatch_logs', defaultValue: false, description: 'Select cloudwatch logs')
      booleanParam(name: 'cluster_autoscaler', defaultValue: false, description: 'cluster Auto Scaler Name')
      string(name: 'instance_capacity_types_decimal1', defaultValue: 'ON_DEMAND', description: 'apps instance capacity type')
      string(name: 'instance_capacity_types_decimal0', defaultValue: 'ON_DEMAND', description: 'tools instance capacity type')
      string(name: 'instance_capacity_types_decimal2', defaultValue: 'ON_DEMAND', description: 'nginx instance capacity type')
      string(name: 'instance_capacity_types_decimal3', defaultValue: 'ON_DEMAND', description: 'custom apps instance capacity type')
      string(name: 'node_instance_disk_size', defaultValue: '60', description: 'volume for instance nodegroup instances')
      string(name: 'node_instance_key_pair', defaultValue: 'null', description: 'Key pair for node group')
      string(name: 'app_num_workers_decimal0', defaultValue: '1', description: 'minimum and desired number of worker nodes for apps nodegroup')
      string(name: 'tool_num_workers_decimal1', defaultValue: '1', description: 'minimum and desired number of worker nodes for tools nodegroup')
      string(name: 'nginx_num_workers_decimal2', defaultValue: '1', description: 'minimum and desired number of worker nodes for nginx nodegroup')
      string(name: 'cust_app_num_workers_decimal3', defaultValue: '1', description: 'minimum and desired number of worker nodes for custom apps nodegroup')
      string(name: 'k8s_version', defaultValue: '1.28', description: 'Enter the eks version')
      string(name: 'public_key_file', defaultValue: '/var/lib/jenkins/.ssh/id_rsa.pub', description: 'Enter public key file')
      string(name: 'eks_key_name', defaultValue: 'eks-new-key', description: 'Enter eks_key_name')
      string(name: 'count_decimal0', defaultValue: '1', description: 'Enter number of apps nodegroup')
      string(name: 'count_decimal1', defaultValue: '1', description: 'Enter number of tools nodegroup')
      string(name: 'count_decimal2', defaultValue: '1', description: 'Enter number of nginx nodegroup')
      string(name: 'count_decimal3', defaultValue: '1', description: 'Enter number of custom apps nodegroup')
      string(name: 'node_ami_decimal0', defaultValue: 'ami-040acbfd65da0c993', description: 'Enter node ami for spot')
      string(name: 'node_ami_decimal1', defaultValue: 'ami-040acbfd65da0c993', description: 'Enter node ami for on-demand')
      string(name: 'eks_sg_vpc_cidr', defaultValue: '0.0.0.0/0', description: 'Enter eks-sg cidr')
      string(name: 'app_node_groups_decimal0', defaultValue: '[{"name": "application-nodegroup", "value": "value1"}]', description: 'Enter apps nodegroup name')
      string(name: 'tool_node_groups_decimal1', defaultValue: '[{"name": "tool-nodegroup", "value": "value1"}]', description: 'Enter tools nodegroup name')
      string(name: 'nginx_node_groups_decimal2', defaultValue: '[{"name": "nginx-nodegroup", "value": "value2"}]', description: 'Enter nginx nodegroup name')
      string(name: 'cust_app_node_groups_decimal3', defaultValue: '[{"name": "custom-app-nodegroup", "value": "value1"}]', description: 'Enter custom apps nodegroup name')
      string(name: 'instance_type_decimal0', defaultValue: '["t3a.medium", "m6a.xlarge"]', description: 'Enter instance type for apps nodegroup')
      string(name: 'instance_type_decimal1', defaultValue: '["t3a.medium", "m6a.xlarge"]', description: 'Enter instance type for tools nodegroup')
      string(name: 'instance_type_decimal2', defaultValue: '["t3a.medium", "m6a.xlarge"]', description: 'Enter instance type for nginx nodegroup')
      string(name: 'instance_type_decimal3', defaultValue: '["t3a.medium", "m6a.xlarge"]', description: 'Enter instance type for custom apps nodegroup')
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
      string(name: 'rds_port', defaultValue: '5432', description: 'RDS secuuirty group inbound port')
      string(name: 'redis_replication_id', defaultValue: 'decimal-elasticache-replication', description: 'Enter elasticache replication-id')
      string(name: 'redis_cluster_name', defaultValue: 'elasticache-redis-cluster', description: 'Enter name for redis-cluster')
      string(name: 'redis_engine', defaultValue: 'redis', description: 'Enter redis engine name')
      choice(name: 'redis_engine_version', choices: ['7.0', '6.0'], description: 'Enter redis engine version') 
      string(name: 'redis_node_type', defaultValue: 'cache.t3.small', description: 'Enter redis node type')
      password(name: 'auth_token', defaultValue: 'PMZuzUmV85Bt+bh7aM5s2Pbl5d40PRwyx2RL29EiHds=', description: 'redis auth token')
      password(name: 'redis_password', defaultValue: 'samepasswprdforredis', description: 'password for redis')
      string(name: 'redis_user_id', defaultValue: 'redis-user-dc', description: 'user id for redis')
      string(name: 'redis_user_name', defaultValue: 'default', description: 'username for redis')
      string(name: 'redis_port', defaultValue: '6379', description: 'Redis secuuirty group inbound port')
      booleanParam(name: 'rest_encryption', defaultValue: 'true', description: 'encryption type at rest')
      booleanParam(name: 'transit_encryption_enabled', defaultValue: 'true', description: 'transit encryption type')
      string(name: 'replicas_per_node_group', defaultValue: '1', description: 'The number of replica nodes in each node group (shard)')
      string(name: 'num_node_groups', defaultValue: '1', description: 'The number of node groups (shards) for this Redis replication group')
      choice(name: 'parameter_group_family', choices: ['redis7', 'redis6.x'], description: 'Enter parameter group family for redis')
      string(name: 'efs_security_group', defaultValue: 'efs-mount-target-sg', description: 'Enter efs security group name')
      booleanParam(name: 'internal', defaultValue: 'false', description: 'Choose Internal or Internet Load balancer facing type')
      string(name: 'load_balancer_type', defaultValue: 'application', description: 'Choose Load balancer type')
      string(name: 'load_balancer_name', defaultValue: 'decimal-load-balancer', description: 'Enter Load balancer name')
      string(name: 'lb_port', defaultValue: '30023', description: 'Enter Load balancer port')
      string(name: 'protocol', defaultValue: 'HTTP', description: 'protocol for Load balancer security group')
      string(name: 'target_group_name', defaultValue: 'tg-sg-lb', description: 'Enter target group name')
      string(name: 'lb_security_group', defaultValue: 'load-balancer-sg', description: 'Enter load balancer security group name')
      string(name: 'from_ports', defaultValue: '443', description: 'Enter Load balancer port')
      string(name: 'to_ports', defaultValue: '443', description: 'lb port')
      string(name: 'security_group_cidr', defaultValue: '0.0.0.0/0', description: 'source cidr')
      string(name: 'region', defaultValue: 'ap-south-1', description: 'AWS account Region')
      string(name: 'output', defaultValue: 'text', description: 'AWS account Output format')
      string(name: 'bucket_name', defaultValue: 'assesment-test-to-delete-yaml', description: 's3 bucket name')
      string(name: 'pipeline_name', defaultValue: 'decimal-team-vrt-pipeline', description: 'Enter pipeline name')
      string(name: 'self_account_id', defaultValue: '975050085624', description: 'enter self account id for ecr permission')
      string(name: 'namespace', defaultValue: 'vrt', description: 'Namespace')
      string(name: 'consul_version', defaultValue: '10.14.3', description: 'version')
      string(name: 'elasticsearch_version', defaultValue: '19.13.10', description: 'version')
      string(name: 'nginx_version', defaultValue: '9.2.22', description: 'version')
      string(name: 'kafka_version', defaultValue: '18.0.3', description: 'version')
      string(name: 'logstash_version', defaultValue: '5.1.13', description: 'version')
      password(name: 'aws_access_key', defaultValue: '', description: 'Enter aws access key')
      password(name: 'aws_secret_key', defaultValue: '', description: 'Enter aws secret access key')
  }

    environment {
        AWS_ACCESS_KEY_ID = "${params.aws_access_key}"
        AWS_SECRET_ACCESS_KEY = "${params.aws_secret_key}"
        GIT_CREDENTIALS_ID = 'latets-git-PAT' 
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'terraform', url: 'https://github.com/imamityaadav/decimal-jenkins-vrt.git', credentialsId: GIT_CREDENTIALS_ID
            }
        }

        stage('Update tfvars') {
            steps {
                script {
                    def tfvarsPath = 'terraform/variables/dev.tfvars'

                    // Read the existing content of the tfvars file
                    def tfvarsContent = readFile(file: tfvarsPath)

                    // Create a map with the new variable values
                    def newVars = [
                        'backend_bucket'                   : "\"${params.bucket_name}\"",
                        'vpc_cidr'                         : "\"${params.vpc_cidr}\"",
                        'vpc_tags'                         : "${params.vpc_tags}",
                        'public-count'                     : params.public_subnet.toString(),
                        'private-count'                    : params.private_subnet.toString(),
                        'public-subnet_mask'               : params.public_subnet_mask.toString(),
                        'private-subnet_mask'              : params.private_subnet_mask.toString(),
                        'environment'                      : "\"${params.environment}\"",
                        'region'                           : "\"${params.region}\"",
                        'internal'                         : params.internal.toString(),
                        'load_balancer_type'               : "\"${params.load_balancer_type}\"",
                        'load_balancer_name'               : "\"${params.load_balancer_name}\"",
                        'security_group'                   : "\"${params.vpc_default_security_group}\"",
                        'lb-port'                          : params.lb_port.toString(),
                        'protocol'                         : "\"${params.protocol}\"",
                        'autoscaling-group-name'           : "\"${params.autoscaling_group_name}\"",
                        'target-group-name'                : "\"${params.target_group_name}\"",
                        'lb_security_group'                : "\"${params.lb_security_group}\"",
                        'from_ports'                       : params.from_ports.toString(),
                        'to_ports'                         : params.to_ports.toString(),
                        'security-group-cidr'              : "\"${params.security_group_cidr}\"",
                        'kms_key_name'                     : "\"${params.kms_key_name}\"",
                        'cluster-name'                     : "\"${params.eks_cluster_name}\"",
                        'tool-max-workers-decimal1'        : "\"${params.tool_max_workers_decimal1}\"",
                        'app-max-workers-decimal0'         : "\"${params.app_max_workers_decimal0}\"",
                        'nginx-max-workers-decimal2'       : "\"${params.nginx_max_workers_decimal2}\"",
                        'cust-app-max-workers-decimal3'    : "\"${params.cust_app_max_workers_decimal3}\"",
                        'cloudwatch_logs'                  : params.cloudwatch_logs.toString(),
                        'cluster-autoscaler'               : params.cluster_autoscaler.toString(),
                        'node_groups_decimal0'             : "${params.app_node_groups_decimal0}",
                        'node_groups_decimal1'             : "${params.tool_node_groups_decimal1}",
                        'node_groups_decimal2'             : "${params.nginx_node_groups_decimal2}",
                        'node_groups_decimal3'             : "${params.cust_app_node_groups_decimal3}",
                        'count_decimal0'                   : params.count_decimal0.toString(),
                        'count_decimal1'                   : params.count_decimal1.toString(),
                        'count_decimal2'                   : params.count_decimal2.toString(),
                        'count_decimal3'                   : params.count_decimal3.toString(),
                        'node-ami-decimal0'                : "\"${params.node_ami_decimal0}\"",
                        'node-ami-decimal1'                : "\"${params.node_ami_decimal1}\"",
                        'instance_capacity_types_decimal1' : "\"${params.instance_capacity_types_decimal1}\"",
                        'instance_capacity_types_decimal0' : "\"${params.instance_capacity_types_decimal0}\"",
                        'instance_capacity_types_decimal2' : "\"${params.instance_capacity_types_decimal2}\"",
                        'instance_capacity_types_decimal3' : "\"${params.instance_capacity_types_decimal3}\"",
                        'eks-sg-vpc-cidr'                  : "\"${params.eks_sg_vpc_cidr}\"",
                        'inst_disk_size'                   : "\"${params.node_instance_disk_size}\"",
                        'inst_key_pair'                    : params.node_instance_key_pair,
                        'app-num-workers-decimal0'         : "\"${params.app_num_workers_decimal0}\"",
                        'tool-num-workers-decimal1'        : "\"${params.tool_num_workers_decimal1}\"",
                        'nginx-num-workers-decimal2'       : "\"${params.nginx_num_workers_decimal2}\"",
                        'cust-app-num-workers-decimal3'    : "\"${params.cust_app_num_workers_decimal3}\"",
                        'k8s_version'                      : "\"${params.k8s_version}\"",
                        'instance-type-on-decimal1'        : params.instance_type_decimal1,
                        'instance-type-decimal0'           : params.instance_type_decimal0,
                        'instance-type-decimal2'           : params.instance_type_decimal2,
                        'instance-type-on-decimal3'        : params.instance_type_decimal3,
                        'public_key_file'                  : "\"${params.public_key_file}\"",
                        'ami'                              : "\"${params.jumpbox_ami_id}\"",
                        'ec2_key_name'                     : "\"${params.jumpbox_key_name}\"",
                        'ec2_instance_type'                : "\"${params.jumpbox_instance_type}\"",
                        'vrt_db_instance_identifier'       : "\"${params.vrt_db_instance_identifier}\"",
                        'vrt_db_security_group'            : "\"${params.vrt_db_security_group}\"",
                        'vrt__db_cidr_range'               : "\"${params.vrt__db_cidr_range}\"",
                        'major_version'                    : "\"${params.major_version}\"",
                        'vrt_db_allocated_storage'         : "\"${params.vrt_db_allocated_storage}\"",
                        'engine_version'                   : "\"${params.db_engine_version}\"",
                        'vrt_db_instance_type'             : "\"${params.vrt_db_instance_type}\"",
                        'vrt_database_name'                : "\"${params.vrt_database_name}\"",
                        'database_user'                    : "\"${params.database_user}\"",
                        'database_password'                : "\"${params.database_password}\"",
                        'rds_port'                          : params.rds_port.toString(),
                        'efs-security-group'               : "\"${params.efs_security_group}\"",
                        'replication-id'                   : "\"${params.redis_replication_id}\"",
                        'redis-cluster'                    : "\"${params.redis_cluster_name}\"",
                        'redis-engine'                     : "\"${params.redis_engine}\"",
                        'redis-engine-version'             : "\"${params.redis_engine_version}\"",
                        'redis_password'                   : "\"${params.redis_password}\"",
                        'redis-node-type'                  : "\"${params.redis_node_type}\"",
                        'redis-user-name'                  : "\"${params.redis_user_name}\"",
                        'transit_encryption_enabled'       : params.transit_encryption_enabled.toString(),
                        'redis-user-id'                    : "\"${params.redis_user_id}\"",
                        'rest_encryption'                  : params.rest_encryption.toString(),
                        'parameter-group-family'           : "\"${params.parameter_group_family}\"",
                        'auth_token'                       : "\"${params.auth_token}\"",
                        'num-node-groups'                  : "\"${params.num_node_groups}\"",
                        'replicas-per-node-group'          : "\"${params.replicas_per_node_group}\"",
                        'redis_port'                       : params.redis_port.toString(),
                        'js_user'                          : "\"${params.jumpbox_user}\"",
                        'eks_key_name'                     : "\"${params.eks_key_name}\""
                    ]

                    newVars.each { k, v ->
                        // Replace existing variable if it exists
                        tfvarsContent = tfvarsContent.replaceAll(/(?m)^${k}\s*=\s*.*$/, "${k} = ${v}")
                        // Append new variable if it doesn't exist
                        if (!tfvarsContent.contains(k)) {
                            tfvarsContent += "\n${k} = ${v}"
                        }
                    }

                    // Write updated content back to dev.tfvars file
                    writeFile file: tfvarsPath, text: tfvarsContent
                }
            }
        }
        stage('VPC Creation') {
          steps {
              script {
                  dir('terraform/environments/dev/vpc') {
                      sh "echo no | terraform init \
                              -backend-config='bucket=${params.bucket_name}' \
                              -backend-config='region=${params.region}' \
                              -reconfigure"
                      def tfPlanCmd = "terraform plan -out=vpc_tfplan --var-file=../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
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
                  dir('terraform/environments/dev/load_balancer') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"                      
                      def tfPlanCmd = "terraform plan -out=lb_tfplan --var-file=../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                  }
              }
          }
      }
      stage('KMS Creation') {
          steps {
              script {
                  dir('terraform/environments/dev/kms') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan -out=kms_tfplan --var-file=../../../variables/dev.tfvars"
                      sh tfPlanCmd
                      sh 'terraform show -no-color kms_tfplan > kms_tfplan.txt'
                      if (params.action == 'apply') {
                      if (!params.autoApprove) {
                          def plan = readFile 'kms_tfplan.txt'
                          input message: "Do you want to apply the plan?",
                                parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                      }
                      sh "terraform ${params.action} -input=false kms_tfplan"
                      } else if (params.action == 'destroy') {
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                      def kms_arn = sh(returnStdout: true, script: "terraform output key_arn").trim()

                      env.kms_key_arn = kms_arn
                      sh "aws kms enable-key-rotation \
                            --key-id ${env.kms_key_arn} \
                            --rotation-period-in-days 90"

                  }
              }
          }
      }
      stage('ec2-jumbox creation') {
          steps {
              script {
                  dir('terraform/environments/dev/ec2-jumpbox') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan -out=ec2_jumpbox_tfplan --var-file=../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                      sh "sudo chmod 400 /var/lib/jenkins/workspace/${params.pipeline_name}/terraform/environments/dev/ec2-jumpbox/${params.jumpbox_key_name}.pem"
                      def instancePublicIp = sh(returnStdout: true, script: "terraform output public_ip").trim()

                      env.INSTANCE_PUBLIC_IP = instancePublicIp
                  }
              }
          }
      }
      stage('EFS Creation') {
          steps {
              script {
                  dir('terraform/environments/dev/efs') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan -out=efs_tfplan --var-file=../../../variables/dev.tfvars"
                      sh tfPlanCmd
                      sh 'terraform show -no-color efs_tfplan > efs_tfplan.txt'
                      if (params.action == 'apply') {
                      if (!params.autoApprove) {
                          def plan = readFile 'efs_tfplan.txt'
                          input message: "Do you want to apply the plan?",
                                parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                      }
                      sh "terraform ${params.action} -input=false efs_tfplan"
                      } else if (params.action == 'destroy') {
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
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
      stage('eks creation') {
          steps {
              script {
                  dir('terraform/environments/dev/eks') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan -out=eks_tfplan --var-file=../../../variables/dev.tfvars"

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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"

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
                  dir('terraform/environments/dev/nodegroups') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan -out=ng_tfplan --var-file=../../../variables/dev.tfvars"

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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"

                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                      }
              }
          }
      }
      stage('RDS Creation') {
          steps {
              script {
                  dir('terraform/environments/dev/rds') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      
                      def tfPlanCmd = "terraform plan -out=rds_tfplan --var-file=../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                  }
              }
          }
      }
      stage('Redis Creation') {
          steps {
              script {
                  dir('terraform/environments/dev/elasticache') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"                      
                      def tfPlanCmd = "terraform plan -out=ec_tfplan --var-file=../../../variables/dev.tfvars"

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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
                      
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
      stage('EKS Addon') {
          steps {
              script {
                  dir('terraform/environments/dev/addon') {
                      sh "terraform init"
                      
                      def tfPlanCmd = "terraform plan -out=as_tfplan --var-file=../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --var-file ../../../variables/dev.tfvars"
                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                  }
              }
          }
      }
      stage('ECR permission') {
          steps {
              script {
                  dir('terraform/environments/dev/ecr-permission') {
                      def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa"
                      sh "echo '${inventoryContent}' > inventory.ini"
                      sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'account_id=${params.self_account_id}'"
              }
          }
      }
}
      stage('security assesment') {
          steps {
              script {
                  dir('terraform/environments/dev/kubebench-secuirtyscore') {
                      def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa"
                      sh "echo '${inventoryContent}' > inventory.ini"
                      sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'cluster_name=${params.eks_cluster_name} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace} region=${params.region}'"
              }
          }
      }
}
      stage('Ansbile dir creation') {
            steps {
                script {
                    dir('terraform/environments/dev/Ansible') {
                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa"
                        sh "echo '${inventoryContent}' > inventory.ini"
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'efs_dns_name=${env.EFS_DNS_NAME} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output}'"
                }
            }
        }
}
        stage('Tools Deploy') {
            steps {
                script {
                    dir('terraform/environments/dev/Tools') {

                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa"
                        sh "echo '${inventoryContent}' > inventory.ini"

                    
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'efs_id=${env.EFS_ID} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace} consul_version=${params.consul_version} elasticsearch_version=${params.elasticsearch_version} kafka_version=${params.kafka_version} nginx_ic_version=${params.nginx_version} logstash_version=${params.logstash_version}'"
                    }
                }
            }
        }
        stage('Apps Deploy') {
            steps {
                script {
                    dir('terraform/environments/dev/Apps') {

                        def inventoryContent = "[ec2]\n${env.INSTANCE_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/id_rsa"
                        sh "echo '${inventoryContent}' > inventory.ini"

                    
                        sh "ansible-playbook -i inventory.ini deploy.yml --extra-vars 'redis_host=${env.redis_endpoint} redis_password=${params.redis_password} redis_port=${params.redis_port} aws_access_key_id=${env.AWS_ACCESS_KEY_ID} aws_secret_access_key=${env.AWS_SECRET_ACCESS_KEY} aws_region=${params.region} aws_output_format=${params.output} namespace=${params.namespace}'"
                    }
                }
            }
        }
    }
}
