podTemplate(label: label, cloud: 'openshift',
        containers: [

                containerTemplate(name: 'helm', image: 'image-registry.openshift-image-registry.svc:5000/jenkins-ci/helm', command: 'cat', ttyEnabled: true)
        ]

) {
    node(label) {
      stages{
        stage('Checkout Repo') {
//            git credentialsId: gitHubCredentials, url: gitRepoUrl
            git gitRepoUrl
        }
        
        stage('Add Stable Repo') {
          steps{
                sh "mkdir -p /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm"
                sh "mkdir -p /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
                sh "helm repo add stable https://shailendra14k.github.io/sample-helm-chart/ --repository-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.yaml --registry-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.json --repository-cache /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
                sh "helm repo update --repository-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.yaml --registry-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.json --repository-cache /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
          }
        }
        stage('Deploy ChartMuseum and Add Repo') {
          steps{
            script{
                openshift.withCluster(){
                sh "helm upgrade --install my-guestbook shailendra/guestbook --values dev/values.yaml --wait"
                }  
            }
           }
          }
       }
    }
}

