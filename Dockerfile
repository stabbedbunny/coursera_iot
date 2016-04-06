# Fetch latest ubuntu docker image
FROM ubuntu:latest

# Install Java on your ubuntu image.
RUN \
  apt-get update && \
  rm -rf /var/lib/apt/lists/*

# Make a directory where your files will be stored
RUN mkdir /grader
RUN mkdir /grader/pythonOnRpiGrader
RUN mkdir /grader/node.jsGrader
# Below commands copy the files that you need to put in your docker image

COPY executeGrader.sh /grader/executeGrader.sh

# Copy files for Factoring Grader
COPY pythonOnRpiGrader/* /grader/pythonOnRpiGrader/
COPY node.jsGrader/* /grader/node.jsGrader/


# Write permissions: Maybe required by someone
RUN chmod a+rwx -R /grader/

# Setup the command that will be invoked when your docker image is run.
#ENTRYPOINT ["./grader/executeGrader.sh"]


# local testing
ENTRYPOINT ["./grader/executeGrader.sh", "partId", "HxbKF"]
