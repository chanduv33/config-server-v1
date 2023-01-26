pipeline {
    agent any
    tools {
        maven 'maven'
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
    }

    environment {
        dockerHome = tool 'docker'
        PATH = "${dockerHome}/bin:$PATH"
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

                sh "docker build . -t config.jar:${env.BUILD_NUMBER}"
                sh "docker login -u ${usernameVariable} -p ${passwordVariable}"
                sh "docker push image -t config.jar:${env.BUILD_NUMBER} chanduv33/config-server:${env.BUILD_NUMBER}"
            }
            }
        }
    }
}