# terraform_git_actions
deploying AWS infra using terraform and CI using git action
In this project basic infrastructure like VPC,EC2, security group and load balancer is created using terraform on AWS platform.
Also CI (continious intigration) is done using git actions when the source code is pushed to main branch.

!->prerequisites for this project
  1.git installed on local machine.
  2.aws-cli.
  3.terraform.

!->create a repo on github and clone it to your local mahine.
  $git clone <repo-link>

!->setup the aws credentials on local machine for giving access to the aws account.
  Here create a user in IAM with Permissions policies(administratorAccess) and generate the access key and secret key.
  using $aws configure command pass this credentials to local machine.

!->create all the necessary infra in a folder eg.terraform in module format.
  seperate folders for VPC,security group, EC2 instance and load balancer in modules folder for calling in main.tf
  parallely you can check for the code corrections by applying this terraform commands.
  $terraforn init -- installs all the dependencies and plugins required.
  $terraform validate -- checks for the syntax error if any.
  $terraform plan --used to corss verify the resources that are been build.
  $terraform apply --deploys all the mentioned resources on AWS.

!->within the project folder make a .github and workflows folder whis is required for git actions.
  .github->workflows->deploy.yml
  starting two folders cretaion this necessery for the git actions to take place, then jobs can be written in yaml file.
!->in repo settings go to secrets->actions->new repo secrets.
  add the AWS_ACCESS_KEY and AWS_SECRET_ACCESS_KEY which is passed as variables to yaml file also important to authenticate git actions with AWS account.

!->push all the files to feature branch.
  $git checkout -b feature  (creates feature branch)
  $git add .
  $git commit -m 'message'
  $git push origin feature

!->on github PR is created for merging the feature contents to main branch.
  after successful merge without any conflicts check out the git actions a new action will the automatically been created and performs the jobs mentioned in the yaml file.
