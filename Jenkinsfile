pipeline {
    agent any
    tools {
        maven 'maven'
        dockerTool 'docker'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage ('Build and Push') {
            steps{
            withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
            sh '''
                docker build . -t config.jar:${env.BUILD_NUMBER}
                docker login -u $usernameVariable -p $passwordVariable
                docker push image -t config.jar:${env.BUILD_NUMBER} chanduv33/config-server:${env.BUILD_NUMBER}
            '''
            }
            }
        }
    }
}