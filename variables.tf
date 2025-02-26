variable "name" {
  description = "Name of the ALB and target groups"
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection for the ALB"
  type        = bool
  default     = true
}

variable "ssl_policy" {
  description = "SSL Policy for HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
  type        = string
}

variable "target_port" {
  description = "Port on which targets receive traffic"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
  default     = "/health"
}

variable "health_check_threshold" {
  description = "Number of consecutive health checks successes/failures required"
  type        = number
  default     = 2
}

variable "health_check_interval" {
  description = "Interval between health checks (seconds)"
  type        = number
  default     = 30
}

variable "health_check_matcher" {
  description = "Response codes to use when checking for a healthy response"
  type        = string
  default     = "200"
}

variable "health_check_timeout" {
  description = "Health check timeout (seconds)"
  type        = number
  default     = 5
}

variable "stickiness_enabled" {
  description = "Whether to enable stickiness"
  type        = bool
  default     = true
}

variable "stickiness_duration" {
  description = "Cookie duration in seconds for stickiness"
  type        = number
  default     = 86400
}

variable "access_logs" {
  description = "Access logs configuration for the ALB"
  type = object({
    bucket  = string
    prefix  = string
    enabled = bool
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}