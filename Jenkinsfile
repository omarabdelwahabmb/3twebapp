def apply() {
    script {
        dir ("${params.path}/terraform") { 
            echo "applying"
            sh "/usr/bin/terraform init"
            sh "/usr/bin/terraform apply -auto-approve"
            sh "/usr/bin/terraform destroy --target aws_instance.PublicWebTemplate"
            sh "/usr/bin/terraform destroy --target aws_instance.PublicappTemplate"
        }
    }
}

def destroy() {
    script {
        dir ("${params.path}/terraform") {
            echo "destroying"
            sh "/usr/bin/terraform init"
            sh "/usr/bin/terraform destroy -auto-approve"
        }
    }
}


pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    parameters {
        string(defaultValue: '/home/omar/Eng/Courses/DEPI/Technical/Project3tier/trial2/3twebapp', description: 'Please, Enter project path', name: 'path')
        choice(name: 'action', choices: ['apply', 'destroy'], 
        description: 'Please, choose whether to apply or destroy the infrastructure.')
    }
    
    stages {
        stage('Checkout') {
           steps {
                dir ("${params.path}") { 
                    git branch: 'main', url: 'https://github.com/omarabdelwahabmb/3twebapp.git'
                }
           }
        }
        stage('Build') {
            steps {
                script {
                    switch(params.action) {
                        case "apply":
                            apply()
                        case "destroy":
                            destroy()
                        default:
                            echo "wrong choice!"
                    }
                }
            }
        }
    }
}
