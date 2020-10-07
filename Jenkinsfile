
def label = "helm-jenkins-${UUID.randomUUID().toString()}"
def gitRepoUrl = "https://github.com/shailendra14k/sample-helm-chart"
def repo="https://shailendra14k.github.io/sample-helm-chart"
//def gitHubCredentials = "GitHubCreds"

podTemplate(label: label, cloud: 'openshift',
        containers: [
  
                containerTemplate(name: 'helm', image: 'image-registry.openshift-image-registry.svc:5000/jenkins-ci/helm', command: 'cat', ttyEnabled: true)
        ]
        
) {
    node(label) {
        stage('Checkout Repo') {
//            git credentialsId: gitHubCredentials, url: gitRepoUrl
            git gitRepoUrl
        }

        def props = readProperties file:'./deployment/jenkins/pipelines.properties'
        def baseDeployDir = props["baseDeployDir"]
        def appNamespace = props["appNamespace"]
        def releaseName = props["releaseName"]
        def helmRepository = props["helmRepository"]

        stage('Add Stable Repo') {
            steps {
                sh "mkdir -p /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm"
                sh "mkdir -p /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
                sh "helm repo add stable https://shailendra14k.github.io/sample-helm-chart/ --repository-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.yaml --registry-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.json --repository-cache /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
                sh "helm repo update --repository-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.yaml --registry-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.json --repository-cache /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
        
            }
        }

        stage('Deploy ChartMuseum and Add Repo') {
            container('helm') {
                sh "helm upgrade --install my-guestbook shailendra/guestbook --values dev/values.yaml --wait"
                
                            }
        }



    }
}


