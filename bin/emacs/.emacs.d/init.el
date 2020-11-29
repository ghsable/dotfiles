;; init.el

;; * Common Lisp
;; Set Steel Bank Common Lisp
(setq inferior-lisp-program "sbcl")
;; Set load-path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/repos/slime"))
;; Set SLIME
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

