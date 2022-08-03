pipeline {
    agent any
    stages {
        stage ('clning git') {
            steps {
                git branch: 'main', url: 'https://github.com/gubbi555/prakash.git'
            }
        }
        stage ('build') {
            steps {
                sh "docker build . -t tomcat:1.0"
            }
        }
        stage ('login') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                   sh "docker login -u prakashmk -p ${dockerHubPwd}" 
            }
            }
        }
        stage ('push') {
            steps {
                sh "docker tag tomcat:1.0 prakashmk/tomcat:1.0"
                sh "docker push prakashmk/tomcat:1.0"
            }
        }
        stage ('deploy') {
            steps {
                sh "docker run -d -p 8081:8080 prakashmk/tomcat:1.0"
            }
        }
    }
}
