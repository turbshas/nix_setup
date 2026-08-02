set -exo pipefail

# TODO: options for which hardware to install for - laptop/desktop/etc
# or can I auto-determine?

# TODO: can use specializations to switch between pc configs?
# TODO: instead of copying the entire directory, can symlink the flake.nix into /etc/nixos/
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
sudo cp -a "${SCRIPT_DIR}/src/" /etc/nixos/
sudo cp "${SCRIPT_DIR}/flake.nix" /etc/nixos/
nixos-rebuild switch --sudo
