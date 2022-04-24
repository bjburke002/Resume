pipeline {
    agent any

    stages {
        stage ('Build') {
            steps{
                sudo bash "scripts/build.sh"
            }
        }
        stage ('Test') {
            steps{
                sudo bash "scripts/unit_tests.sh"
            }
        }
        stage ('Deploy') {
            steps {
                sudo bash "scripts/deploy.sh"
            }
        }
    
    }
}