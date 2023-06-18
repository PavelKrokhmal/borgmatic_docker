### Borgmatic docker client

The Borgmatic is simple, configuration-driven backup software for servers and workstations based on Borgbackup (a deduplicating backup program, supports compression and authenticated encryption).

Borgbackup: https://borgbackup.readthedocs.io/en/stable/index.html
Borgmatic: https://torsion.org/borgmatic/

This docker image is dedicated to extracting backups from remote server without dependency pollution of local machine.

## Requirements

1. Docker + Doceker-compose
2. SHH private key to access a remove backup server (should be placed in ./.ssh directory)
3. Borgmatic compatible config/configs (should be placed in ./borgmatic-configs)

## Installation

1. Run: `docker-compose build`
2. Run: `docker-compose up -d`
3. Check active containers: `docker ps`
4. Connect to the container: `docker exec -it borgmatic-client bash`

## Borgmatic commands

1. Validate available configs: `validate-borgmatic-config`
2. Get backups list: `borgmatic list`
3. Extract latest backup: `borgmatic extract --archive latest --destination /home/root/borgmatic-backups` 