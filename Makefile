TERRAFORM = docker run --rm -e AWS_PROFILE=${AWS_PROFILE} \
	-v /tmp:/tmp -v ${PWD}:/src/terraform \
	-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
	-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
	-e AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
	--workdir /src/terraform \
	klumhru/terraform

init:
	${TERRAFORM} init -backend-config=config/backend-config.tfvars

plan:
	${TERRAFORM} plan -out /tmp/terraform.plan

apply:
	${TERRAFORM} apply -auto-approve /tmp/terraform.plan
