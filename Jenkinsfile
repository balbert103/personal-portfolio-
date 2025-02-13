pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "my-web-server"
        CONTAINER_NAME = "webserver"
        DOCKER_PORT = "8001"  // Change if needed
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """
                }
            }
        }

        stage('Deploy New Container') {
            steps {
                script {
                    sh "docker run -d -p ${DOCKER_PORT}:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }
}
