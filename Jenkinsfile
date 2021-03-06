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
        stage('Run QA deployment') {
        	when {
        		not {
        			branch 'master'
        		}
      		}
        	steps {
        		build job: 'DeployRuby', parameters: [string(name: 'DEPLOY_TO', value: 'qa'),
        						       string(name: 'BRANCH_NAME', value: 'qa')]
        	}
        }
        stage('Run PROD deployment') {
        	when {
        		branch 'master'
      		}
        	steps {
        		build job: 'DeployRuby', parameters: [string(name: 'DEPLOY_TO', value: 'prod'),
		      							   string(name: 'BRANCH_NAME', value: 'master')]
        	}
        }
    }
}
