pipeline {
    agent any 
    stages {
        // Sonar Análise
        stage ('Sonar Análise') {
            environment {
                SONAR_SCANNER = tool 'SONAR_SCANNER'
            }
            steps {
                withSonarQubeEnv('SONAR_LOCAL') {
                    sh "${SONAR_SCANNER}/bin/sonar-scanner -e -Dsonar.projectKey=DeployPHP -Dsonar.sources=./app -Dsonar.host.url=http://172.16.100.102:9000 -Dsonar.login=0074229cf1d5f776dd81225df8b41a36a5d92ab6"
                }
            }
        }
        // Sonar QG
        stage ('Sonar QG') {
            steps {
                sleep(20)
                timeout(time: 1, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        //
    }
}