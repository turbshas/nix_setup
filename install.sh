set -exo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
sudo cp -a "${SCRIPT_DIR}/src/." /etc/nixos/
nixos-rebuild switch --use-remote-sudo
