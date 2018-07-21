
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" nil t)
(defalias 'javascript-mode 'espresso-mode)

(autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)
;; (autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
;; (autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
;; (autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)

;;(load "C:/apps/emacs/EmacsW32/nxhtml/autostart.el")

(defun reload-firefox ()         
  (interactive)
  (comint-send-string (inferior-moz-process)
					  "setTimeout(BrowserReload(), '1000');"))


(defun auto-reload-firefox-on-after-save-hook ()         
  (add-hook 'after-save-hook
			'reload-firefox
			'append 'local))



;; Example - you may want to add hooks for your own modes.
;; I also add this to python-mode when doing django development.
(add-hook 'html-mode-hook 'auto-reload-firefox-on-after-save-hook)
(add-hook 'css-mode-hook 'auto-reload-firefox-on-after-save-hook)
(add-hook 'espresso-mode-hook 'auto-reload-firefox-on-after-save-hook)
(add-hook 'php-mode-hook 'auto-reload-firefox-on-after-save-hook)
