pipeline {
        agent any 
        stages {
                stage('prepare artifacts') {
                        steps{
                                sh '''
                                cd static
                                zip -r ../frontend.zip *
                                '''
                        }
                }
        }
}