pipeline {
    environment {
        DOCKERHUB_CREDENTIALS = credentials("")
    }
    agent {
        label 'KM'
    }
    stages {
        stage('Git') {
            steps {
                git 'https://github.com/Techie-Vighnaraj/Website-PRT-ORG.git', branch:'main'
            }
        }
        stage('Docker') {
            steps {
                sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -P {DOCKERHUB_CREDENTIALS_PSW}'
                sh 'sudo docker build /home/ubuntu/jenkins/workspace/KM-PRT-Test/ -t techievighnaraj650/prt-task'
                sh 'sudo docker push techievighnaraj650/prt-task'
            }
        }
        stage('K8s') {
            steps {
                sh 'kubectl apply -f deploy.yml'
                sh 'kubectl apply -f service.yml'
            }
        }
    }
}
