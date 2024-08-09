# About

A standard issued monitoring stack for Docker Swarm cluster.

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

Initialize, (only needed to be run once):
```sh
make
```

Update repository and submodules:
```sh
make sync
```

To deploy the stack, run:
```sh
make deploy
```

## Promstack

A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, cAdvisor, Node exporter and Blackbox prober exporter)

See https://github.com/swarmlibs/promstack for more information.

## Logstack

Like Promstack, but for logs. Includes (Grafana Loki and Promtail)

See https://github.com/swarmlibs/logstack for more information.

## License

Licensed under the MIT License. See [LICENSE](LICENSE) for more information.
