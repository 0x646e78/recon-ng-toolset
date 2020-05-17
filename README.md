# recon-ng Toolset

Overview
---

I've been playing with [recon-ng](https://github.com/lanmaster53/recon-ng/) and found some things useful which I've added here.

The repo contains the following:

| path       | Explanation |
|---         |---|
| docker/    | Files for building our flavour of recon-ng |
| Makefile   | entrance point to interacting with this toolset |
| resources/ | example resource scripts for automated workloads |
| templates/ | default templates to build import files from |

I'm publishing images to https://hub.docker.com/r/ectoplasm/recon-ng

### Run it

`make run`

Automate by running from a resource file. For example, install some modules:

`R=resources/module-install make run`

Install all modules which don't require an API key:

`R=resources/modules-nokeys-nodeps make run`

To run a specific version (if a docker image exists of this version):

`TAG=5.1.1 make run`

#### Example Workflow

After using the templates to populate csvs in `resources/imports/` and installing modules:

```
R=resources/import-all make run
R=resources/recon-big make run
R=resources/recon-big make run
R=resources/export make run
```

### Local Build

To build the image you can run the following. 

```
git submodule update --init --recursive
make build
```

You can run from this local image with `make run-dev`

