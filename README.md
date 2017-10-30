## Horizon .deb cross build and test

### Prereq

```
apt-get install -y qemu-kvm docker.io make
```

### Build

```
make loot ARCH=arm
make loot ARCH=aarch64
make loot ARCH=x86_64
```

### Get loot

```
ls -l targets/*/loot
```
