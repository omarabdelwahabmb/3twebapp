// arn:aws:s3:::yat-group3
def apply() {
    script {
        dir ("${params.projectPath}/terraform") { 
            echo "applying"
            sh("aws s3 cp s3://yat-group3/terraform/ . --exclude \"*\" --include \"*.tfstat*\" --recursive")
            sh("terraform init")
            sh("terraform apply -auto-approve")
            sh("terraform destroy --target aws_instance.PublicWebTemplate")
            sh("terraform destroy --target aws_instance.PublicappTemplate")
            sh("aws s3 cp . s3://yat-group3/terraform/ --exclude \"*\" --include \"*.tfstat*\" --recursive")
        }
    }
}

def destroy() {
    script {
        dir ("${params.projectPath}/terraform") {
            echo "destroying"
            sh("aws s3 cp s3://yat-group3/terraform/ . --exclude \"*\" --include \"*.tfstat*\" --recursive")
            sh("terraform init")
            sh("terraform destroy -auto-approve")
            sh("aws s3 cp . s3://yat-group3/terraform/ --exclude \"*\" --include \"*.tfstat*\" --recursive")
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
        string(defaultValue: '/home/omar/Eng/Courses/DEPI/Technical/Project3tier/trial2/3twebapp', description: 'Please, Enter project path', name: 'projectPath')
        choice(name: 'action', choices: ['apply', 'destroy'], 
        description: 'Please, choose whether to apply or destroy the infrastructure.')
    }
    
    stages {
        stage('Checkout') {
           steps {
                dir ("${params.projectPath}") { 
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
