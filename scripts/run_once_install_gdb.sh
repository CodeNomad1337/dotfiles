#!/bin/bash
set -e

# Install GDB if not present
if ! command -v gdb &>/dev/null; then
  if command -v apt &>/dev/null; then
    sudo apt-get install --yes gdb
  elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm gdb
  fi
fi

mkdir -p ~/.gdb

git clone https://github.com/pwndbg/pwndbg ~/.gdb/pwndbg
cd ~/.gdb/pwndbg
./setup.sh

git clone https://github.com/longld/peda.git ~/.gdb/peda

wget -q -O ~/.gdb/gef.py https://raw.githubusercontent.com/hugsy/gef/refs/heads/main/gef.py

echo -e '#!/bin/bash\nexec gdb -q -ex init-peda "$@"' | sudo tee /usr/bin/gdb-peda
sudo chmod +x /usr/bin/gdb-peda

echo -e '#!/bin/bash\nexec gdb -q -ex init-pwndbg "$@"' | sudo tee /usr/bin/gdb-pwndbg
sudo chmod +x /usr/bin/gdb-pwndbg

echo -e '#!/bin/bash\nexec gdb -q -ex init-gef "$@"' | sudo tee /usr/bin/gdb-gef
sudo chmod +x /usr/bin/gdb-gef

