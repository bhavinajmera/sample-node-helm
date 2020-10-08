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
              sh "helm repo add stable https://shailendra14k.github.io/sample-helm-chart/"
              sh "helm repo update"
              openshift.withCluster(){
                  openshift.withProject() {
                                    // delete everything with this template label
                                    openshift.selector("all", [ template : templateName ]).delete()
                                    // delete any secrets with this template label
                                    if (openshift.selector("secrets", templateName).exists()) {
                                        openshift.selector("secrets", templateName).delete()
                                    }
                                }

              }
            }
          }
        }
