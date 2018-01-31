. ../aws-environment.conf


aws batch deregister-job-definition --job-definition ${AWS_JOB_DEFINITION_NAME_1}:1
aws batch deregister-job-definition --job-definition ${AWS_JOB_DEFINITION_NAME_1}:2
