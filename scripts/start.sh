#!/usr/bin/env bash
#
# start.sh - start the Student Information System.
#
# Planned steps (implemented in Week 2):
#   1. create the private Docker network      (if missing)
#   2. create the named volume for PostgreSQL  (if missing)
#   3. start the PostgreSQL container          (if not running)
#   4. wait until PostgreSQL is ready (pg_isready)
#   5. build the C++ application image
#   6. run the application container on the same network
#
# The script must be idempotent: running it twice is safe.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
readonly SCRIPT_DIR PROJECT_ROOT

log()  { printf '[start] %s\n' "$*"; }
die()  { printf '[start] ERROR: %s\n' "$*" >&2; exit 1; }

on_error() {
    printf '[start] ERROR: command failed on line %s\n' "$1" >&2
}

cleanup() {
    local status=$?
    if [[ $status -ne 0 ]]; then
        log "start-up aborted (exit code $status)"
    fi
}

trap 'on_error $LINENO' ERR
trap cleanup EXIT

require_docker() {
    command -v docker >/dev/null 2>&1 || die "docker is not installed"
    docker info >/dev/null 2>&1 || die "docker daemon is not running"
}

create_network() { log "TODO: create network"; }
create_volume()  { log "TODO: create volume"; }
start_database() { log "TODO: start PostgreSQL container"; }
wait_for_db()    { log "TODO: wait for pg_isready"; }
build_image()    { log "TODO: build application image"; }
run_app()        { log "TODO: run application container"; }

main() {
    cd "$PROJECT_ROOT"
    require_docker
    create_network
    create_volume
    start_database
    wait_for_db
    build_image
    run_app
    log "done"
}

main "$@"
