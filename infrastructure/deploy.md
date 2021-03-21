aws --region eu-west-2 cloudformation update-stack --stack-name cardboard-ddns-stack --template-url https://cardboard-cloudformation-templates.s3.amazonaws.com/route53-ddns.yml --capabilities CAPABILITY_IAM --parameters ParameterKey=route53ZoneName,ParameterValue=cardboard.cafe ParameterKey=enableCloudFront,ParameterValue=withCustomAlias ParameterKey=apiCname,ParameterValue=ddns ParameterKey=useApiKey,ParameterValue=true ParameterKey=acmCertificateARN,ParameterValue=arn:aws:acm:us-east-1:241115898733:certificate/e162c0b3-6a43-46b9-b53c-68000b033a52 ParameterKey=route53ZoneId,ParameterValue=Z3LV89Y6AG5IAO --capabilities CAPABILITY_NAMED_IAM --profile personal

aws acm request-certificate --region us-east-1 --domain-name '*.cardboard.cafe' --validation-method DNS --idempotency-token 1234 --options CertificateTransparencyLoggingPreference=DISABLED --profile personal

{
    "CertificateArn": "arn:aws:acm:us-east-1:241115898733:certificate/e162c0b3-6a43-46b9-b53c-68000b033a52"
}

s3://cardboard-cloudformation-templates