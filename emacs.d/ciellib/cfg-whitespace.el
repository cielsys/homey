(defun indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  ;;(untabify (point-min) (point-max))
  )
(defalias 'iwb 'indent-whole-buffer)

;; ---------------- White Space -------------------------
(require 'ethan-wspace)
;; Turn off untabify
(set-default 'ethan-wspace-errors (remove 'tabs ethan-wspace-errors))
(global-ethan-wspace-mode 1)
;; Use the following:
;;   M-x ethan-wspace-highlight-FOO-mode or
;;   M-x ethan-wspace-clean-FOO-mode (each mode disables the other).
;; If you want to begin cleaning all whitespace, you can use
;;   M-x ethan-wspace-clean-all-modes.

;; http://stackoverflow.com/questions/318553/getting-emacs-to-untabify-when-saving-certain-file-types-and-only-those-file-typ
;; http://stackoverflow.com/questions/1931784/emacs-is-before-save-hook-a-local-variable
;; (add-hook 'c-mode-common-hook (lambda()
;; 								(add-hook 'local-write-file-hooks
;; 										  '(lambda()
;; 											 (save-excursion
;; 											   (delete-trailing-whitespace))))))
