;;; init.el

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
    ;;;; vim
    evil
    ;;;; common lisp
    slime
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; evil.el
(require 'evil)
(evil-mode 1)

;; common lisp on Steel Bank Common Lisp
(setq inferior-lisp-program "sbcl")
;; slime.el
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;;; init.el ends here
