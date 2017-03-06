1.  If you aren't going to use DNS remove the route53.tf file.  Otherwise
    update as appropriate.
2.  Create an IAM user with suffienct rights to create the resources. ( Admin is probably good as its only used by this script)
3. download and install aws cli
4. aws ```configure --profile "yourprofilename"```
5. update profile name in aws.tf from above.
6. create keypair in aws console and update name in docker.tf
7. download and install terraform
8. run ```terraform apply```
9. to destroy env run ```teraform destroy```
