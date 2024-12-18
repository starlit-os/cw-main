# CentOS Workstation

CentOS Stream-based image with @Workstation preinstalled. How this is expected to be consumed:

```Dockerfile
FROM ghcr.io/centos-workstation/main:latest # (or whatever tag you want)
RUN dnf -y install htop fastfetch

$your_hopes_and_dreams_go_here.

RUN bootc container lint
```

## Goals

Taking the lessons from [Universal Blue](https://github.com/ublue-os/) but built entirely with [bootc](https://github.com/containers/bootc)

We aim to:

- Facilitate local development with [Just](https://just.systems/) and use it also for CI (so that we have one single correct way to do things)
- Make "main" sleek and as simple as possible to tweak - no "silverblue", "kinoite", "whatever" images, 
just the base, you that the users consume and install the desktops on (we also should provide hardware enablement right from here.)
- Contribute to upstream as much as possible to make it so people arent entirely reliant on workarounds that we provide here (such as upstreaming packages to EPEL, fixing bugs, and whatever else)
- Leverage cloud-native tech to make our stuff MUCH easier, like kernel pinning, easier rollbacks with tons of tags, everything we already do really

<sub><sup>This is just a draft of this README, please add more stuff here</sup></sub>
