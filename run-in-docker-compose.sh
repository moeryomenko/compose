#!/usr/bin/env bash
set -euo pipefail

RUN="${1:-}"

# wait while postgres and migrations done.
sleep 5

# Run integration tests, example:
#	set +e
#	go test -tags "integration postgres" ./internal/postgres/... -v -p 1 -count 1 -run $(or $(RUN),TestIntegration)
#	result=$?
#	set -e

docker-compose -f docker-compose.yml --project-directory . down

if [[ ${result} -eq 0 ]]; then
    echo -e "\n\e[32mTests passed!\e[0m\n"
    exit 0
else
    echo -e "\n\e[31mTests failed!\e[0m\n"
    exit 1
fi
