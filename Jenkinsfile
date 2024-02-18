pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
             
                checkout scm
            }
        }

        stage('Flyway Migration') {
            steps {
                script {
                   
                    sh "flyway migrate -configFiles=conf/flyway.toml"
                }
            }
        }
    }

    post {
        success {
            echo 'Flyway migration successful!'
        }
        failure {
            echo 'Flyway migration failed!'
        }
    }
}
