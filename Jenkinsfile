pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'test_2'
        DOCKERFILE_PATH = 'Dockerfile'
        CONTAINER_NAME = 'c2' 
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image using the specified Dockerfile
                    sh "docker build -t $DOCKER_IMAGE -f $DOCKERFILE_PATH ."
                }
            }
        }

        // stage('Test') {
        //     steps {
        //         script {
        //             // Run tests inside the Docker container if needed
        //             // You can customize this step based on your testing requirements
        //             // sh "docker run $DOCKER_IMAGE mvn test"
        //         }
        //     }
        // }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove the previous container, if it exists
                    sh "docker stop $CONTAINER_NAME || true"
                    sh "docker rm $CONTAINER_NAME || true"

                    // Run the Docker container
                    sh "docker run -d --name $CONTAINER_NAME -p 8081:8080 $DOCKER_IMAGE"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! Triggering any additional post-success actions...'
            // You can add more post-success actions here
        }

        failure {
            echo 'Pipeline failed! Triggering any additional post-failure actions...'
            // You can add more post-failure actions here
        }
    }
}
