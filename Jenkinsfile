pipeline {
  agent {
    label 'azure'
  }
  environment {
    tf_version = '0.12.8'
    tf_path = "$WORKSPACE/terraform_jenkins"  
    account_moniker="${tf_vars_file}"
    git_creds = credentials("$git_cred")
	ARM_USE_MSI=true
	ARM_SUBSCRIPTION_ID= "${subscription_ID}"   
	ARM_TENANT_ID= 'c932c2b6-d7c0-45dd-bc88-b1d79ac4f500'              
  }

  stages {
  
     stage('Terraform-Init') {
	       
           steps {
                   ansiColor('xterm') {
                                    
                                        sh 'env |grep -i GIT'
                                        sh 'set |grep -i GIT'
                                            
										sh '''#!/bin/bash -l
										
										echo "Subscription being applied to          : $subscription_ID"
										echo "Agent being executed on                : $cloud_subscription"
										echo "Terraform resource module selected     : $resource_module"
										echo "Destroy Flag                           : $destroy"
										
										
										
										#Setting up Terraform 
										  echo "Downloading Terraform ${tf_version}"
                                          rm -f terraform_${tf_version}_linux_amd64.zip
                                          sudo apt install unzip -y
                                          wget -q https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_amd64.zip
                                          unzip -qo terraform_${tf_version}_linux_amd64.zip
                                          rm -f terraform_${tf_version}_linux_amd64.zip
                                          chmod 755 terraform
                                          ./terraform --version
										  
										#Setting the Subscription
										 sh 'set ARM_USE_MSI=true'
										 sh 'set ARM_SUBSCRIPTION_ID=$subscription_ID'
										 sh 'set ARM_TENANT_ID=$ARM_TENANT_ID'
										 
										#Remove previous Terraform Modules
										 rm -rf .terraform
										 
										#Perform Terraform-Init
										 set -x 
										 ./terraform init $tf_path
										 '''
										 
										 }
					             }
							}
						
					
  		
      stage('Terra-Plan') {	
        
          steps {
             
                        echo 'Plan stage of the pipeline is about to begin!'
                        sh '''#!/bin/bash -l
				        echo "Terraform Plan is being executed for $cloud_subscription "
                        set -x
                        echo "current working directory : "`pwd`

                        echo "Destroy flag is : $destroy"
                        if [ $destroy = false ]
                        then
                        ./terraform plan -var-file="./${tf_path}/${tf_vars_file}.tfvars" -out=current_apply.tfplan ./$tf_path
                        else
                       ./terraform plan -destroy -var-file="./${tf_path}/${tf_vars_file}.tfvars" -out=current_destroy.tfplan ./$tf_path
                       fi
                  

                  '''

        }
    }

       
     stage('Approve-to-Apply') {
        when {
            expression { !params.destroy }
        }
      steps {
          input 'You are about to deploy the new Infrastucture! \n Take a deep breath and review the Output of previous step before proceeding!!'
      }
    }	   
    
	
	stage('Terraform-Apply') {
	when {
            expression { !params.destroy }
        }
        steps {
          echo 'Terraform has started applying the changes'
                sh '''#!/bin/bash -l

                  echo "Terraform Apply is being executed on $cloud_subscription "
                  set +x
                  ./terraform apply current_apply.tfplan

                  '''
      }
    }
	
	
	stage('Approve-to-Destroy') {
        when {
            expression { params.destroy }
        }
      steps {
          input 'Do you want to destroy the resources ? \n Take a deep breath and review the Output of previous step before proceeding!!'
      }
    }
	
	
	
	  stage('Terraform-Destroy') {
            when {
                expression { params.destroy }
            }
            steps {
                echo "Terraform destroy stage is about to begin in $cloud_subscription"

                sh '''#!/bin/bash -l

                  echo "Terraform Destroy of $account_moniker in $cloud_subscription"
                  set -x
                  ./terraform apply current_destroy.tfplan

                  '''

            }
        }
  }								 
}										 
 	
