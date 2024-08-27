INSTANCE_ID_PORTEIRO="i-007bfb562d21b0c0b"
PROFILE=tf-bia-lab
IP_PORTEIRO=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID_PORTEIRO --query "Reservations[].Instances[].PublicIpAddress" --profile $PROFILE --region us-east-1 --output json | grep -vE '\[|\]' | awk -F'"' '{ print $2 }')
echo $IP_PORTEIRO

SERVIDOR_RDS1=aurora-rpit-postgres-bia-cluster.cluster-c92gks262jgj.us-east-1.rds.amazonaws.com
PORTA_LOCAL1=5436
PORTA_REMOTA1=5432

# SERVIDOR_RDS_2=(endpoint do banco2)
# PORTA_LOCAL_RDS_2=(porta de acesso do banco)

aws ssm start-session --target $INSTANCE_ID_PORTEIRO --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters '{"host":["'$SERVIDOR_RDS1'"],"portNumber":["'$PORTA_REMOTA1'"],"localPortNumber":["'$PORTA_LOCAL1'"]}' --profile $PROFILE

echo "Porteiro Liberou acesso para:"
echo "> $SERVIDOR_RDS1 no endereço *172.0.0.1:$PORTA_LOCAL"
