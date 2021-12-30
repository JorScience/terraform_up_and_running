provider "aws" {
    region = "us-east-2"
}

terraform {
    backend "s3" {
        bucket = "terraform-up-and-running-jorik"
        key = "stage/services/webserver-cluster/terraform.tfstate"
        region = "us-east-2"

        dynamodb_table = "terraform-up-and-running-locks"
        encrypt = true
    }
}

module "webcluster_server" {
    source = "github.com/JorScience/tf_ur_modules//services/webserver-cluster?ref=v0.1.0"

    cluster_name = "webservers-stage"
    db_remote_state_bucket = "terraform-up-and-running-jorik"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

    instance_type = "t2.micro"
    min_size = 2
    max_size = 4
}

resource "aws_security_group_rule" "allow_testing_inbound" {
    type = "ingress"
    security_group_id = module.webcluster_server.alb_security_group_id

    from_port = 12345
    to_port = 12345
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}