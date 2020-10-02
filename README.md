# CastBlock

A small utility to skip integrated ads on youtube when played on chromecasts

## Installation

From the AUR:

```
aurman -S castblock-git
```

With Docker:

```
docker pull stephen304/castblock:latest
docker run --network="host" stephen304/castblock
```

From source:

- Install the prerequisites:
  - [go-chromecast](https://github.com/vishen/go-chromecast)
  - jq - `sudo apt-get install jq`
  - bc - `sudo apt-get install bc`
  - cmp
  - timeout
- Put `castblock` in `/usr/bin/`
- Put `castblock.service` in `/usr/lib/systemd/system/`

## Usage

Run `castblock` while on the same LAN as chromecast devices.

Alternatively, enable and start `castblock.service` to run in the background.
Ensure `castblock` exists in `/usr/bin/` and `castblock.service` exists in `/usr/lib/systemd/system/` as above, then run:

1. `sudo systemctl start castblock`
1. Check the service has started by running `sudo systemctl status castblock`
1. And finally, in order to run at boot, type `sudo systemctl enable castblock`

It should automatically detect all chromecasts on the LAN, keep track of what's playing, and automatically skip sponsors using the SponsorBlock API.

## Known Issues

- [ ] May not detect all chromecasts, does not rescan. If your chromecast is now shown, try re-running
  - If you have your chromecast off except when you need it use something like this:

```bash
killall -q castblock # kill all currently open castblock instances
while true; do
    castblock & # run castblock in the background
    sleep 300 # keep it running for 5 minutes
    killall -q castblock && sleep 1 # kill all castblock instances and wait a second before restarting
done
```

- [ ] Start of skipping is based on polling and may miss the starting split second of a segment
- [ ] Segments shorter than 5 seconds are ignored - seeking on chromecast always causes buffering making skipping super short segments have questionable value
- [ ] Segments less than 10 seconds after a previous segment may play partially or fully due to the post skip timeout which prevents double skipping
- [ ] Script may not cleanly exit / may leave running threads/processes. Fight me. Or make a pull request. Your choice.

## Contributing

I welcome all suggestions / code for the above issues as well as other discussion on how to improve the script. Feel free to open an issue or PR with any contributions.
