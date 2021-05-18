pipeline {
       agent any 
        stages {
                stage('prepare artifacts') {
                        steps{
                                sh '''
                                zip -r ../frontend.zip *
                                '''
                        }
                }
                stage('upload artifacts'){
                        steps{
                                sh '''
                                curl -f -v -u admin:admin --upload-file frontend.zip http://172.31.3.145:8081/repository/frontend/frontend.zip
                                '''
                          
                        }
                }
        }
}