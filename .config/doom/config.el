;;
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; Font
;;
(setq doom-font (font-spec :family "JetBrainsMono NF" :size 17.5))
;; Window
;;
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Format on save
;;
;; (add-hook 'prog-mode-hook 'format-all-mode)
;; Transparency
;;
(add-to-list 'default-frame-alist '(alpha . 95))
;; Line number type
;;
(setq display-line-numbers-type 'relative)

;; Assign lsp language ID
;;
(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(web-mode . "html")))

;; Auto sart lsp
;;
(use-package! elixir-mode
  :hook (elixir-mode . lsp)
  :config
  (after! lsp-mode
    (setq lsp-enable-file-watchers nil)
    (setq lsp-elixir-suggest-specs nil)
    )
  )

;; Format all buffer
;;
(map! :leader
      :desc "Format buffer"
      "c f" #'lsp-format-buffer)
;; Increase window size
;;
(map!
 :n "M-l" #'enlarge-window-horizontally
 :n "M-j" #'enlarge-window
 :n "M-k" #'shrink-window
 :n "M-h" #'shrink-window-horizontally)
;; Zoom window
;;
(use-package zoom-window
  :ensure t
  :config
  (custom-set-variables
   '(zoom-window-mode-line-color nil)
   '(zoom-window-mode-line-active-color nil)
   '(zoom-window-mode-line-inactive-color nil))

  ;; Bind leader + zz to zoom-window
  (map! :leader
        :desc "Zoom window"
        "zz" #'zoom-window-zoom))
;; (setq projectile-enable-caching nil)

(use-package lsp-tailwindcss
  :ensure t
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  :config
  (add-to-list 'lsp-tailwindcss-major-modes 'web-mode))

(setq! lsp-elixir-ls-version "v0.19.0")
;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
