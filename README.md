# lucee-ecs-fargate-demo

```bash
# image building

docker build -t lucee-app .
# run locally to test everythings working
docker run -d -p8888:8888 -it lucee-app

# Push commands for lucee-app
 
$(aws ecr get-login --no-include-email --region us-east-1)
docker build -t lucee-app .
docker tag lucee-app:latest 048548734984.dkr.ecr.us-east-1.amazonaws.com/lucee-app:latest
docker push 048548734984.dkr.ecr.us-east-1.amazonaws.com/lucee-app:latest

#aws ecs create-cluster --cluster-name lucee-cluster --profile xxx
#aws ecs describe-cluster --clusters lucee-cluster --profile xxx
```

### Create a task
```
aws ecs register-task-definition --cli-input-json file://task-definition.json
```

### Create a service
```
aws ecs create-service \
    --cluster lucee-cluster \
    --service-name lucee-service-pro \
    --task-definition lucee-run-task-definition:1 \
    --desired-count 1 \
    --launch-type FARGATE \
    --platform-version LATEST \
    --network-configuration "awsvpcConfiguration={subnets=[subnet-xxxxxxxxxxxxxxxxx],assignPublicIp=ENABLED}"
```

```
aws ec2 describe-stale-security-groups --vpc-id vpc-xxxxxxxxxxxxxxxxx
aws ecs run-task --cluster lucee-cluster \
        --task-definition lucee-run-task-definition \
        --network-configuration "awsvpcConfiguration={subnets=[subnet-xxxxxxxxxxxxxxxxx]}"

```