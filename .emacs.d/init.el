(require 'ido)
(ido-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-hook 'after-init-hook #'global-flycheck-mode)

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
                      paredit
                      magit
                      company
                      scala-mode
                      flycheck))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
