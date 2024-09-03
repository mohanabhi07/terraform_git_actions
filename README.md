# terraform_git_actions
deploying AWS infra using terraform and CI using git action<br>
In this project basic infrastructure like VPC,EC2, security group and load balancer is created using terraform on AWS platform.<br>
Also CI (continious intigration) is done using git actions when the source code is pushed to main branch.<br>

!->prerequisites for this project<br>
  1.git installed on local machine.<br>
  2.aws-cli.<br>
  3.terraform.<br>

!->create a repo on github and clone it to your local mahine.<br>
  $git clone <repo-link><br>

!->setup the aws credentials on local machine for giving access to the aws account.<br>
  Here create a user in IAM with Permissions policies(administratorAccess) and generate the access key and secret key.<br>
  using $aws configure command pass this credentials to local machine.<br>

!->create all the necessary infra in a folder eg.terraform in module format.<br>
  seperate folders for VPC,security group, EC2 instance and load balancer in modules folder for calling in main.tf<br>
  parallely you can check for the code corrections by applying this terraform commands.<br>
  $terraforn init -- installs all the dependencies and plugins required.<br>
  $terraform validate -- checks for the syntax error if any.<br>
  $terraform plan --used to corss verify the resources that are been build.<br>
  $terraform apply --deploys all the mentioned resources on AWS.<br>

!->within the project folder make a .github and workflows folder whis is required for git actions.<br>
  .github->workflows->deploy.yml<br>
  starting two folders cretaion this necessery for the git actions to take place, then jobs can be written in yaml file.<br>
!->in repo settings go to secrets->actions->new repo secrets.<br>
  add the AWS_ACCESS_KEY and AWS_SECRET_ACCESS_KEY which is passed as variables to yaml file also important to authenticate git actions with AWS account.<br>

!->push all the files to feature branch.<br>
  $git checkout -b feature  (creates feature branch)<br>
  $git add .<br>
  $git commit -m 'message'<br>
  $git push origin feature<br>

!->on github PR is created for merging the feature contents to main branch.<br>
  after successful merge without any conflicts check out the git actions a new action will the automatically been created and performs the jobs mentioned in the yaml file.<br>
