## Spacemacs-Elpy :heart:

This repository documents a workflow to integrate [Elpy](https://github.com/jorgenschaefer/elpy) as a Spacemacs layer. This layer is intended to replace the Spacemacs `python` layer.

## Usage

Here we provide two implementations of Elpy, specifically a barebone implementation which uses all upstream Elpy defaults (named `elpy`) and another which contains additional opinionated keybindings, toggles and auto-completion settings (named `elpy-plus`).

See corresponding readmes for [elpy](+lang/elpy/README.md) and [elpy-plus](+lang/elpy-plus/README.md) for more detailed information.

### Installation

In order to install both variants to your local `~/.emacs.d` configuration, simply execute:

```shell
$ make install
```

This will copy the relevant configuration code to `~/.emacs.d/private/+lang`. In order to trigger a complete installation, append either `elpy` or `elpy-plus` to your `.spacemacs` dotfile under `dotspacemacs-configuration-layers`.

### Uninstallation

For complete uninstallation, remove `elpy` or `elpy-plus` from your `.spacemacs` dotfile. Next, execute the following to remove the aforementioned configuration code:

```shell
$ make uninstall
```

### Troubleshooting

Based on personal experience, I encounter conflicts between `company` autocompletion from Elpy and the `auto-completion` layer offered by Spacemacs. For example, I notice that certain autocompletions don't work with Elpy when the Spacemacs `auto-completion` layer is enabled.

As a personal workaround, I disable `auto-completion` globally. However I would welcome any issues or pull-requests if someone finds a better workaround which diagnoses or resolves this conflict.
