# About

WIP

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/01b31235-f1c7-4b8f-9292-464691b222ff">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/user-attachments/assets/61f7f8f8-9b7b-4d06-b131-7937f73170ba">
  <img src="https://github.com/user-attachments/assets/61f7f8f8-9b7b-4d06-b131-7937f73170ba">
</picture>

## Pre-requisites
- Docker running Swarm mode
- A Docker Swarm cluster with at least 3 nodes
- Configure Docker daemon to expose metrics for Prometheus

## Usage

Recursivly sync the modules with remote repository, run:

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
