# Student Information System (SIS) on Docker

A C++ command-line Student Information System that stores student records in
PostgreSQL. The system runs as two Docker containers (PostgreSQL + the C++
application) on a private Docker network and is orchestrated with Bash scripts
(no Docker Compose).

> System Programming term project (individual).

## Status

Work in progress. See the [Projects board](../../projects), [Issues](../../issues)
and the [Wiki](../../wiki) for planning and weekly progress notes.

## Planned features

- Add, list, update and delete students (ID, name, surname, department, email)
- PostgreSQL access through libpqxx with transactions (commit/rollback)
- Input validation, error handling and logging
- Unit and integration tests, GitHub Actions CI
- Bash orchestration: `start.sh`, `stop.sh`, `reset.sh`, `status.sh`, `push.sh`

## Docker Hub

Application image: `ataberk24/sis-project-app` (link will be added once the first image is pushed).

## License

[MIT](LICENSE)
