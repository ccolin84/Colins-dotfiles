;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; don't save the ~ backup files
(setq make-backup-files nil)

;; highlight matching parens
(show-paren-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-line-numbers (quote visual))
 '(package-selected-packages
   (quote
    (tide typescript-mode format-all exec-path-from-shell elixir-mode scala-mode flycheck cider company magit paredit clojure-mode projectile better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(better-defaults
                      exec-path-from-shell
                      projectile
                      clojure-mode
                      cider
                      paredit
                      magit
                      org
                      company
                      scala-mode
                      elixir-mode
                      dockerfile-mode
                      docker-compose-mode
                      typescript-mode
                      tide
                      format-all
                      flycheck))


(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(require 'ocamlformat)
(add-hook 'tuareg-mode-hook (lambda ()
  (define-key tuareg-mode-map (kbd "C-M-<tab>") #'ocamlformat)
  (add-hook 'before-save-hook #'ocamlformat-before-save)))

(require 'ido)
(ido-mode t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; -----------------------------------------
;; SET UP TYPESCRIPT
;; -----------------------------------------
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; set the typescript indent level to 2
(setq-default typescript-indent-level 2)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(setq tide-format-options
    '(:baseIndentSize 0
      :tabSize 2
      :indentSize 2))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; -----------------------------------------

;; -----------------------------------------
;; SET UP COMMON LISP WITH Roswell
;; -----------------------------------------
(load (expand-file-name "~/.roswell/helper.el"))

(setf slime-lisp-implementations
       `((sbcl ("ros" "-Q" "-l" "~/.sbclrc" "-L" "sbcl" "run"))
         (ccl  ("ros" "-Q" "-l" "~/.ccl-init.lisp" "-L" "ccl-bin" "run"))))
(setf slime-default-lisp 'sbcl)
(setq slime-net-coding-system 'utf-8-unix)

(defun lisp-hook-fn ()
  (interactive)
  ;; Start slime mode
  (slime-mode)
  ;; Some useful key-bindings
  (local-set-key [tab] 'slime-complete-symbol)
  (local-set-key (kbd "M-q") 'slime-reindent-defun)
  ;; We set the indent function. common-lisp-indent-function 
  ;; will indent our code the right way
  (set (make-local-variable lisp-indent-function) 'common-lisp-indent-function)
  ;; We tell slime to not load failed compiled code
  (setq slime-load-failed-fasl 'never))

;; Finally we tell lisp-mode to run our function on startup
(add-hook 'lisp-mode-hook 'lisp-hook-fn)
;; -----------------------------------------

;; activate paredit mode

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)

(setq cider-cljs-lein-repl
	"(do (require 'figwheel-sidecar.repl-api)
         (figwheel-sidecar.repl-api/start-figwheel!)
         (figwheel-sidecar.repl-api/cljs-repl))")

(global-company-mode)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
