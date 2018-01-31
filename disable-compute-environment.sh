. ../aws-environment.conf


aws batch update-compute-environment \
    --compute-environment ${AWS_COMPUTE_ENVIRONMENT_NAME} \
    --state DISABLED


sleep 10
