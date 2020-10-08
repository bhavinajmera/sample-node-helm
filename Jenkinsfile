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
              sh "git clone https://github.com/openshift/openshift-jee-sample.git ."
              sh "helm repo add stable https://shailendra14k.github.io/sample-helm-chart/"
              openshift.withCluster(){
                openshift.withProject() {
                  sh "helm upgrade --install my-guestbook shailendra/guestbook -n jenkins-ci --wait"
                }
              }
            }
          }
        }
