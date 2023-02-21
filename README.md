# encointer-parachain-docker
Docker image / compose for encointer-parachain

This docker setup will run
- encointer-boot
- encointer-rpc

The `docker compose build` process will fetch the latest release from `https://github.com/encointer/encointer-parachain/releases/download/${RELEASE}/encointer-collator`

# Requirements

You need a separate relay chain 

# Usage

```bash
git clone https://github.com/metaspan/encointer-parachain-docker
cd encointer-parachain-docker
```

~Edit `Dockerfile` # not needed~

Edit `docker-compose.yml`
- update ports as needed
- update relay chain url

```bash
docker compose build
docker compose up
```

# TODO
- update ARG in Dockerfile to allow specification of RELEASE

# Refs

- https://github.com/encointer/encointer-parachain
