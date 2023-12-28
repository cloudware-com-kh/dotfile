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

;; Assign `mode`' to file extension
;;
(use-package! web-mode
  :mode (("\\.sface$" . web-mode))
  :config
  (add-to-list 'web-mode-engines-alist '("elixir" . "\\.sface$" ))
  (add-to-list 'web-mode-engines-alist '("elixir" . "\\.heex$" ))
  )

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
    (setq lsp-enable-file-watchers nil))
  )
;; Format all buffer
;;
(map! :leader
      :desc "Format buffer"
      "c f" #'format-all-buffer)
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
(setq projectile-enable-caching nil)

(use-package lsp-tailwindcss
  :ensure t
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  :config
  (add-to-list 'lsp-tailwindcss-major-modes 'elixir-mode))

;; Assumes web-mode and elixir-mode are already set up
;;

;; Install the required packages if not already installed

(after! lsp
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda ()
                       (cons (lsp-package-path 'html-language-server)
                             lsp-html-server-command-args)))
    :major-modes '(elixir-mode) ; Add any other relevant major modes
    :server-id 'html
    :priority -1
    :add-on? t)))

(after! lsp
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda ()
                       `(,(or (executable-find (cl-first lsp-emmet-ls-command))
                              (lsp-package-path 'emmet-ls))
                         ,@(cl-rest lsp-emmet-ls-command))))
    :major-modes '(elixir-mode) ; Add any other relevant major modes
    :server-id 'emmet
    :priority -1
    :add-on? t)))

;; Elixir custom lsp
;;
(after! lsp
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda ()
                       `(,(or (when (f-exists? lsp-elixir-local-server-command)
                                lsp-elixir-local-server-command)
                              (or (executable-find
                                   (cl-first lsp-elixir-server-command))
                                  (lsp-package-path 'elixir-ls))
                              "language_server.bat")
                         ,@(cl-rest lsp-elixir-server-command))))
    :major-modes '(web-mode) ; Add any other relevant major modes
    :server-id 'elixir
    :priority -1
    :add-on? t)))
