FROM jenkins:2.60.3

ENV JENKINS_REF /usr/share/jenkins/ref

# install jenkins plugins
COPY jenkins-home/build/plugins.txt $JENKINS_REF/
RUN /usr/local/bin/plugins.sh $JENKINS_REF/plugins.txt

ENV JAVA_OPTS -Dorg.eclipse.jetty.server.Request.maxFormContentSize=100000000 \
 			  -Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Los_Angeles \
 			  -Dhudson.diyChunking=false \
 			  -Djenkins.install.runSetupWizard=false

# copy scripts and ressource files
COPY jenkins-home/build/*.* $JENKINS_REF/
COPY jenkins-home/build/userContent $JENKINS_REF/userContent
COPY jenkins-home/build/jobs $JENKINS_REF/jobs/
COPY jenkins-home/build/init.groovy.d $JENKINS_REF/init.groovy.d/
COPY jenkins-home/build/dsl $JENKINS_REF/dsl/
