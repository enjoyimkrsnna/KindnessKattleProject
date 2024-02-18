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
                    // Use the full path to the flyway executable
                    bat '"C:\\Program Files\\Red Gate\\Flyway Desktop\\flyway\\flyway" migrate -outOfOrder=true -configFiles=conf/flyway.toml'
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
