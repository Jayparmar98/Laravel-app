pipeline {
    agent any

    environment {
        IMAGE = "laravel-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', credentialsId: 'github', url: 'https://github.com/Jayparmar98/Laravel-12-CURD-App.git'
            }
        }

    //     stage('Build Docker Image') {
    //         steps {
    //             sh 'docker build -t $IMAGE:latest .'
    //         }
    //     }

    //     stage('Deploy to Kubernetes') {
    //         steps {
    //             sh 'kubectl apply -f k8s/'
    //         }
    //     }
    // }

    // post {
    //     success {
    //         echo '✔ Deployment successful!'
    //     }
    //     failure {
    //         echo '❌ Deployment failed.'
    //     }
    }
}
