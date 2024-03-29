;; -*- lexical-binding: t -*-
;; -*- mode: emacs-lisp -*-
;; Enhanced Elpy layer for Spacemacs
;; Adapted from: https://github.com/rgemulla/spacemacs-layers/
;; Copyright (C) 2021 Atreya Shankar
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defconst elpy-plus-packages '(elpy python-isort))

(defun elpy-plus/init-elpy ()
  (use-package elpy
    :ensure t
    :defer t
    :init (advice-add 'python-mode :before 'elpy-enable)
    :config
    (diminish 'elpy-mode " Ⓔ")
    ;; configure auto-completion
    (add-hook 'elpy-mode-hook
              (lambda ()
                 ;; pure on-demand completion with M-<tab>
                 (setq company-minimum-prefix-length 2)
                 (setq company-idle-delay nil)
                 (define-key elpy-mode-map (kbd "M-<tab>") 'company-complete)))
    (defun elpy-format-code-plus ()
      (interactive)
      (elpy-format-code)
      (python-isort-buffer))
    ;; python-mode key bindings
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mh" "help")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mg" "goto")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "me" "send to REPL")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "ms" "send to REPL and step")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mr" "refactor")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mV" "pyvenv")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mn" "notebook")
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mt" "toggle")
    (spacemacs/set-leader-keys-for-major-mode
      'python-mode "hh" 'elpy-doc "ga" 'elpy-goto-assignment
      "gA" 'elpy-goto-assignment-other-window "go"
      'elpy-occur-definitions "gi" 'elpy-shell-switch-to-shell
      "gI" 'elpy-shell-switch-to-shell-in-current-window
      "ee" 'elpy-shell-send-statement "eE" 'elpy-shell-send-statement-and-go
      "es" 'elpy-shell-send-top-statement "eS" 'elpy-shell-send-top-statement-and-go
      "ef" 'elpy-shell-send-defun "eF" 'elpy-shell-send-defun-and-go
      "ec" 'elpy-shell-send-defclass "eC" 'elpy-shell-send-defclass-and-go
      "eg" 'elpy-shell-send-group "eG" 'elpy-shell-send-group-and-go
      "ew" 'elpy-shell-send-codecell "eW" 'elpy-shell-send-codecell-and-go
      "er" 'elpy-shell-send-region-or-buffer "eR"
      'elpy-shell-send-region-or-buffer-and-go "eb"
      'elpy-shell-send-buffer "eB" 'elpy-shell-send-buffer-and-go
      "se" 'elpy-shell-send-statement-and-step "sE"
      'elpy-shell-send-statement-and-step-and-go
      "ss" 'elpy-shell-send-top-statement-and-step
      "sS" 'elpy-shell-send-top-statement-and-step-and-go
      "sf" 'elpy-shell-send-defun-and-step "sF"
      'elpy-shell-send-defun-and-step-and-go "sc"
      'elpy-shell-send-defclass-and-step "sC" 'elpy-shell-send-defclass-and-step-and-go
      "sg" 'elpy-shell-send-group-and-step "sG"
      'elpy-shell-send-group-and-step-and-go "sw"
      'elpy-shell-send-codecell-and-step "sW" 'elpy-shell-send-codecell-and-step-and-go
      "sr" 'elpy-shell-send-region-or-buffer-and-step
      "sR" 'elpy-shell-send-region-or-buffer-and-step-and-go
      "sb" 'elpy-shell-send-buffer-and-step "sB"
      'elpy-shell-send-buffer-and-step-and-go "rc"
      'elpy-check "re" 'elpy-multiedit "rf" 'elpy-format-code-plus
      "rr" 'elpy-refactor "rs" 'elpy-rgrep-symbol
      "Va" 'pyvenv-activate "Vd" 'pyvenv-deactivate
      "Vw" 'pyvenv-workon "nc" 'elpy/insert-codecell-above
      "nm" 'elpy/insert-markdowncell-above)
    ;; jump handlers
    (add-to-list 'spacemacs-jump-handlers-python-mode
                 '(elpy-goto-definition)
                 t)
    (add-to-list 'spacemacs-jump-handlers-python-mode
                 '(dumb-jump-go)
                 t)
    ;; inferior-python-mode key bindings
    (spacemacs/declare-prefix-for-mode 'inferior-python-mode
      "mg" "goto")
    (spacemacs/set-leader-keys-for-major-mode
      'inferior-python-mode "gi" 'elpy-shell-switch-to-buffer
      "gI" 'elpy-shell-switch-to-buffer-in-current-window)
    (with-eval-after-load 'counsel
      (define-key inferior-python-mode-map (kbd "C-r") 'counsel-shell-history))
    (with-eval-after-load 'helm
      (define-key inferior-python-mode-map (kbd "C-r") 'spacemacs/helm-shell-history))
    ;; toggles
    (spacemacs/declare-prefix-for-mode 'python-mode
      "mt" "toggles")
    (spacemacs|add-toggle elpy/shell-display-buffer-after-send
      :documentation "Toggles whether to show the python shell after sending something to it"
      :status elpy-shell-display-buffer-after-send
      :on (setq elpy-shell-display-buffer-after-send
                t):off
      (setq elpy-shell-display-buffer-after-send
            nil)
      :evil-leader-for-mode (python-mode . "td"))
    (spacemacs|add-toggle elpy/shell-echo-input
      :documentation "Toggles whether to echo input sent to the Python shell in the shell buffer"
      :status elpy-shell-echo-input
      :on (setq elpy-shell-echo-input t):off
      (setq elpy-shell-echo-input nil)
      :evil-leader-for-mode (python-mode . "ti"))
    (spacemacs|add-toggle elpy/shell-echo-output
      :documentation "Toggles whether to echo the Python shell output in the echo area"
      :status elpy-shell-echo-output
      :on (setq elpy-shell-echo-output 'when-shell-not-visible):off
      (setq elpy-shell-echo-output nil)
      :evil-leader-for-mode (python-mode . "to"))))

(defun elpy-plus/post-init-elpy ()
  (add-hook 'elpy-mode-hook
            (lambda ()
               ;; hard configure auto-completion
               (setq company-backends '(elpy-company-backend company-bbdb
                                                             company-cmake
                                                             company-clang
                                                             company-files
                                                             (company-dabbrev-code company-gtags company-etags
                                                                                   company-keywords)
                                                             company-oddmuse
                                                             company-dabbrev)))))

(defun elpy-plus/init-python-isort ()
  (use-package python-isort
    :defer t))
