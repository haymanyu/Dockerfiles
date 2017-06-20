#!/usr/bin/env bash

log() { echo "$0: $@" >&2; }

declare -a bw_opts

POSTGRES_CONNECTION_STRING="host=localhost port=5432 dbname=postgres user=bottledwater"
KAFKA_BROKER="localhost:9092"
bw_opts+=(--postgres="$POSTGRES_CONNECTION_STRING" --broker="$KAFKA_BROKER" --topic-prefix="postgres" --schema-registry="http://localhost:8081")

for var in "${!BOTTLED_WATER_@}"; do
  option=$(sed 's/^BOTTLED_WATER_//' <<<"$var" | tr '[:upper:]_' '[:lower:]-')
  value=${!var}
  case $(tr '[:upper:]' '[:lower:]' <<<"$value") in
    "")
      # Probably set by docker-compose env passthrough, ignore
      ;;
    true | yes | y | 1)
      # boolean options don't admit arguments
      log "Setting option --$option"
      bw_opts+=(--"$option")
      ;;
    false | no | n | 0)
      log "WARNING: Ignoring environment variable $var=$value, no support for explicitly negating option --$option"
      ;;
    *)
      log "Setting option --$option=$value"
      bw_opts+=(--"$option"="$value")
      ;;
  esac
done

BOTTLEDWATER=/usr/local/bin/bottledwater
VALGRIND=/usr/bin/valgrind

if [[ -n $VALGRIND_ENABLED ]]; then
  log "Running: $VALGRIND $VALGRIND_OPTS $BOTTLEDWATER ${bw_opts[@]} $@"
  exec "$VALGRIND" $VALGRIND_OPTS "$BOTTLEDWATER" "${bw_opts[@]}" "$@"
else
  log "Running: $BOTTLEDWATER ${bw_opts[@]} $@"
  exec "$BOTTLEDWATER" "${bw_opts[@]}" "$@"
fi
