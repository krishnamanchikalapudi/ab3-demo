#!/bin/bash
arg=${1}

projectname=ab3-mlflow

clean(){
    echo "Building Python venv..."
    deactivate
    rm -rf .venv/ cdk.out/
}
deploy(){
    clean

    echo "Building Python venv..."
    python3 -m venv .venv
    source .venv/bin/activate
    pip3 install -r requirements.txt

    echo "AWS Bootstrapping..."
    cdk bootstrap aws://${ACCOUNT_ID}/${AWS_REGION}

    echo "Deploying resources to AWS..."
    cdk deploy --parameters ProjectName=${projectname} --require-approval never
}
destroy(){
    cdk destroy --parameters ProjectName=${projectname} --require-approval never

    clean
}

# -n string - True if the string length is non-zero.
if [[ -n $arg ]] ; then
    arg_len=${#arg} 
    # uppercase the argument
    arg=$(echo ${arg} | tr [a-z] [A-Z] | xargs)

    echo "Action: ${arg} and length is NOT ZERO: ${arg_len}"
    echo "Python version: {`python3 -V`}"
    echo "PIP version: {`pip3 -V`}"
    echo "AWS CLI version: {`aws --version`}"
    echo "AWS CDK version: {`cdk --version`}"

    ACCOUNT_ID=$(aws sts get-caller-identity --query Account | tr -d '"') && echo "    AWS Account: $ACCOUNT_ID"
    AWS_REGION=$(aws configure get region) && echo "    AWS Region: $AWS_REGION"

    if  [[ "DEPLOY" == "${arg}" ]] || [[ "INSTALL" == "${arg}" ]] ; then  # deploy to AWS
        deploy
    elif  [[ "DESTROY" == "${arg}" ]] || [[ "UNINSTALL" == "${arg}" ]] || [[ "UN-INSTALL" == "${arg}" ]] ; then  # uninstall
        destroy
else
        echo "Action NOT CONFIGURED"
    fi
else 
    echo "Action argument length is ZERO"
fi