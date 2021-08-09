## Elpy-plus

### Overview

This implementation is adapted from [spacemacs-layers](https://github.com/rgemulla/spacemacs-layers/tree/master/%2Blang/elpy), which is distributed under the GPL-3.0 [License](../LICENSE).

###  Differences

Following are the key differences from the aforementioned legacy code:

1. Removal of boilerplate code
2. Removal of delay-based autocompletions, ie. autocompletions only on demand
3. Modification of the `company-complete` keybinding to `M-<tab>`
4. Hard-coding the `company-backends` variable with sensible upstream defaults. This is necessary to resolve conflicts with the `auto-completion` Spacemacs layer, in case it is used.
