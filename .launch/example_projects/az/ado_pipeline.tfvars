
repository = {
  repo_type             = "GitHub"
  repo_id               = "nexient-llc/demo-azure-resource-group"
  github_enterprise_url = "https://github.company.com"
  branch_name           = "main"
  yml_path              = "internals/pipelines/pipeline.yml"
  service_connection_id = "<SERVICE_CONNECTION_ID>"
}

schedules = {
  branch_filter = {
    include = ["main"]
  }
  days_to_build = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
}
