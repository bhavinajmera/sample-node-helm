        podTemplate(label: "mypod", 
                    cloud: "openshift", 
                    inheritFrom: "maven", 
                    containers: [
            containerTemplate(name: "jnlp", 
                              image: "openshift/jenkins-agent-maven-35-centos7:v3.10", 
                              resourceRequestMemory: "512Mi", 
                              resourceLimitMemory: "512Mi", 
                              envVars: [
              envVar(key: "CONTAINER_HEAP_PERCENT", value: "0.25") 
            ])
          ]) {
          node("mypod") { 
            sh "git clone https://github.com/openshift/openshift-jee-sample.git ."
            sh "mvn -B -Popenshift package"
            sh "oc start-build -F openshift-jee-sample-docker --from-file=target/ROOT.war"
          }
        }
