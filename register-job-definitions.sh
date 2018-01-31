. ../aws-environment.conf

mkdir -p ${AWS_CONFIGURED_DIR}

cat ${AWS_TEMPLATE_DIR}/register-job-definition-template.json | \
sed -e "s/<AWS_JOB_DEFINITION_NAME>/${AWS_JOB_DEFINITION_NAME_1}/" \
    -e "s/<AWS_BASE_REGISTRY_URI>/${AWS_BASE_REGISTRY_URI}/" \
    -e "s/<AWS_PGS_REPOSITORY_NAME>/${AWS_PGS_REPOSITORY_NAME}/" \
    -e "s/<AWS_PGS_REPOSITORY_VERSION>/${AWS_PGS_REPOSITORY_VERSION}/" \
    > ${AWS_CONFIGURED_DIR}/register-job-definition-1.json


aws batch register-job-definition \
    --cli-input-json file://${AWS_CONFIGURED_DIR}/register-job-definition-1.json
