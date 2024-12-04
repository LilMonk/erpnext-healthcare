# Frappee ERPNext Healthcare

## Setup instructions

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

## Setup instructions with custom docker image

1. Build custom docker image
```bash
make build
```

2. Start docker containers
```bash
make up
```

3. Close docker containers
```bash
make down
```