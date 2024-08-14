# About

A simple one-click deployment of a `promstack` and `logstack` for Docker Swarm cluster.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/e50d5b3f-ae57-4218-9019-26b6b07851ea">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/471fcf22-1211-4cdb-8e88-30fee6528b1d">
  <img src="https://github.com/user-attachments/assets/471fcf22-1211-4cdb-8e88-30fee6528b1d">
</picture>

## Pre-requisites
- Docker running Swarm mode
- A Docker Swarm cluster with at least 3 nodes
- Configure Docker daemon to expose metrics for Prometheus

## Getting Started

### Configure the Docker daemon to expose metrics for Prometheus

To configure the Docker daemon as a Prometheus target, you need to specify the metrics-address in the daemon.json configuration file. This daemon expects the file to be located at one of the following locations by default. If the file doesn't exist, create it.

* **Linux**: `/etc/docker/daemon.json`
* **Docker Desktop**: Open the Docker Desktop settings and select Docker Engine to edit the file.

Add the following configuration:

```json
{
  "metrics-addr": "0.0.0.0:9323"
}
```

Save the file, or in the case of Docker Desktop for Mac or Docker Desktop for Windows, save the configuration. Restart Docker.

The Docker Engine now exposes Prometheus-compatible metrics on port `9323` on all interfaces. For more information on configuring the Docker daemon, see the [Docker documentation](https://docs.docker.com/config/daemon/prometheus/).

### Deplyoment

You can deploy the stack by running the following command:
```sh
make deploy

# To fetch lastest changes from the repository, run the following command:
make pull
```

## Promstack

A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, cAdvisor, Node exporter and Blackbox prober exporter)

See https://github.com/swarmlibs/promstack for more information.

## Logstack

Like Promstack, but for logs. Includes (Grafana Loki and Promtail)

See https://github.com/swarmlibs/logstack for more information.

## License

Licensed under the MIT License. See [LICENSE](LICENSE) for more information.
