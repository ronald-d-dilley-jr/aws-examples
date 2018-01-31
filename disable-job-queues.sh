. ../aws-environment.conf


aws batch update-job-queue \
    --job-queue ${AWS_JOB_QUEUE_NAME_1} \
    --state DISABLED


sleep 10
