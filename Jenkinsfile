pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'myapp:latest'
    }

    stages {

        stage('Build') {
            steps {
                echo '🔨 Compilando el proyecto...'
                // Compilar proyecto Java con Maven
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Ejecutando pruebas...'
                // Ejecutar pruebas unitarias
                sh 'mvn test'
            }
        }

        stage('Docker Build & Deploy') {
            steps {
                echo '🚀 Construyendo imagen Docker y desplegando...'
                
                // Construir imagen Docker
                sh 'docker build -t $DOCKER_IMAGE .'

                // (Opcional) Detener contenedor anterior
                sh 'docker stop myapp || true'
                sh 'docker rm myapp || true'

                // Ejecutar contenedor Docker
                sh 'docker run -d --name myapp -p 8080:8080 $DOCKER_IMAGE'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline ejecutado correctamente.'
        }
        failure {
            echo '❌ Error en el pipeline.'
        }
    }
}
