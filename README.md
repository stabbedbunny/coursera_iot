TESTER

# to build the docker image execute the followingn command in this directory

docker build -t ibm_grader.v1.1 .

#This path has to be changed to your local environment:

export BASE_PATH=/Users/romeokienzler/Documents/tmp/coursera_iot/

#so far we don't have a nested and complex folder structure therefore we start at the root

export CustomGraderPath=$BASE_PATH

# now we can test the grader

courseraprogramming grade local ibm_grader.v1.1 $CustomGraderPath/pythonOnRpiGrader

(to install the courseraprogramming command line tool execute the following command:
sudo pip install courseraprogramming
