output "alb_dns_name" {
    value = module.webcluster_server.alb_dns_name
    description = "The domain name of the load balancer"
}