# Printfarm

Various scripts and configuration for the Chattlab printer farm.

# Architecture

Klipper works by splitting out most of the work to a computer running Linux, while keeping the timing critical operations on the printer's micro-controller. 

The planned setup will run Klipper and Moonraker (an API that exposes Klipper) on converted ASUS Chromeboxes. A web interface (Fluidd or Mainsail) will live somewhere else with the DNS name printers.local that handles starting jobs/controlling printers/etc.

# Installing Debian on a Klipper computer

1. Download this repo via the green **Code** button (upper right) and then **Download ZIP** and extract.
1. Grab the current Debian Bookworm iso for AMD64 here: https://www.debian.org/download 
1. Start a webserver on your machine from the root of the extracted zip like this: `python3 -m http.server`
1. Make note of the port it auto-selected (will usually be 8000) and your device's IP address. 
1. Create a bootable USB drive from the Debian ISO with [RUFUS](https://rufus.ie/en/) or [Balena Etcher](https://github.com/balena-io/etcher).
1. Boot from the USB drive. (The Chromeboxen have a nice boot menu accessable by hitting esc during POST.)
1. The Debian installer menu should appear. Select **Advanced Options -> Automated Install**.
1. After a bit of preamble, you might get prompted to select the primary network device. Pick the ethernet option. (Should be the top one.)
1. When prompted for the preconfiguration file, enter your IP followed by the port, like this (replacing the example IP with yours): `192.168.1.1:8000` and hit enter.
1. After a few minutes of installation, the machine will automatically reboot and its IP will show on the screen. You are ready to move to the next step!

# Using Ansible to install/update/maintain the Chromeboxen fleet

## As a pre-requisite, you'll need to install Ansible. 

- Windows: You will need to use WSL, which is a bit annoying, and then you can follow the Linux path.
- Linux: Your distro almost certainly packages it, but if not, you can use pip: `pip install ansible`
- Mac: Use homebrew: `brew install ansible`

## Initial install of Klipper and Moonraker

### TODO 
> (The install-klipper playbook is mostly there, but I need to make config templates for the printers still.)
