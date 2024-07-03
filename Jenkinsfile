pipeline {
    agent any

    parameters {
      string(name: 'vpc_cidr', defaultValue: '10.0.0.0/16', description: 'Enter CIDR for VPC')
      string(name: 'public_subnet', defaultValue: '2', description: 'Enter the Number of public subnets')
      string(name: 'private_subnet', defaultValue: '2', description: 'Enter the Number of private subnets')
      string(name: 'nat_gateway', defaultValue: '2', description: 'Enter the Number of NAT gateways')
      string(name: 'public_subnet_mask', defaultValue: '4', description: 'subnetmask for public subnets')
      string(name: 'private_subnet_mask', defaultValue: '4', description: 'subnetmask for private subnets')
      string(name: 'environment', defaultValue: 'dev', description: 'Environment name')
      string(name: 'vpc_default_security_group', defaultValue: 'test-sg', description: 'Default Security group name')
      string(name: 'jumpbox_ami_id', defaultValue: 'ami-0f58b397bc5c1f2e8', description: 'AMI ID for EC2-jumpbox instances')
      string(name: 'jumpbox_key_name', defaultValue: 'test-eks-jumpbox', description: 'Enter EC2 key pair name')
      string(name: 'jumpbox_instance_type', defaultValue: 't3a.medium', description: 'EC2-Jumpbox instance type')
      string(name: 'jumpbox_user', defaultValue: 'ec2-new-user', description: 'user for Jumpbox instance')
      string(name: 'autoscaling_group_name', defaultValue: 'vrt-asg', description: 'Auto x group name')
      string(name: 'kms_key_name', defaultValue: 'decimal-kms-key', description: 'Enter kms key name')
      string(name: 'eks_cluster_name', defaultValue: 'eks-decimal-test', description: 'Enter name for eks cluster')
      string(name: 'max_workers_demand', defaultValue: '5', description: 'maximum no of worker nodes for ondemand')
      string(name: 'max_workers_spot', defaultValue: '5', description: 'maximum no of worker nodes for spot')
      booleanParam(name: 'cloudwatch_logs', defaultValue: false, description: 'Select cloudwatch logs')
      booleanParam(name: 'cluster_autoscaler', defaultValue: false, description: 'cluster Auto Scaler Name')
      string(name: 'instance_capacity_types_demand', defaultValue: 'ON_DEMAND', description: 'on demand instance capacity type')
      string(name: 'instance_capacity_types_spot', defaultValue: 'ON_DEMAND', description: 'spot instance capacity type')
      string(name: 'node_instance_disk_size', defaultValue: '60', description: 'volume for instance nodegroup instances')
      string(name: 'node_instance_key_pair', defaultValue: 'null', description: 'Key pair for node group')
      string(name: 'num_workers_spot', defaultValue: '1', description: 'minimum number of spot worker nodes')
      string(name: 'num_workers_demand', defaultValue: '1', description: 'minimum number of on demand worker nodes')
      string(name: 'k8s_version', defaultValue: '1.28', description: 'Enter the eks version')
      string(name: 'public_key_file', defaultValue: '/var/lib/jenkins/.ssh/id_rsa.pub', description: 'Enter public key file')
      string(name: 'eks_key_name', defaultValue: 'eks-key', description: 'Enter eks_key_name')
      string(name: 'count_decimal0', defaultValue: '2', description: 'Enter number of on-demand nodegroup')
      string(name: 'count_decimal1', defaultValue: '2', description: 'Enter number of spot nodegroup')
      string(name: 'node_ami_decimal0', defaultValue: 'ami-040acbfd65da0c993', description: 'Enter node ami for spot')
      string(name: 'node_ami_decimal1', defaultValue: 'ami-040acbfd65da0c993', description: 'Enter node ami for on-demand')
      string(name: 'eks_sg_vpc_cidr', defaultValue: '0.0.0.0/0', description: 'Enter eks-sg cidr')
      string(name: 'node_groups_decimal0', defaultValue: '[{"name": "application-nodegroup", "value": "value1"}, {"name": "custom-application-nodegroup", "value": "value2"}]', description: 'Enter spot nodegroup name')
      string(name: 'node_groups_decimal1', defaultValue: '[{"name": "tool-nodegroup", "value": "value1"}, {"name": "nginx-nodegroup", "value": "value2"}]', description: 'Enter on-demand nodegroup name')
      string(name: 'instance_type_decimal0', defaultValue: '["t3a.medium", "m6a.xlarge"]', description: 'Enter instance type for spot nodegroup')
      string(name: 'instance_type_on_decimal1', defaultValue: '["t3a.medium", "m6a.xlarge"]', description: 'Enter instance type for on-demand nodegroup')
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
      string(name: 'redis_replication_id', defaultValue: 'decimal-elasticache-replication', description: 'Enter elasticache replication-id')
      string(name: 'redis_cluster_name', defaultValue: 'elasticache-redis-cluster', description: 'Enter name for redis-cluster')
      string(name: 'redis_engine', defaultValue: 'redis', description: 'Enter redis engine name')
      string(name: 'redis_engine_version', defaultValue: '6.0', description: 'Enter redis engine version') 
      string(name: 'redis_node_type', defaultValue: 'cache.t3.small', description: 'Enter redis node type')
      string(name: 'environment', defaultValue: 'dev', description: 'environment tag')
      password(name: 'auth_token', defaultValue: 'PMZuzUmV85Bt+bh7aM5s2Pbl5d40PRwyx2RL29EiHds=', description: 'redis auth token')
      password(name: 'redis_password', defaultValue: 'samepasswprdforredis', description: 'password for redis')
      string(name: 'redis_user_id', defaultValue: 'redis-user-dc', description: 'user id for redis')
      string(name: 'redis_user_name', defaultValue: 'default', description: 'username for redis')
      booleanParam(name: 'rest_encryption', defaultValue: 'true', description: 'encryption type at rest')
      booleanParam(name: 'transit_encryption_enabled', defaultValue: 'true', description: 'transit encryption type')
      string(name: 'replicas_per_node_group', defaultValue: '1', description: 'The number of replica nodes in each node group (shard)')
      string(name: 'num_node_groups', defaultValue: '1', description: 'The number of node groups (shards) for this Redis replication group')
      string(name: 'parameter_group_family', defaultValue: 'redis6.x', description: 'Enter parameter group family for redis')
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
      string(name: 'bucket_name', defaultValue: 'amit-demo-bucket-test', description: 's3 bucket name')
      string(name: 'pipeline_name', defaultValue: 'amit-infra-vrt-test', description: 'Enter pipeline name')
      password(name: 'aws_access_key', defaultValue: 'AKIA6GBMDST4LNOKW7DT', description: 'Enter aws access key')
      password(name: 'aws_secret_key', defaultValue: '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', description: 'Enter aws secret access key')
  }

    environment {
        AWS_ACCESS_KEY_ID = "${params.aws_access_key}"
        AWS_SECRET_ACCESS_KEY = "${params.aws_secret_key}"
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'terraform', url: 'https://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@github.com/imamityaadav/decimal-jenkins-vrt.git'
            }
        }

        stage('Modify dev.tfvars') {
            steps {
                script {
    def tfvarsPath = 'terraform/variables/dev.tfvars'

    // Read the existing content of the tfvars file
    def tfvarsContent = readFile(file: tfvarsPath)

    // Create a map with the new variable values
    def newVars = [
        'backend_bucket'                                : params.bucket_name,
        'vpc_cidr'                                      : params.vpc_cidr,
        'public-count'                                  : params.public_subnet,
        'private-count'                                 : params.private_subnet,
        'nat-count'                                     : params.nat_gateway,
        'public-subnet_mask'                            : params.public_subnet_mask,
        'private-subnet_mask'                           : params.private_subnet_mask,
        'environment'                                   : params.environment,
        'region'                                        : params.region,
        'internal'                                      : params.internal,
        'load_balancer_type'                            : params.load_balancer_type,
        'load_balancer_name'                            : params.load_balancer_name,
        'security_group'                                : params.vpc_default_security_group,
        'lb-port'                                       : params.lb_port,
        'protocol'                                      : params.protocol,
        'autoscaling-group-name'                        : params.autoscaling_group_name,
        'target-group-name'                             : params.target_group_name,
        'lb_security_group'                             : params.lb_security_group,
        'from_ports'                                    : params.from_ports,
        'to_ports'                                      : params.to_ports,
        'security-group-cidr'                           : params.security_group_cidr,
        'kms_key_name'                                  : params.kms_key_name,
        'cluster-name'                                  : params.eks_cluster_name,
        'max-workers-decimal0'                          : params.max_workers_spot,
        'max-workers-decimal1'                          : params.max_workers_demand,
        'instance_capacity_types_decimal0'              : params.max_workers_demand,
        'instance_capacity_types_decimal1'              : params.instance_capacity_types_demand,
        'cloudwatch_logs'                               : params.cloudwatch_logs,
        'cluster-autoscaler'                            : params.cluster_autoscaler,
        'node_groups_decimal0'                          : params.node_groups_decimal0,
        'node_groups_decimal1'                          : params.node_groups_decimal1,
        'count_decimal0'                                : params.count_decimal0,
        'count_decimal1'                                : params.count_decimal1,
        'num-workers-decimal0'                          : params.num_workers_spot,
        'num-workers-decimal1'                          : params.num_workers_demand,
        'node-ami-decimal0'                             : params.node_ami_decimal0,
        'node-ami-decimal1'                             : params.node_ami_decimal1,
        'inst_disk_size'                                : params.node_instance_disk_size,
        'inst_key_pair'                                 : params.node_instance_key_pair,
        'k8s_version'                                   : params.k8s_version,
        'eks-sg-vpc-cidr'                               : params.eks_sg_vpc_cidr,
        'instance-type-decimal0'                        : params.instance_type_decimal0,
        'instance-type-on-decimal1'                     : params.instance_type_on_decimal1,
        'public_key_file'                               : params.public_key_file,
        'ami'                                           : params.vpc_jumpbox_ami_idcidr,
        'ec2_key_name'                                  : params.jumpbox_key_name,
        'ec2_instance_type'                             : params.jumpbox_instance_type,
        'vrt_db_instance_identifier'                    : params.vrt_db_instance_identifier,
        'vrt_db_security_group'                         : params.vrt_db_security_group,
        'vrt__db_cidr_range'                            : params.vrt__db_cidr_range,
        'major_version'                                 : params.major_version,
        'vrt_db_allocated_storage'                      : params.vrt_db_allocated_storage,
        'engine_version'                                : params.db_engine_version,
        'vrt_db_instance_type'                          : params.vrt_db_instance_type,
        'vrt_database_name'                             : params.vrt_database_name,
        'database_user'                                 : params.database_user,
        'database_password'                             : params.database_password,
        'efs-security-group'                            : params.efs_security_group,
        'replication-id'                                : params.redis_replication_id,
        'redis-cluster'                                 : params.redis_cluster_name,
        'redis-engine'                                  : params.redis_engine,
        'redis-engine-version'                          : params.redis_engine_version,
        'redis-user-name'                               : params.redis_user_name,
        'redis_password'                                : params.redis_password,
        'redis-node-type'                               : params.redis_node_type,
        'transit_encryption_enabled'                    : params.transit_encryption_enabled,
        'redis-user-id'                                 : params.redis_user_id,
        'rest_encryption'                               : params.rest_encryption,
        'parameter-group-family'                        : params.parameter_group_family,
        'auth_token'                                    : params.auth_token,
        'num-node-groups'                               : params.num_node_groups,
        'replicas-per-node-group'                       : params.replicas_per_node_group,
        'js_user'                                       : params.jumpbox_user,
        'eks_key_name'                                  : params.eks_key_name
    ]

    // Format the values correctly
    def formatValue = { value ->
        if (value instanceof Number) {
            return value.toString()
        } else if (value instanceof Map || value instanceof List) {
            return groovy.json.JsonOutput.toJson(value)
        } else {
            return "\"${value}\""
        }
    }

    // Modify the tfvars content with the new values
    newVars.each { key, value ->
        def formattedValue = formatValue(value)
        if (tfvarsContent.contains("${key} =")) {
            // If the key exists, replace its value
            tfvarsContent = tfvarsContent.replaceAll(/(?m)^\s*${key}\s*=.*/, "${key} = ${formattedValue}")
        } else {
            // If the key does not exist, append it
            tfvarsContent += "\n${key} = ${formattedValue}"
        }
    }

    // Write the updated content back to the tfvars file
    writeFile(file: tfvarsPath, text: tfvarsContent)
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
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
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
                  def lbport = params['lb-port'].toInteger()
                  def fromport = params['from_ports'].toInteger()
                  def toport = params['to_ports'].toInteger()              
                  dir('terraform/environments/dev/load_balancer') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"                      
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
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
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
                      sh tfPlanCmd
                      sh 'terraform show -no-color kms_tfplan > kms_tfplan.txt'
                      if (params.action == 'apply') {
                      if (!params.autoApprove) {
                          def plan = readFile 'kms_tfplan.txt'
                          input message: "Do you want to apply the plan?",
                                parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                      }
                      sh "terraform ${params.action} -input=false kms_tfplan"
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
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
                  dir('terraform/environments/dev/ec2-jumpbox') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
                  } else {
                      error "Invalid action selected. Please choose either 'apply' or 'destroy'."
                  }
                      sh "sudo chmod 400 /var/lib/jenkins/workspace/${params.pipeline_name}/terraform/environments/dev/ec2-jumpbox/${params.jumpbox_key_name}.pem"
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
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
                      sh tfPlanCmd
                      sh 'terraform show -no-color efs_tfplan > efs_tfplan.txt'
                      if (params.action == 'apply') {
                      if (!params.autoApprove) {
                          def plan = readFile 'efs_tfplan.txt'
                          input message: "Do you want to apply the plan?",
                                parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                      }
                      sh "terraform ${params.action} -input=false efs_tfplan"
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
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
                  dir('terraform/environments/dev/eks') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"

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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"

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
                  def ondemandcount = params['count-decimal1'].toInteger()
                  def spotcount = params['count-decimal0'].toInteger()
                  def nodeGroupsDecimal0 = readJSON(text: params.node_groups_decimal0)
                  def nodeGroupsDecimal1 = readJSON(text: params.node_groups_decimal1)
                  def instanceTypesDecimal0 = params['instance-type-decimal0'].replaceAll("\\[|\\]|\\s+", "").split(",")
                  def instanceTypesOnDecimal1 = params['instance-type-on-decimal1'].replaceAll("\\[|\\]|\\s+", "").split(",")

                  def nodeGroupsDecimal0JSON = convertToJSONArrayString(nodeGroupsDecimal0)
                  def nodeGroupsDecimal1JSON = convertToJSONArrayString(nodeGroupsDecimal1)          
                  dir('terraform/environments/dev/nodegroups') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"

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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"

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
                  def numnodegroup = params['num-node-groups'].toInteger()
                  def replicanodegroup = params['replicas-per-node-group'].toInteger()
                  dir('terraform/environments/dev/elasticache') {
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -reconfigure"                      
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"

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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
                      
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
                      
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
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
                      sh "terraform init \
                          -backend-config='bucket=${params.bucket_name}' \
                          -backend-config='region=${params.region}' \
                          -migrate-state"
                      
                      def tfPlanCmd = "terraform plan --var-file ../../../variables/dev.tfvars"
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
                      sh "terraform ${params.action} --auto-approve --auto-approve --var-file ../../../variables/dev.tfvars"
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
