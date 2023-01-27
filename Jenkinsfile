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

                sh "docker build . -t config:${env.BUILD_NUMBER}"
                sh "docker login -u $USERNAME -p $PASSWORD"
                sh "docker tag config:${env.BUILD_NUMBER} chanduv33/config-server:${env.BUILD_NUMBER}"
                sh "docker push chanduv33/config-server:${env.BUILD_NUMBER}"
            }
            }
        }

        stage ('Delpoy') {
            steps {
              script {
	                 withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
	                    sh "ssh chandrasekharvemugadda@192.168.0.108"
	                    sh "docker login -u $USERNAME -p $PASSWORD"
	                    sh "docker pull chanduv33/config-server:${env.BUILD_NUMBER}"
	                    sh "docker run -d -p 8089:8089 config:${env.BUILD_NUMBER}"
	                }     
                }           
            }
        }
    }
}