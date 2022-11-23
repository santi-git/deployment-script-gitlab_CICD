Application Deployment

In order to deploy services into EKS, we would use GitLabCI with Helm chart.
├── Chart.yaml
├── readme.md
├── templates
│   ├── 01-config-map.yaml
│   ├── 01-secret.yaml
│   ├── 03-deployment.yaml
│   ├── 04-service.yaml
│   ├── 05-hpa.yaml
│   ├── 06-ingress.yaml
│   ├── _config.tpl
│   ├── _labels.tpl
│   └── _replica.tpl
├── values
│   ├── prod.yaml
│   └── sit.yaml
└── values.yaml
01-config-map.yaml
We would save environment variables inside there.
01-secret.yaml
We would store dockerconfigjson there as to docker pull from GitLab registry. I believe the rest files are basic configuration of Helm repo that I would not mention here.
values
Files inside values folder is for environment mapping. We can configure and apply based on application requirements inside there.

How to deploy
There are 5 stages to deploy services into EKS.

deploy-nginx
This is one time deployment for nginx ingress controller into EKS then it is manual deployment. If it's required to upgrade nginx ingress controller version once we upgraded EKS version, we can run it occasionally.

build-artifact
This is to build docker image and push it to GitLab registry. As we're using GitLab, we would like to use GitLab registry for now however we can use AWS ECR as well. It will be triggered automatically whenever codes have been push to GitLab.

fetch-artifact
This is to fetch dockerconfigjson from AWS Secret Manager. Due to security concern, we will download it from AWS Secret Manager and apply into secretmaps in our pipeline. It will be triggered automatically whenever codes have been push to GitLab.

deploy
This is to deploy services into EKS, everytime codes have been push into GitLab it will be triggered automatically however it's manul step to deploy it.

rollback
This is to rollback to previous version. it's manul step to rollback it.