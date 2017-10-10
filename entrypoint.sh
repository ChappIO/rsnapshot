#!/bin/bash

# Copy the configuration if it does not exist
if [ ! -f "$RSNAPSHOT_CONF" ]; then
    echo "This seems to be the first run. Creating a configuration file at $RSNAPSHOT_CONF."
    cp rsnapshot.conf.default "$RSNAPSHOT_CONF"
else
    # Run rsnapshot
    rsnapshot -c "$RSNAPSHOT_CONF" "$@"
fi
