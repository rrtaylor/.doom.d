;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(load! "+misc")

(setq doom-scratch-buffer-major-mode 'emacs-lisp-mode)
(setq-default fill-column 100
              delete-trailing-lines t)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Richard Taylor"
      user-mail-address "richard.rowan.taylor@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 11))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; org
(map! :desc "Create Sparse Tree" :ne "SPC / s" #'org-sparse-tree)
(map! :desc "Create Sparse Tree" :ne "SPC / t" #'org-tags-sparse-tree)
(after! org
  (setq org-log-done 'time
        org-catch-invisible-edits t
        org-agenda-include-diary t
        org-agenda-files (list "~/Dropbox/flock/todo.org" "~/Dropbox/Richard-Brooks/todo.org")
        org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-directory "~/Dropbox/org"
        org-default-notes-file (concat org-directory "/notes.org")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(after! projectile-mode
  (setq projectile-switch-project-action 'projectile-dired))

;; uniq lines
(defun uniq-lines (beg end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

;; custom key-bindings
(global-set-key (kbd "C->") 'comment-region)
(global-set-key (kbd "C-<") 'uncomment-region)

;; Tramp
(setq tramp-default-method "ssh")

