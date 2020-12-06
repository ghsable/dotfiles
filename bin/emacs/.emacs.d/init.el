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
;; directory
(setq default-directory "~/")

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
    monokai-theme neotree
    evil
    slime
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; appearance
(load-theme 'monokai t)
;; neotree.el
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; evil.el
(require 'evil)
(evil-mode 1)

;; Common Lisp on Steel Bank Common Lisp
(setq inferior-lisp-program "sbcl")
;; slime.el
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(neotree slime monokai-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
