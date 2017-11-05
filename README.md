## Horizon .deb cross build and test

### Prereq

Ubuntu 16.04 x86_64 with 8 virtual (4 physical) cores and 4 GB RAM.

```
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu xenial edge" >/etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -qq - >/dev/null
apt-get update
apt-get install -y qemu-kvm docker-ce make git
```

### Build

```
git clone https://github.com/open-horizon/qemu-cross-build
cd qemu-cross-build
```

32-bit ARM:
```
time make loot ARCH=arm     2>&1 | tee make.log     # ETA: 412 min
```

Example output:
```
bluehorizon_2.10.0~ppa~debian.jessie_armhf.deb
bluehorizon_2.10.0~ppa~debian.sid_armhf.deb
bluehorizon_2.10.0~ppa~raspbian.jessie_armhf.deb
bluehorizon_2.10.0~ppa~raspbian.sid_armhf.deb
bluehorizon_2.10.0~ppa~ubuntu.xenial_armhf.deb
bluehorizon_2.10.0~ppa~ubuntu.yakkety_armhf.deb
bluehorizon-ui_2.10.0~ppa~debian.jessie_armhf.deb
bluehorizon-ui_2.10.0~ppa~debian.sid_armhf.deb
bluehorizon-ui_2.10.0~ppa~raspbian.jessie_armhf.deb
bluehorizon-ui_2.10.0~ppa~raspbian.sid_armhf.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.xenial_armhf.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.yakkety_armhf.deb
horizon_2.10.0~ppa~debian.jessie_armhf.deb
horizon_2.10.0~ppa~debian.sid_armhf.deb
horizon_2.10.0~ppa~raspbian.jessie_armhf.deb
horizon_2.10.0~ppa~raspbian.sid_armhf.deb
horizon_2.10.0~ppa~ubuntu.xenial_armhf.deb
horizon_2.10.0~ppa~ubuntu.yakkety_armhf.deb
```

64-bit ARM:
```
time make loot ARCH=aarch64 2>&1 | tee -a make.log  # ETA: 344 min
```

Example output:
```
bluehorizon_2.10.0~ppa~ubuntu.xenial_arm64.deb
bluehorizon_2.10.0~ppa~ubuntu.yakkety_arm64.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.xenial_arm64.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.yakkety_arm64.deb
horizon_2.10.0~ppa~ubuntu.xenial_arm64.deb
horizon_2.10.0~ppa~ubuntu.yakkety_arm64.deb
```

PPC64:
```
time make loot ARCH=ppc64le 2>&1 | tee -a make.log  # ETA: 340 min
```

Example output:
```
bluehorizon_2.10.0~ppa~ubuntu.xenial_ppc64el.deb
bluehorizon_2.10.0~ppa~ubuntu.yakkety_ppc64el.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.xenial_ppc64el.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.yakkety_ppc64el.deb
horizon_2.10.0~ppa~ubuntu.xenial_ppc64el.deb
horizon_2.10.0~ppa~ubuntu.yakkety_ppc64el.deb
```

x86_64:
```
time make loot ARCH=x86_64  2>&1 | tee -a make.log  # ETA: 18 min (KVM, bare-metal 4 virtual cores)
                                                    # ETA: 339 min (non-KVM, VM w/ 8 virtual cores)
```

Example output:
```
bluehorizon_2.10.0~ppa~ubuntu.xenial_amd64.deb
bluehorizon_2.10.0~ppa~ubuntu.yakkety_amd64.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.xenial_amd64.deb
bluehorizon-ui_2.10.0~ppa~ubuntu.yakkety_amd64.deb
horizon_2.10.0~ppa~ubuntu.xenial_amd64.deb
horizon_2.10.0~ppa~ubuntu.yakkety_amd64.deb
```

### Get loot

```
ls -l targets/*/loot
```
