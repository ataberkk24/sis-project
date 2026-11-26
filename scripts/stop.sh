#!/usr/bin/env bash
#
# stop.sh - stop the Student Information System.
#
# Planned steps (implemented in Week 2):
#   1. stop and remove the application container (if present)
#   2. stop and remove the PostgreSQL container  (if present)
#   3. remove the private Docker network          (if present)
#
# Data in the named volume is kept; use reset.sh to delete it.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
readonly SCRIPT_DIR PROJECT_ROOT

log()  { printf '[stop] %s\n' "$*"; }
die()  { printf '[stop] ERROR: %s\n' "$*" >&2; exit 1; }

on_error() {
    printf '[stop] ERROR: command failed on line %s\n' "$1" >&2
}

trap 'on_error $LINENO' ERR

require_docker() {
    command -v docker >/dev/null 2>&1 || die "docker is not installed"
    docker info >/dev/null 2>&1 || die "docker daemon is not running"
}

remove_app_container() { log "TODO: remove application container"; }
remove_db_container()  { log "TODO: remove PostgreSQL container"; }
remove_network()       { log "TODO: remove network"; }

main() {
    cd "$PROJECT_ROOT"
    require_docker
    remove_app_container
    remove_db_container
    remove_network
    log "done"
}

main "$@"
