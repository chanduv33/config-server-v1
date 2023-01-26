pipeline {
    agent any
    tools {
        maven 'maven'
        docker 'docker', type: 'dockerTool'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
        }
        stage ('Build and Push') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                sh '''
                    docker build Dockerfile -t config.jar:$env.BUILD_NUMBER
                    docker login -u $usernameVariable -p $passwordVariable
                    docker push image -t config.jar:$env.BUILD_NUMBER chanduv33/config-server:$env.BUILD_NUMBER
                '''
                }
            }
        }
    }
}