;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NAVIGATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq evil-cross-lines t
      evil-split-window-below t
      evil-vsplit-window-right t)

(after! evil-snipe
  (setq evil-snipe-scope 'buffer
        evil-snipe-repeat-scope 'buffer))
