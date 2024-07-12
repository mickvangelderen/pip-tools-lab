This repository demonstrates the use of [pip-tools](https://github.com/jazzband/pip-tools) to resolve python dependencies in a way that allows us to create container images with different layers for dependencies to minimize changes.
The set of all dependencies across layers must have gone through the same dependency resolution process.

The repository contains the following scripts:

- [`./init.sh`](./init.sh): create virtual environment and install pip-tools
- [`./lock.sh`](./lock.sh): regenerate lock files (`requirements*.txt`) from dependencies (`requirements*.in`)
- [`./sync.sh`](./sync.sh): install dependencies into virtual environment for local development
- [`./image.sh`](./image.sh): build an image

Adding a dependency in [`requirements.1.in`](./requirements.1.in) should allow re-use of the docker layer for dependencies installed before that, like [`requirements.0.in`](./requirements.0.in).

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
