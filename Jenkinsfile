        podTemplate(label: "mypod", 
                    cloud: "openshift", 
                    containers: [
            containerTemplate(name: "mypod", 
                              image: "image-registry.openshift-image-registry.svc:5000/jenkins-ci/helm1", 
                              command: 'cat',
                              ttyEnabled: true)
        ])
        {
          node("mypod") { 
            sh "mkdir -p /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm"
            sh "mkdir -p /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
            sh "helm repo add stable https://shailendra14k.github.io/sample-helm-chart/ --repository-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.yaml --registry-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.json --repository-cache /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
            sh "helm repo update --repository-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.yaml --registry-config /home/jenkins/agent/workspace/jenkins-ci/helm/.config/helm/repositories.json --repository-cache /home/jenkins/agent/workspace/jenkins-ci/helm/.cache/helm/repository"
            sh "helm upgrade --install my-guestbook shailendra/guestbook --values dev/values.yaml -n dev --wait"
          }
        }
