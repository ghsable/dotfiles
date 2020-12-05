;;; init.el

;; load-path
(let ((default-directory (locate-user-emacs-file "./repos")))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; package.el
(require 'package)
;; override package-archives
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
;; package-refresh
(package-refresh-contents)

;; common lisp on Steel Bank Common Lisp
(setq inferior-lisp-program "sbcl")
;; slime.el
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

;;; init.el ends here
