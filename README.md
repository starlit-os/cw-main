# CentOS Workstation

CentOS Stream-based images so that you can build your own ones easier.

How this is expected to be consumed:

```Dockerfile
FROM ghcr.io/centos-workstation/main:latest # (or whatever tag you want)

RUN dnf -y group install -y Workstation # or some other desktop

RUN dnf -y install htop fastfetch

RUN bootc container lint
```

## Goals

We want to avoid mistakes we ran into while building [Universal Blue](https://github.com/ublue-os/). This should be entirely [Bootc](https://github.com/containers/bootc) centric with actual 
upstream patterns, keeping maintainability in mind right out of the box.

We aim to:

- Facilitate local development with [Just](https://just.systems/) and use it also for CI (so that we have one single correct way to do things)
- Make "main" sleek and as simple as possible to tweak - no "silverblue", "kinoite", "whatever" images, 
just the base, you that the users consume and install the desktops on (we also should provide hardware enablement right from here.)
- Contribute to upstream as much as possible to make it so people arent entirely reliant on workarounds that we provide here (such as upstreaming packages to EPEL, fixing bugs, and whatever else)
- Leverage cloud-native tech to make our stuff MUCH easier, like kernel pinning, easier rollbacks with tons of tags, everything we already do really

<sub><sup>This is just a draft of this README, please add more stuff here</sup></sub>
