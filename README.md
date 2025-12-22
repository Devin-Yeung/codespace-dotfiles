# Deprecated

I dont want to introduce extra complexity because there are SO MANY quirks in github codespace:

- https://github.com/NixOS/nix/issues/6680
- https://github.com/DeterminateSystems/nix-installer/issues/913

An ad-hoc devenv devcontainer is good enought for me:

```json
{
  "customizations": {
    "vscode": {
      "extensions": ["mkhl.direnv"]
    }
  },
  "features": {
    "ghcr.io/devcontainers/features/sshd:1": {
      "version": "latest"
    }
  },
  "image": "ghcr.io/cachix/devenv/devcontainer:latest",
  "overrideCommand": false,
  "updateContentCommand": "devenv test"
}
```
