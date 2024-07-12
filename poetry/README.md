This repository demonstrates how you can split a project's python dependencies into multiple container image layers so that, when dependencies change, only a small part of the image needs to be rebuilt.

The set of all dependencies across layers must have gone through the same dependency resolution process.

The repository contains the following scripts:

- [`./init.sh`](./init.sh): set up build tooling
- [`./lock.sh`](./lock.sh): regenerate lock files
- [`./sync.sh`](./sync.sh): install dependencies for local development
- [`./image.sh`](./image.sh): build a container image

## Future

It would be interesting to try to create a separate layer for each dependency and compose them.
With docker, we can create a stage for each dependency and copy the dependency from the stage into the final state with `--link` so that the subsequent copies do not invalidate one-another.

```Dockerfile
# Create stage (layer) for each dependency
FROM python as dep1
RUN pip install --no-deps dep1==x.y.z

FROM python as dep2
RUN pip install --no-depds dep2==x.y.z

# Compose the dependency layers
FROM python as main

COPY --link --from=dep1 ? ?
COPY --link --from=dep2 ? ? 
```

I am not yet sure it is possible to determine what files need to be copied for each dependency automatically.
