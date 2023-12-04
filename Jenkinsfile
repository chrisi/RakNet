pipeline {
  agent  { label 'cloud-arm64' }
  environment {
    GTI_CMAKE_REPO = '/tmp'
  }
  stages {
    stage('Build Project') {
      steps {
        sh("mkdir -p build")
        dir("build") {
          sh("cmake -DCMAKE_BUILD_TYPE=Release ..")
          sh("cmake --build .")
        }
      }
    }
    stage('Install Project') {
      steps {
        dir("build") {
          sh("make install")
        }
      }
    }
    stage('Package Project') {
      steps {
        dir("build") {
          sh("cpack")
        }
      }
    }
    stage('Upload Package') {
      steps {
        dir("build") {
          sh('curl -u "deb:latrop0815" -H "Content-Type: multipart/form-data" --data-binary "@./raknet.deb" "https://nexus.gtidev.net/repository/gtideb/"')
        }
      }
    }
  }
}
