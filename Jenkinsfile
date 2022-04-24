pipeline {
    agent any

    stages {
        stage ('Build') {
            steps{
                bash "scripts/build.sh"
            }
        }
        stage ('Test') {
            steps{
                bash "scripts/unit_tests.sh"
            }
        }
        stage ('Deploy') {
            steps {
                bash "scripts/deploy.sh"
            }
        }
    
    }
}