# Castblock
A small utility to skip integrated ads on youtube when played on chromecasts

## Usage
Install the prerequisites:
* [go-chromecast](https://github.com/vishen/go-chromecast)
* jq
* bc
* cmp

Run `castblock`. It should automatically detect all chromecasts on the LAN, keep track of what's playing, and automatically skip sponsors using the SponsorBlock API.

## Known Issues
- [ ] May not detect all chromecasts, does not rescan. If your chromecast is now shown, try re-running
- [ ] Start of skipping is based on polling and may miss the starting split second of a segment
- [ ] Segments shorter than 5 seconds are ignored - seeking on chromecast always causes buffering making skipping super short segments have questionable value
- [ ] Segments less than 10 seconds after a previous segment may play partially or fully due to the post skip timeout which prevents double skipping
- [ ] Script may not cleanly exit / may leave running threads/processes.

## Contributing
I welcome all suggestions / code for the above issues as well as other discussion on how to improve the script. Feel free to open an issue or PR with any contributions.
