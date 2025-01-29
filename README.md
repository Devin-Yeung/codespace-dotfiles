# Conventions

All the configs that are used to setup the environment are stored in the `/workspaces/.codespaces/.persistedshare/dotfiles` directory. To make it easier to access, a symlink is created in the home directory, and all the configs can be found in the `~/.codespace/config` directory.


# Install via Nix

```bash
nix profile install "$(readlink -f $HOME/.codespace/config)#full"
# or
ni
# a alias to the full command
```

> [!IMPORTANT]
> Flake is not accessible through symlink (see [NixOS/nix#8013](https://github.com/NixOS/nix/issues/8013))