# WIFIonICE

This project is a quick hack for macOS users who don't want to be limited by the 200M limit in 2nd class anymore.
It changes the mac address of the interface once the limit is reached to 90%.
This software is not intended to be used in production as it's against the Terms and Conditions of the WIFIonICE Provider, this is a PoC.

# Usage
```
#git clone this repo and from the repo dir, do:
sudo mkdir -p /usr/local/sbin && sudo ln -s ./wifi_on_ice /usr/local/sbin/wifi_on_ice
sudo watch -n 10 wifi_on_ice
```

