# AB-3 Demo Code

* Event: AWSome Builder 3
* Date: Nov, 2022

## Description
AB-3 presentation

## Pre-requisite
* Python (version 3.8 or higher)
```bash
python3 -V
```
    * :speech_balloon: v 3.9.6
* NodeJS (version 14 or higher)
```bash
node -v
```
    * :speech_balloon: v 18.10.0 
* Yarn (installed via npm install -g yarn)
```bash
yarn -v
```
    * :speech_balloon: v 1.22.19
* Typescript (installed via npm install -g typescript)
```bash
tsc -v
```
    * :speech_balloon: v 4.8.4
* AWS CDK v2 CLI (installed via npm install -g aws-cdk). Refer: https://docs.aws.amazon.com/cdk/v2/guide/cli.html
```bash
sudo npm install -g aws-cdk

cdk --version
```
    * :speech_balloon: v 3.47.0
* AWS CLI (version 2 or higher). Refer: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```bash
which aws
aws --version
```
    * :speech_balloon: v 2.7.33
* AWS CLI Configuration (configured via aws configure). Refer https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

## Source Code
```
ab3-demo
├── LICENSE
├── README.md
└── mlflow
    ├── Dockerfile
    ├── app.py
    └── requirements.txt
```

### Checkout
```bash
git clone https://github.com/krishnamanchikalapudi/ab3-demo.git
```

### Commit
```bash
git add .
git commit -m "Enter your message"
git push .
```


## Deploy
- AWS IAM cli user has privilege to execute CloudFormation scripts
- Configure AWS Access key and Secret with the command _**aws configure**_
```bash
AWS Access Key ID [None]: ?                
AWS Secret Access Key [None]: ?
Default region name [None]: ?
Default output format [None]: json 
```
- AWS information
```bash
ACCOUNT_ID=$(aws sts get-caller-identity --query Account | tr -d '"') && echo "AWS Account: $ACCOUNT_ID"
AWS_REGION=$(aws configure get region) && echo "AWS Region: $AWS_REGION"
```
### ML Flow
* [Follow this link to Install and Uninstall mlflow](mlflow/README.md) 




## References
- [Git on the command line](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html)
- [Git Cheat Sheet](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
- [Git emoji](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)