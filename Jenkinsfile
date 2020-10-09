        podTemplate(label: "mypod", 
                    cloud: "openshift", 
                    containers: [
            containerTemplate(name: "jnlp-agent-helm", 
                              image: "image-registry.openshift-image-registry.svc:5000/jenkins-ci/jnlp-agent-helm", 
                              command: "cat", 
                              ttyEnabled: true)
          ]) {
          node("mypod") { 
            container('jnlp-agent-helm') {
              sh "helm repo add stable https://kubernetes-charts.storage.googleapis.com/"
              sh "helm repo update"
              openshift.withCluster(){
                openshift.withProject() {
                  sh "helm upgrade --install mysql stable/mysql -n jenkins-ci --wait"
                } 
              }
            }
          }
        }
