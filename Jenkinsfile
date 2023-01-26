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

                docker.withRegistry('', 'docker') {

                    def customImage = docker.build("config-server:${env.BUILD_NUMBER}")

                    /* Push the container to the custom Registry */
                    customImage.push()
                    customImage.push('latest')
                }
            }
        }
    }
}