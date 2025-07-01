pipeline {
    agent any

    parameters {
        string(name: 'BUILD_VERSION', defaultValue: 'v1.0.0', description: 'Docker image tag')
    }

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds')
        DOCKER_IMAGE_NAME = 'reyad009/jenkins'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/reyad009/jenkins_dipti_20250701.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Build version: ${params.BUILD_VERSION}"
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${params.BUILD_VERSION} ."
                }
            }
        }

        stage('Docker Login & Push') {
            steps {
                script {
                    echo "Logging in and pushing image to Docker Hub..."
                    sh """
                        echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin
                        docker push ${DOCKER_IMAGE_NAME}:${params.BUILD_VERSION}
                    """
                }
            }
        }
    }
}
