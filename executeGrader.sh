#! /bin/bash

# Switch to the grader directory
cd /grader

# Unique Part Ids for each assignment part that will be graded using this grader.
# These are exposed in Coursera's authoring tools for each programming assignment part.
PYTHON_ON_RPI_PART_ID="HxbKF"
NODE_JS_ON_BLUEMIX_PART_ID="ov8KA"

# Parse the command line arguments supplied by Coursera.
while [[ $# > 1 ]]
  do
    key="$1"
    case $key in
      partId)
        # Unique Id associated with the part which is being graded.
        PARTID="$2"
        shift
        ;;
      userId)
        # Unique integer Id of the learner that made this submission.
        USERID="$2"
        shift
        ;;
      filename)
        # Original filename as uploaded by the learner before it was renamed to the suggested filename.
        ORIGINAL_FILENAME="$2"
        shift
        ;;
    esac
  shift
done

# Use the parsed partId to know which part is being graded in the current run.
if [ "$PARTID" == "$PYTHON_ON_RPI_PART_ID" ]; then
	bash ./pythonOnRpiGrader/executeGrader.sh
elif [ "$PARTID" == "$NODE_JS_ON_BLUEMIX_PART_ID" ]; then
	bash ./node.jsGrader/executeGrader.sh
else
  # Exiting with status 1. Coursera will expose these errors to instructors via a dashboard.
  # Learner will be prompted to try again after some time and the grader is under maintenance.
  echo "No PartId matched!" 1>&2
  exit 1
fi


# Note: Nothing except Json object containing 'fractionalScore' and 'feedback' should be written
# to stdout.


