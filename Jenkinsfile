pipeline {
    agent any
    
    stages {
        stage('Save Artifact') {
            steps {
                archiveArtifacts artifacts: 'main.rb', followSymlinks: false
            }
        }
    }
}
