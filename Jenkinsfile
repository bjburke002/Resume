pipeline {
    agent any

    stages {
        stage ('Build') {
            steps{
                sh "chmod -R 777 scripts/build.sh"
                sh "scripts/build.sh"
            }
        }
        stage ('Test') {
            steps{
                sh "chmod -R 777 scripts/unit_tests.sh"
                sh "scripts/unit_tests.sh"
            }
        }
        stage ('Deploy') {
            steps {
                sh "chmod -R 777 scripts/deploy_website.sh"
                sh "scripts/deploy_website.sh"
            }
        }
    
    }
}