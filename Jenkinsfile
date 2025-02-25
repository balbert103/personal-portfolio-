pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "test-web-app"
        DOCKER_CONTAINER = "Nginx-test-server"
        SERVER_IP = "192.168.1.7:8002"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/balbert103/personal-portfolio-'
            }
        }

        stage('Build Project') {
            steps {
                sh 'npm install'  // Change to 'composer install' for PHP or 'pip install -r requirements.txt' for Python
                sh 'npm run build' // Adjust for your build process
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy to Web Container') {
            steps {
                sh """
                docker stop ${DOCKER_CONTAINER} || true
                docker rm ${DOCKER_CONTAINER} || true
                docker run -d --name ${DOCKER_CONTAINER} --network web-testing-net -p 8080:80 ${DOCKER_IMAGE}
                """
            }
        }
    }
}
