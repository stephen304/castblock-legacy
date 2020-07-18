# Castblock
A small utility to skip integrated ads on youtube when played on chromecasts

## Usage
Install the prerequisites:
* go-chromecast
* jq
* bc

Run `castblock`. It should automatically detect all chromecasts on the LAN, keep track of what's playing, and automatically skip sponsors using the SponsorBlock API.

## Known Issues
- [ ] Script must be started after chromecast is playing something - this is an issue with go-chromecast
- [ ] May not detect all chromecasts, does not rescan. If your chromecast is now shown, try re-running
- [ ] Skipping is rough, only skips integer seconds currently
