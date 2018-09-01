(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-margin 5)
 '(auto-hscroll-mode t)
 '(auto-revert-verbose nil)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/tmp/autosaves/\\1" t))))
 '(backup-by-copying t)
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/tmp/baks/"))))
 '(browse-url-browser-function (quote browse-url-default-windows-browser))
 '(c-basic-offset (quote set-from-style))
 '(c-default-style (quote ((c-mode . ""))))
 '(c-hanging-braces-alist
   (quote
    ((defun-open after)
     (defun-close after)
     (block-close . c-snug-do-while)
     (statement-cont)
     (substatement-open after)
     (brace-list-open)
     (brace-entry-open)
     (extern-lang-open after)
     (namespace-open after)
     (module-open after)
     (composition-open after)
     (inexpr-class-open after)
     \.\.\.)))
 '(delete-old-versions t)
 '(desktop-save-mode t)
 '(dframe-update-speed 1)
 '(ecb-auto-expand-tag-tree (quote all))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(flycheck-idle-change-delay 5.0)
 '(flycheck-pylintrc "~/.pylintrc")
 '(global-auto-revert-mode t)
 '(global-linum-mode t)
 '(hscroll-step 0)
 '(idle-highlight-idle-time 1.5)
 '(linum-delay t)
 '(linum-eager nil)
 '(linum-format (quote dynamic))
 '(longlines-auto-wrap nil)
 '(mode-require-final-newline nil)
 '(nxml-sexp-element-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(package-selected-packages (quote (projectile use-package expand-region js2-mode)))
 '(show-paren-mode t)
 '(show-paren-ring-bell-on-mismatch t)
 '(speedbar-show-unknown-files t)
 '(tab-width 4)
 '(tidy-shell-program "C:/apps/emacs/EmacsW32/gnuwin32/bin/tidy.exe")
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(winner-mode t nil (winner))
 '(xslt-process-default-processor (quote (Xalan)))
 '(xslt-process-xml-xslt-associations
   (quote
    (("c:/cl/sites/devcl.list/webroot/xsl/view.navbar.xsl" . "c:/cl/sites/devcl.list/webroot/xsl/view.navbar.xsl")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(idle-highlight ((t (:inherit mode-line)))))
