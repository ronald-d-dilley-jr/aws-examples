. ../aws-environment.conf

mkdir -p ${AWS_CONFIGURED_DIR}

cat ${AWS_TEMPLATE_DIR}/create-job-queue-template.json | \
sed -e "s/<AWS_COMPUTE_ENVIRONMENT_NAME>/${AWS_COMPUTE_ENVIRONMENT_NAME}/" \
    -e "s/<AWS_JOB_QUEUE_NAME>/${AWS_JOB_QUEUE_NAME_1}/" \
    -e "s/<AWS_JOB_QUEUE_PRIORITY>/${AWS_JOB_QUEUE_PRIORITY_1}/" \
    > ${AWS_CONFIGURED_DIR}/create-job-queue-1.json


aws batch create-job-queue \
    --cli-input-json file://${AWS_CONFIGURED_DIR}/create-job-queue-1.json
