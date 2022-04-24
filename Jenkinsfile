pipeline {
    agent any

    stages {
        stage ('Build') {
            steps{
                sh "scripts/build.sh"
            }
        }
        stage ('Test') {
            steps{
                sh "scripts/unit_tests.sh"
            }
        }
        stage ('Deploy') {
            steps {
                sh "scripts/deploy.sh"
            }
        }
    
    }
}