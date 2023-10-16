resource "shoreline_notebook" "elasticsearch_cluster_health_showing_red" {
  name       = "elasticsearch_cluster_health_showing_red"
  data       = file("${path.module}/data/elasticsearch_cluster_health_showing_red.json")
  depends_on = [shoreline_action.invoke_elasticsearch_error_checker]
}

resource "shoreline_file" "elasticsearch_error_checker" {
  name             = "elasticsearch_error_checker"
  input_file       = "${path.module}/data/elasticsearch_error_checker.sh"
  md5              = filemd5("${path.module}/data/elasticsearch_error_checker.sh")
  description      = "Check the Elasticsearch cluster logs for any errors that could be causing the red health status. Once identified, fix the issue or escalate it to the appropriate team member."
  destination_path = "/tmp/elasticsearch_error_checker.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_elasticsearch_error_checker" {
  name        = "invoke_elasticsearch_error_checker"
  description = "Check the Elasticsearch cluster logs for any errors that could be causing the red health status. Once identified, fix the issue or escalate it to the appropriate team member."
  command     = "`chmod +x /tmp/elasticsearch_error_checker.sh && /tmp/elasticsearch_error_checker.sh`"
  params      = ["PATH_TO_ELASTICSEARCH_LOGS"]
  file_deps   = ["elasticsearch_error_checker"]
  enabled     = true
  depends_on  = [shoreline_file.elasticsearch_error_checker]
}

