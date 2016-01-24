alias instances="ec2-describe-instances"
essh() {
    id=$(echo $1 | grep -o 'i-[0-9a-f]\{8\}')
    shift
    ec2_ssh $id "$@"
}
ef() {
    search=$1; shift
    aws ec2 describe-instances --filters Name=tag:Name,Values=${search}* | jq 'def flatten(x): reduce .[] as $i ([]; if $i | type == "array" and x > 0 then . + ($i | flatten(x-1)) else . + [$i] end); .Reservations | map(.Instances) | map(map(.Tags, {"Key": "host", "Value": .PublicDnsName})) | map(flatten(1)) | map(map({(.Key): (.Value)})| add)'
}
ec2_ssh() {
    id=$1; shift
    host=$(aws ec2 describe-instances --instance-ids $id | jq -r '.Reservations[0].Instances[0].PublicDnsName')
    ssh $host "$@"
}
chef_ssh() {
    role=$1; shift
    host=$(knife search node role:$role -R 1 -Fj | jq -r '.rows[0].automatic.cloud.public_hostname')
    ssh $host "$@"
}
s() {
    id=$(echo $1 | grep -o 'i-[0-9a-f]\{8\}')
    if [ $? -eq 0 ]; then
        shift
        ec2_ssh $id "$@"
    else
        chef_ssh "$@"
    fi
}
