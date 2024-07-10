# ecs-terraform

### AWS Credential の設定
```
$ export AWS_ACCESS_KEY_ID="~"
$ export AWS_SECRET_ACCESS_KEY="="~"
```

### terraform.tfvarsの作成
```
$ cd ./
$ vi terraform.tfvars
```

terraform.tfvarsの設定項目
```
tag_name = "fast-api"
tag_group = "fast-api-group"
name_prefix ="fast-api"
region = "ap-northeast-1"
account_id = "[AWS account ID]"
sg_ingress_ip_cidr = "[Security Groupの IPv4 アドレス]"
webapp_port = [api serverのport番号]
```


### plan/applyの実行
```
$ terraform plan -var-file="terraform.tfvars"
$ terraform apply -var-file="terraform.tfvars"
```