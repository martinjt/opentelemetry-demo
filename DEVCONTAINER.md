# Using the devcontainer

This repo includes a devcontainer to all the demo to run locally without dependencies, or inside Github Codespaces.

## Minikube

This is used to build the cluster locally

```bash
minikube --cpus=<cpus> --memory=<memory>
```

## Skaffold

You can use skaffold to build and deploy. Right now, I've not worked out how to conditionally apply overrides to images, so you have to comment out the override you want.

```bash
skaffold run -b <image you want to build> --port-forward=user
```

This will use the default images from helm for everything other than the service you're building locally. Additionally, it will forward port 8080 to your local environment.

By default, skaffold adds a label called `skaffold.dev/run-id`. This causes a redeployment of all resources as you run. If you only want a single image to be deployed, you can do this with:

```bash
skaffold run -b <image you want to build> --port-forward=user --label skaffold.dev/run-id=static
```

## k9s

The image also includes k9s, you can start this up using `k9s`. Additionally, if you're using VSCode, you can run that in the main editor window instead of the terminal panel at the bottom by opening a new terminal there.