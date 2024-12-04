# Frappee ERPNext Healthcare

This repository contains the docker setup for frappee erpnext healthcare.

## Setup instructions with custom docker image

1. Add apps in apps.json file. Make changes to `.env` files if needed. Change the `FRAPPE_SITE_NAME_HEADER` in the `.env` file with your site name.

2. Build custom docker image
```bash
make build
```

3. Start docker containers
```bash
make up
```

4. Close docker containers
```bash
make down
```

## Setup instructions
This is to be done with vanilla frappee erpnext image. But with the given docker setup,
we don't need this. This part is just for reference.

1. Start docker containers
```bash
cd frappee_docker
docker compose -f pwd.yml up -d
```

2. Get inside backend container
```bash
docker exec -it backend bash
```

3. Install healtcare model
```bash
bench get-app healthcare --branch version-15
bench --site <site1.local> install-app healthcare
bench migrate
```
Do this for all the containers that uses frappee erpnext healthcare image.

