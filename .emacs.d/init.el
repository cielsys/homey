;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsCiel : Skeleton emacs init file
;; Refers nearly all initialization to my emacs-initciel.el

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Added by Package.el. Must come before cfg of installed packages.  Don't delete this line.
(package-initialize)

;; bootstrap use-package
;; https://github.com/jwiegley/use-package/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; The :ensure keyword causes the package(s) to be installed
;; automatically if not already present on your system
;; use-package-always-ensure if you wish this behavior to be global
;; for all packages
(setq use-package-always-ensure t)
  
(setq custom-file "~/.emacs.d/customciel.el")
(load custom-file)
(load-file "~/.emacs.d/initciel.el")
(put 'scroll-left 'disabled nil)
