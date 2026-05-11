set -exo pipefail

# TODO: options for which hardware to install for - laptop/desktop/etc
# or can I auto-determine?
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
sudo cp -a "${SCRIPT_DIR}/src/." /etc/nixos/
nixos-rebuild switch --sudo
