;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Pietro F. Maggi"
      user-mail-address "pfm@pietromaggi.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "Source Code Pro for Powerline" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/Dropbox/org/")
(setq org-directory "~/Sources/writings/writing/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq projectile-project-search-path '("~/Sources/"))

(after! geiser
  (setq geiser-chez-binary (executable-find "chez"))
  (setq geiser-guile-binary (executable-find "guile"))
  ;; (setq geiser-repl-use-other-window nil)
  ;; (define-advice org-babel-scheme-get-repl (:around (old-fun &rest args) dont-switch-buffer)
  ;;   "Work-around for URL `https://github.com/jaor/geiser/issues/107'."
  ;;   (cl-letf (((symbol-function 'geiser-repl--switch-to-buffer) #'set-buffer))
  ;;     (apply old-fun args)))
  )

;; (setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18)
;;       ;;doom-variable-pitch-font (font-spec :family "ETBembo" :size 18)
;;       doom-variable-pitch-font (font-spec :family "Alegreya" :size 18))
;;
;; (add-hook! 'org-mode-hook #'mixed-pitch-mode)
;; (add-hook! 'org-mode-hook #'solaire-mode)
;; (setq mixed-pitch-variable-pitch-cursor nil)

;; (org-babel-do-load-languages 'org-babel-load-languages
;;                              (append org-babel-load-languages
;;                               '((python     . t)
;;                                 (scheme     . t))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((c      . t)
   (scheme . t)))

;; (plist-put! +ligatures-extra-symbols
;;   :and           nil
;;   :or            nil
;;   :for           nil
;;   :not           nil
;;   :true          nil
;;   :false         nil
;;   :int           nil
;;   :float         nil
;;   :str           nil
;;   :bool          nil
;;   :list          nil
;; )
;;
;; (let ((ligatures-to-disable '(:true :false :int :float :str :bool :list :and :or :for :not)))
;;   (dolist (sym ligatures-to-disable)
;;     (plist-put! +ligatures-extra-symbols sym nil)))

(setq doom-modeline-enable-word-count t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Zig and Zig language server configuration
(use-package! zig-mode
  :hook ((zig-mode . lsp-deferred))
  :custom (zig-format-on-save nil)
  :config
  (after! lsp-mode
    (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
    (lsp-register-client
      (make-lsp-client
        :new-connection (lsp-stdio-connection "~/bin/zls")
        :major-modes '(zig-mode)
        :server-id 'zls))))
