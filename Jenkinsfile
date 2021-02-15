pipeline {
    agent any 
    stages {
        // Sonar Análise
        stage ('Sonar Análise') {
            environment {
                SONAR_SCANNER = tool 'SONAR_SCANNER'
            }
            steps {
                script {
                    withSonarQubeEnv('SONAR_LOCAL') {
                        sh "${SONAR_SCANNER}/bin/sonar-scanner -e -Dsonar.projectKey=DeployPHP \ 
                            -Dsonar.sources=./app \ 
                            -Dsonar.host.url=http://172.16.100.102:9000 \ 
                            -Dsonar.login=04f557c3ab99d0f3005c8a7e9e6773759d2ff7f2 \ 
                            -Dsonar.coverage.exclusions=**ok.php** \ 
                            -Dsonar.report.export.path=sonar-report.json"
                }
                }
            }
        }
        // Sonar QG
        // Não sei o pq está apresentando erro, solução retirada do StackOverflow
        stage ('Sonar QG') {
            steps {
                sleep(10)
                timeout(time: 1, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        // Removendo builds antigas
        stage ('Removendo builds') {
            steps {
                script {
                    try {
                        sh 'docker rm -f jenkings_nginx'
                        sh 'docker rm -f jenkings_php'                        
                    } catch(error) {
                        sh 'echo Sem imagens para remover'
                    }
                }
            }
        }
        // Deploy Docker
        stage ('Deploy Docker') {
            steps {
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
        }
        // Verificando se o serviço está online
        stage ('Check Healt') {
            steps {
                timeout(time: 15, unit: 'SECONDS') {
                    script {
                        try {
                            sh 'curl -s --head --request GET http://172.16.100.102/ok.php | grep 200'
                            return true
                        } catch (Exception e) {
                            return false
                        }
                    }
                }
            }
        }
        //
    }
    post {
        always {
            emailext attachLog: true, body: 'Log em anexo', subject: 'Build $BUILD_NUMBER OK',
                to: 'rafael@libre.tec.br'
        }
        unsuccessful {
            emailext attachLog: true, body: 'Log em anexo', subject: 'Build $BUILD_NUMBER falhou',
                to: 'rafael@libre.tec.br'
        }
        fixed {
            emailext attachLog: true, body: 'Log em anexo', subject: 'Build $BUILD_NUMBER OK',
                to: 'rafael@libre.tec.br'
        }
    }
}