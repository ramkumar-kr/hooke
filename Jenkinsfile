pipeline {
  agent {
    docker {
      image 'ruby:2.5.1-alpine'
    }

  }
  stages {
    stage('Bundle install') {
      agent {
        docker {
          image 'ruby:2.5.1-alpine'
        }

      }
      steps {
        sh 'bundle install'
        echo 'D'
      }
    }
  }
}