. ../aws-environment.conf

mkdir -p ${AWS_CONFIGURED_DIR}

cat ${AWS_TEMPLATE_DIR}/create-compute-environment-template.json | \
sed -e "s/<AWS_COMPUTE_ENVIRONMENT_NAME>/${AWS_COMPUTE_ENVIRONMENT_NAME}/" \
    -e "s/<AWS_COMPUTE_RESOURCES_MIN_VCPUS>/${AWS_COMPUTE_RESOURCES_MIN_VCPUS}/" \
    -e "s/<AWS_COMPUTE_RESOURCES_MAX_VCPUS>/${AWS_COMPUTE_RESOURCES_MAX_VCPUS}/" \
    -e "s/<AWS_COMPUTE_RESOURCES_DESIRED_VCPUS>/${AWS_COMPUTE_RESOURCES_DESIRED_VCPUS}/" \
    -e "s/<AWS_SUBNETS>/${AWS_SUBNETS}/" \
    -e "s/<AWS_SECURITY_GROUPS>/${AWS_SECURITY_GROUPS}/" \
    -e "s/<AWS_KEY_PAIR>/${AWS_KEY_PAIR}/" \
    -e "s/<AWS_INSTANCE_ROLE>/${AWS_INSTANCE_ROLE}/" \
    -e "s/<AWS_SERVICE_ROLE>/${AWS_SERVICE_ROLE}/" \
    > ${AWS_CONFIGURED_DIR}/create-compute-environment.json


aws batch create-compute-environment \
    --cli-input-json file://${AWS_CONFIGURED_DIR}/create-compute-environment.json
