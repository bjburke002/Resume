pipeline {
    agent any

    stages {
        stage ('Build') {
            sh "scripts\build.sh"
        }
        stage ('Test') {
            sh "scripts\unit_tests.sh"
        }
        stage ('Deploy') {
            sh "scripts\deploy.sh"
        }
    }
}