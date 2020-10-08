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
              sh "oc start-build -F openshift-jee-sample-docker --from-file=target/ROOT.war"
            }
          }
        }
