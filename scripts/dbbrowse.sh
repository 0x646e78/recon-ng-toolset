#!/usr/bin/env bash

workspace=$1

sqlitebrowser ${HOME}/.recon-ng/workspaces/${workspace}/data.db
#sqlite3 ${HOME}/.recon-ng/workspaces/${workspace}/data.db
