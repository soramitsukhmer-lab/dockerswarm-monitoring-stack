# About

WIP

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/e50d5b3f-ae57-4218-9019-26b6b07851ea">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/471fcf22-1211-4cdb-8e88-30fee6528b1d">
  <img src="https://github.com/user-attachments/assets/471fcf22-1211-4cdb-8e88-30fee6528b1d">
</picture>

## Pre-requisites
- Docker running Swarm mode
- A Docker Swarm cluster with at least 3 nodes
- Configure Docker daemon to expose metrics for Prometheus

## Usage

Initialize, (only needed to be run once):
```sh
make
```

Update repository and submodules:
```sh
make sync
```

### Deploy stack

To deploy the stack, run:
```sh
make deploy
```

### Remove stack

To remove the stack, run:
```sh
make remove
```

---

WIP
