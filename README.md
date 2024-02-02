# NixOS Configuration

## Setup

1. `git clone`

2. `nix shell git+https://git.privatevoid.net/max/nix-super#nix`; This is a superset of the Nix-language which adds functionality that the configuration relies on. See more at [GitLab](https://git.privatevoid.net/max/nix-super)

3. Run `nix system active ./#default` replacing `./` with the path to the repository.
