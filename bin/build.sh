#!/bin/bash

shopt -s expand_aliases

alias RCMD="ssh -o StrictHostKeyChecking=no -p 2222 -t localhost"
alias RCP="scp -P 2222"

RCMD git clone https://github.com/open-horizon/horizon-deb-packager
RCMD "cd horizon-deb-packager/build_support; time make"
mkdir -p loot
RCP localhost:horizon-deb-packager/dist/*.deb loot/
RCMD reboot

