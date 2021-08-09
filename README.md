# spacemacs-elpy :heart:

This repository documents [Elpy](https://github.com/jorgenschaefer/elpy) as a Spacemacs layer, which is intended as a replacement for the Spacemacs `python` layer.

## Usage

Here we provide two implementations of Elpy, specifically a basic implementation which uses all upstream Elpy defaults (named `elpy`) and another which contains opinionated keybindings, toggles and auto-completion settings (named `elpy-plus`).

For detailed information, see the corresponding readmes under [elpy](/elpy) and [elpy-plus](/elpy-plus).

### Installation

We assume all personal configuration code is housed in `~/.emacs.d`. Copy the relevant configuration code to `~/.emacs.d` by executing:

```shell
$ make install
```

To trigger a complete installation, append either `elpy` or `elpy-plus` to your `.spacemacs` dotfile under `dotspacemacs-configuration-layers` and reload `emacs`.

### Uninstallation

For a complete uninstallation, remove `elpy` or `elpy-plus` from your `.spacemacs` dotfile. Next, execute the following to remove the aforementioned configuration code:

```shell
$ make uninstall
```

## Bugs/Issues

Feel free to open a GitHub issue in case of any bugs.

<!--  LocalWords:  Spacemacs Elpy readmes elpy dotfile Uninstallation
 -->
<!--  LocalWords:  uninstallation autocompletion autocompletions
 -->
