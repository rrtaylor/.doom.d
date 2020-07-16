;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; overrides other minor mode keymaps (just for non-evil)
(map!
  ;; Conventional text-editing keys & motions
 "M-a" #'mark-whole-buffer
 "M-left"      #'backward-word
 "M-right"     #'forward-word
 )
