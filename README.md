
#Jenkins SandBox

Is a tool for MergeBase to setup a SandBox for Jenkins with DSL builds.

#Local

This is an instance of Jenkins within docker as though you were to download it and run on the server.  The UI isused for all changes.

 - docker/local
      - Contains the docker files need to run this
 - jenkins-home/local
      - Contains the jenkins home folder that is mapped in the docket folder.
 - jenkins-local.run.sh
      - Is the start up script
         - -p  port to run jenkins on (Default: 8081 )
         - -h  the patch of the jenkins home folder (Default: jenkins-home/local
         
#Build

This is an instance of Jenkins within docker is built at start up, and selected files are injected into the jenkins-home folder on the docker image.  Withing this instacen you can control the jobs and teh pligins through the code.
 
 - docker/build
      - Contains the docker files need to run this
 - jenkins-home/build
      - Contains selected items to be injected into the jenkins home folder in the docker image
          - dsl : Contains the DSL script to create Jenkins jobs from
          - init.groovy.d : Contains the groovy script that runs on Jenkins start up to add the seed job
          - jobs/seed : Is a see job that runs and injects the DSL jobs from the dsl folder at start up.
          - plugins.txt - Contains the plugins to install on Jenkens at build time.
 - jenkins-local.run.sh
      - Is the start up script
         - -p  port to run jenkins on (Default: 8081 )

#Other Commands         

 - Get the admin password (Local use only))
    - docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

 - Gain bash access to the docker image
    - docker exec -it jenkins bash