# recon-ng Toolset

Overview
---

I've been playing with [recon-ng](https://github.com/lanmaster53/recon-ng/) and found some things useful which I've added here.

The repo contains the following:

| path       | Explanation |
|---         |---|
| Makefile   | entrance point to interacting with this toolset |
| docker/    | Files for building our flavour of recon-ng |
| templates/ | default templates to build import files from |
| resources/ | example resource scripts for automated workloads |

I'm publishing images to https://hub.docker.com/r/ectoplasm/recon-ng

### Run it

`make run`

Automate by running from a resource file:

`R=resources/module-install make run`

To run a specific version (if a docker image exists of this version):

`TAG=5.1.1 make run`

### Local Build

To make the image yourself you can run the following - and will need to update your make run command to run this.

`make build`
