pipeline {
    agent {
        docker {
            image 'ruby:2.5'
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'bundle install' 
            }
        }
    }
}
