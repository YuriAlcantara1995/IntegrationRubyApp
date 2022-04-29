pipeline {
    agent any
    
    stages {
        stage('Save Artifact') {
            steps {
                archiveArtifacts artifacts: 'main.rb', followSymlinks: false
            }
        }
        stage('Login into DockerHub') {
        	steps {
        	    withCredentials([usernamePassword(credentialsId: "docker-token", usernameVariable: 'username', passwordVariable: 'password')]) {
         	    sh 'docker  login --username ${username} --password ${password}'    	
         	    }
        	}
        }
        stage('Build docker image') {
        	steps {
        		sh "docker build . --tag yuriao/devops:${BUILD_ID}"
        	}
        }
        stage('Push docker image') {
        	steps {
        		sh "docker push yuriao/devops:${BUILD_ID}"
        	}
        }

    }
}
