# ML Flow

[BACK to HOME](../README.md)

## Source Code
```
mlflow
├── container
│   └── Dockerfile
├── app.py
├── cdk.json
└── requirements.txt
```

## ML Flow
### Install
* Python dependencies
```bash
cd mlflow
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
```
* Build the container and push to ECR and CloudFormation stack
```bash
ACCOUNT_ID=$(aws sts get-caller-identity --query Account | tr -d '"') && echo "AWS Account: $ACCOUNT_ID"
AWS_REGION=$(aws configure get region) && echo "AWS Region: $AWS_REGION"

cdk bootstrap aws://${ACCOUNT_ID}/${AWS_REGION}
cdk deploy --parameters ProjectName=ab3-mlflow --require-approval never
``` 
### Uninstall
* Delete AWS resources
```bash
cdk destroy --parameters ProjectName=ab3-mlflow --require-approval never
```
* Delete local python environment
```bash
deactivate
rm -rf .venv/
```

[BACK to HOME](../README.md)