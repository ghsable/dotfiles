;;; init.el

;; startup-message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;; font
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-18"))
;; appearance
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)
(electric-pair-mode 1)
(show-paren-mode 1)

;; package.el
(require 'package)
;; override package-archives
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ;;("melpa-stable" . "https://stable.melpa.org/packages/")
                         ;;("org" . "https://orgmode.org/elpa/")
                         ;;("gnu" . "https://elpa.gnu.org/packages/")
                         ))
(package-initialize)
(package-refresh-contents)
;; package-install
(defvar my/favorite-packages
  '(
    monokai-theme
    evil
    slime
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; appearance
(load-theme 'monokai t)

;; evil.el
(require 'evil)
(evil-mode 1)

;; common lisp on Steel Bank Common Lisp
(setq inferior-lisp-program "sbcl")
;; slime.el
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;;; init.el ends here
