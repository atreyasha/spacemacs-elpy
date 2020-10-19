## Spacemacs-Elpy :heart:

This repository documents [Elpy](https://github.com/jorgenschaefer/elpy) as a Spacemacs layer, which is intended as a replacement for the Spacemacs `python` layer.

## Usage :book:

Here we provide two implementations of Elpy, specifically a basic implementation which uses all upstream Elpy defaults (named `elpy`) and another which contains opinionated keybindings, toggles and auto-completion settings (named `elpy-plus`).

See corresponding readmes for [elpy](+lang/elpy) and [elpy-plus](+lang/elpy-plus) for detailed information.

### Installation

Copy the relevant configuration code to `~/.emacs.d` by executing:

```shell
$ make install
```

To trigger a complete installation, append either `elpy` or `elpy-plus` to your `.spacemacs` dotfile under `dotspacemacs-configuration-layers`.

### Troublshooting

Based on personal experience, I encounter conflicts between `company` autocompletion from Elpy and the `auto-completion` layer offered by Spacemacs. For example, I notice that certain autocompletions don't work with Elpy when the Spacemacs `auto-completion` layer is enabled. As a workaround, I do not use the `auto-completion` layer.

However I would welcome any pull-requests if someone finds a better workaround which diagnoses or resolves this conflict.

### Uninstallation

For a complete uninstallation, remove `elpy` or `elpy-plus` from your `.spacemacs` dotfile. Next, execute the following to remove the aforementioned configuration code:

```shell
$ make uninstall
```

## Bugs/Issues :bug:

Feel free to open a GitHub issue in case of any bugs.

<!--  LocalWords:  Spacemacs Elpy readmes elpy dotfile Uninstallation
 -->
<!--  LocalWords:  uninstallation autocompletion autocompletions
 -->
