pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
    }
    tools {
        maven "Maven"
    }
    stages {
        stage ("git clone") {
            steps {
                git branch: 'main', url: 'https://github.com/gubbi555/prakash.git'
            }
        }
        stage ('build') {
           steps {
               sh "mvn install"
           }
       }
       stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t simpleweb:latest .'
           }
       }
       stage ('run') {
           steps {
               sh 'docker run -d -p 8060:8080 simpleweb:latest'
           }
       }
       stage ('login and push') {
           steps {
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
               sh 'docker tag simpleweb:latest prakashmk/simpleweb:latest'
               sh 'docker push prakashmk/simpleweb:latest'
           }
       }
    }
}
