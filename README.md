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

## Example

So if you wish to create a backup of the `/mnt/shares` folder you:

Create a new configuration:

```bash
docker run --rm -v /path/to/configs:/config chappio/rsnapshot
```

Update your configuration:
```bash
nano /path/to/configs/rsnapshot.conf
```

Run the backup:
```bash
docker run --rm -v /path/to/configs:/config -v /path/to/snapshots:/snapshots -v /mnt/shares:/mnt/shares:ro chappio/rsnapshot daily
```

## docker-compose

```yaml
services:
    rsnapshot:
        image: chappio/rsnapshot
        volumes:
          - ./config:/config
          - ./snapshots:/snapshots
          - /mnt:/mnt
```

And then execute:

```bash
docker-compose run rsnapshot daily
```
