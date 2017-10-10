# rsnapshot in docker
Just... rsnapshot

## Usage

```bash
docker run \
    --rm \
    -v <path to config>:/config
    -v <path to snapshots>:/snapshots
    chappio/rsnapshot
    daily
```

## Parameters

- `--rm` - delete the container after execution
- `-v /config` - mount the volume which contains the rsnapshot configurations
- `-v /snapshots` - mount the volume which contains the snapshots
- `daily` - pass arguments to rsnapshot
