. ../aws-environment.conf

mkdir -p ${AWS_CONFIGURED_DIR}

cat ${AWS_TEMPLATE_DIR}/submit-job-template.json | \
sed -e "s/<AWS_JOB_QUEUE_NAME>/${AWS_JOB_QUEUE_NAME_1}/" \
    -e "s/<AWS_JOB_DEFINITION_NAME>/${AWS_JOB_DEFINITION_NAME_1}/" \
    > ${AWS_CONFIGURED_DIR}/submit-job-1.json


aws batch submit-job \
    --cli-input-json file://${AWS_CONFIGURED_DIR}/submit-job-1.json
