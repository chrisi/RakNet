pipeline {
  agent  { label 'pi' }
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
  }
}
