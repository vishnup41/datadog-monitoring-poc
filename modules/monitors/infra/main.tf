resource "datadog_monitor" "cpu_usage" {
  name = "CPU Usage Monitor"
  type = "metric alert"
  query = "avg(last_5m):avg:system.cpu.idle{*} < 20"
  message = "Alert: CPU usage is above 80%"
  tags = ["env:production"]
}

resource "datadog_monitor" "memory_usage" {
  name = "Memory Usage Monitor"
  type = "metric alert"
  query = "avg(last_5m):avg:system.mem.used{*} / avg(last_5m):avg:system.mem.total{*} > 0.8"
  message = "Alert: Memory usage is above 80%"
  tags = ["env:production"]
}

resource "datadog_monitor" "disk_usage" {
  name = "Disk Usage Monitor"
  type = "metric alert"
  query = "avg(last_5m):avg:system.disk.in_use{*} > 0.9"
  message = "Alert: Disk usage is above 90%"
  tags = ["env:production"]
}

resource "datadog_monitor" "network_usage" {
  name = "Network Usage Monitor"
  type = "metric alert"
  query = "avg(last_5m):avg:system.net.bytes_rcvd{*} > 1000000"
  message = "Alert: Network usage is above threshold"
  tags = ["env:production"]
}