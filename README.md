# Playwright Docker Alpine Base On Node.JS Image

## v1 - based on `node:14.16-alpine` (477MB)

- Small size **477MB**
- `Dockerfile` based on official `node:14.16-alpine` image (see [Dockerfile](Dockerfile))
- With `seccomp` profile for Chrome (`chrome.json`, thanks to [Jessie Frazelle](https://github.com/jessfraz))
- Under `node` user.

### Usage

```bash
docker-compose up --build -V
```

## v2 - based on `alpine:3.13` (420MB)

- Same as `v1` but based on alpine's image (see [Dockerfile.v2.alpine](Dockerfile.v2.alpine))
- Small size **420MB**

### Usage

```bash
docker-compose -f docker-compose.v2.alpine.yml up --build -V
```

## Just copy, paste and go)

**My choice is v1**, because it's easier to update the nodejs version just by changing the base image tag, +50 MB is not much.

**Glad if I saved your time.**
