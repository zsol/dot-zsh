test_and_export() {
    [ -e $2 ] && export $1=$2
}

test_and_export JAVA_HOME "$(/usr/libexec/java_home)"
test_and_export AWS_IAM_HOME "/usr/local/Library/LinkedKegs/aws-iam-tools/jars"
test_and_export EC2_HOME "/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
test_and_export EC2_AMITOOL_HOME "/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
test_and_export AWS_ELB_HOME "/usr/local/Library/LinkedKegs/elb-tools/jars"
test_and_export AWS_AUTO_SCALING_HOME "/usr/local/Library/LinkedKegs/auto-scaling/jars"
test_and_export AWS_CREDENTIAL_FILE "$HOME/.ec2/credentials-zsol"
test_and_export EC2_PRIVATE_KEY "$HOME/.ec2/pk-zsol.pem"
test_and_export EC2_CERT "$HOME/.ec2/cert-zsol.pem"
test_and_export AWS_CLOUDWATCH_HOME "/usr/local/Library/LinkedKegs/cloud-watch/jars"
test_and_export SERVICE_HOME "$AWS_CLOUDWATCH_HOME"
