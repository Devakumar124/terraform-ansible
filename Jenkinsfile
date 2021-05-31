pipeline{
    agent any
    
        tools{
            terraform 'terraform'
        }
        stages {
         stage('cloning'){
                steps{
                    git 'https://github.com/Devakumar124/terraform-ansible.git'
                    
                }
             }
            stage('terraform init'){
                steps{
                    sh 'terraform init'
                }
                
             }
             stage('terraform plan'){
                steps{
                    sh 'terraform plan'
                }
                
             }
             stage('terraform destroy'){
                steps{
                    sh 'terraform destroy --auto-approve'
                }

             }
         }
    }

    //jenik file 
    //destroy style

