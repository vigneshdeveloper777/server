pipeline {
    agent any
    
    stages {
        stage('Gradle Build') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/vigneshdeveloper777/server']])
                sh './gradlew clean build -xtest'
            }
        }
        stage('Docker Image Build') {
            steps {
                script {
                    sh 'docker build -t vigneshdeveloper777/server-0.0.1-snapshot:latest .'
                }
            }
        }
        stage('Docker Image Push to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerpwd')]) {
                        sh 'docker login -u vigneshdeveloper777 -p ${dockerpwd} docker.io'
                        sh 'docker push vigneshdeveloper777/server-0.0.1-snapshot'
                    }
                }
            }
        }
    }
}
