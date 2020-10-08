        podTemplate(label: "mypod", 
                    cloud: "openshift", 
                    podRetention: onFailure(),
                    containers: [
            containerTemplate(name: "centos7-helm", 
                              image: "default-route-openshift-image-registry.apps.shared-na4.na4.openshift.opentlc.com/jenkins-ci/centos7-helm", 
                              command: "cat", 
                              ttyEnabled: true)
          ]) {
          node("mypod") { 
            sh "git clone https://github.com/openshift/openshift-jee-sample.git ."
            sh "helm repo add stable https://shailendra14k.github.io/sample-helm-chart/"
            sh "oc start-build -F openshift-jee-sample-docker --from-file=target/ROOT.war"
          }
        }
