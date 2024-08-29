def apply() {
    script {
        dir ("${params.path}/terraform") { 
            sh "terraform init"
            sh "terraform apply"
            sh "terraform destroy --target aws_instance.PublicWebTemplate"
            sh "terraform destroy --target aws_instance.PublicappTemplate"
        }
    }
}

def destroy() {
    script {
        dir ("${params.path}/terraform") { 
            sh "terraform init"
            sh "terraform destroy"
        }
    }
}


pipeline {
    agent any
    
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
                    switch(params.choice) {
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
