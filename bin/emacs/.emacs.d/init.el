;; init.el

;; load-path
(let ((default-directory (locate-user-emacs-file "./repos")))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; * Common Lisp
;; Set Steel Bank Common Lisp
(setq inferior-lisp-program "sbcl")
;; Set SLIME
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

