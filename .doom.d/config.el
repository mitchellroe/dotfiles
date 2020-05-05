;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mitchell Roe"
      user-mail-address "mbroe@oakland.edu")

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
(setq doom-font (font-spec :family "monospace" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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


(use-package gnus
  ;; gnus is big, so don't load it on startup.
  :defer t
  :config
  ;; Load in some variables from a file that is not under version control.
  (setq mitchellroe/gnus-variable-file
        (expand-file-name ".gnus-vars.el" (getenv "HOME")))
  (when (file-exists-p mitchellroe/gnus-variable-file)
    (load mitchellroe/gnus-variable-file))
  ;; gnus' sorting is a bit strange. This puts it at a much more sane normal.
  (setq gnus-article-sort-functions
        '(gnus-article-sort-by-number gnus-article-sort-by-date))
  ;; Don't make me go in there and mark the message you just put in a folder
  ;; as read.
  (setq gnus-gcc-mark-as-read t)
  ;; `gnus-posting-styles' is set in `mitchellroe/gnus-variable-file'.
  ;; `gnus-secondary-select-methods' is set in `mitchellroe/gnus-variable-file'.
  ;; Set the "primary" method as nil. This makes it so that each account
  ;; (which I use equally) shows up with their prefixes.
  (setq gnus-select-method '(nnnil ""))
  (setq mail-host-address (getenv "HOSTNAME"))
  ;; Sets the citation line to be something like this:
  ;;
  ;; On Tue, 30 Jul 2019 at 19:08 -0400, John Doe wrote:
  ;;
  (setq message-citation-line-format "On %a, %d %b %Y at %R %z, %N wrote:")
  ;; And, of course, even if you set the format, you have to tell gnus to use
  ;; that format.
  (setq message-citation-line-function
        'message-insert-formatted-citation-line)
  ;; Puts your signature _above_ your forwarded message. I don't think it
  ;; makes much sense for it to be _below_ the forwarded message.
  (setq message-forward-before-signature nil))

(use-package yaml-mode
  :config
  (add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'yaml-mode-hook '(lambda () nil
                               (add-hook 'before-save-hook 'delete-trailing-whitespace))))

(setq scroll-margin 3)
