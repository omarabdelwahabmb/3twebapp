def apply() {
    script {
        dir ("${params.path}/terraform") { 
            echo "applying"
            //sh "terraform init"
            sh "terraform apply -auto-approve"
            sh "terraform destroy --target aws_instance.PublicWebTemplate"
            sh "terraform destroy --target aws_instance.PublicappTemplate"
        }
    }
}

def destroy() {
    script {
        dir ("${params.path}/terraform") {
            echo "destroying"
            //sh (returnStdout: true, script: "terraform init") 
            echo "finished init"
            sh "terraform destroy -auto-approve"
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
