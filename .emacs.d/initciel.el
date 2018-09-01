;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customization & settings
(setq inhibit-splash-screen t)       ;; Don't show initial Emacs-logo and info
(global-auto-revert-mode t) ;; Reload buffers when file has changed on disk
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default sh-basic-offset 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard
(define-key global-map (kbd "RET") 'newline-and-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loadfiles

(use-package tramp :ensure t)
(when (eq system-type 'windows-nt)
  (setq tramp-default-method "plink"))

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck :ensure t)
(use-package elpy :ensure t)
(elpy-enable)

(require 'linum)
(require 'cl)
(require 'cl-lib)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/ciellib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lib"))

(load "cfg-whitespace.el")
(load "cfg-sounds.el")
(load "cfg-unicode.el")

(load "util-moveselect.el")
(load "util-datetime.el")

(load "proj-web.el")
(load "proj-c.el")
(load "proj-xslt.el")

;; Must agree with customciel.el
;; backup-directory-alist auto-save-file-name-transforms
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/tmp/" t)
(make-directory "~/.emacs.d/tmp/baks/" t)
(make-directory "~/.emacs.d/tmp/autosaves/" t)

;;#   backup-by-copying t      ; don't clobber symlinks
;;#   delete-old-versions t
;;#   kept-new-versions 6
;;#   kept-old-versions 2
;;#   version-control t)       ; use versioned backups
;;

(load "idle-highlight-mode.el")
(defun my-coding-hook ()
  ;; (make-local-variable 'column-number-mode)
  ;;(column-number-mode t)
  ;;(if window-system (hl-line-mode t))
  (idle-highlight-mode t))

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'python-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Configure to wait a bit longer after edits before starting
;;(setq-default flymake-no-changes-timeout '3)

;; Keymaps to navigate to the errors
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cn" 'flymake-goto-next-error)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cp" 'flymake-goto-prev-error)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Speedbar
(setq speedbar-use-imenu-flag nil)
(setq speedbar-fetch-etags-command "D:/apps/emacs/bin/etags.exe")
(setq speedbar-fetch-etags-arguments '("-e" "-f" "-"))
;;(setq speedbar-fetch-etags-arguments '("-e" "-f-" "--javascript-kinds=+fcmvp" "*.js"))

(speedbar)
;;(speedbar-add-supported-extension ".js")
;;(add-to-list 'speedbar-fetch-etags-parse-list '("\\.js" . speedbar-parse-c-or-c++tag))

;; https://stackoverflow.com/questions/13036155/how-to-combine-emacs-primary-clipboard-copy-and-paste-behavior-on-ms-windows
;; Normalize killring, clipbaord mouse behavior
(setq select-active-regions nil)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-2] 'mouse-yank-at-click)

;; Can't bear it anymore. Must bind Ctrl-v to paste
(global-set-key "\C-v" 'yank)
(global-set-key "\C-z" 'undo)
