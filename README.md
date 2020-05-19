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
| scripts/   | helper scripts; e.g database browser etc |
| templates/ | default templates to build import files from |

I'm publishing images to https://hub.docker.com/r/ectoplasm/recon-ng

### Run it

`make run`

Automate by running from a resource file. For example, install modules which don't need api keys:

`R=resources/modules-nokeys-nodeps make run`

To run a specific version of recon-ng (if a docker image exists of this version):

`TAG=5.1.1 make run`

#### Example Workflow

After using the templates to populate csvs placed in `resources/imports/` and installing modules:

```
R=resources/import make run
R=resources/recon-big make run
R=resources/export make run
```

csv output will be in `resources/reports`

I like to run a second sweep after checking the output, for this use `resources/recon-second`

### Local Build

To build the image you can run the following. 

```
git submodule update --init --recursive
make build
```

You can run from this local image with `make run-dev`
