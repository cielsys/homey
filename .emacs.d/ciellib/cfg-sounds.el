;;(setq visible-bell nil)
;; Emacs does not beep or flash anymore,
;; on hit C-g in the minibuffer or during
;; an isearch.
(setq ring-bell-function
      (lambda ()
        (unless (memq this-command
                      '(isearch-abort abort-recursive-edit
                                      exit-minibuffer
                                      keyboard-quit))
		  (ding))))
;;(ding)
;;(setq ring-bell-function 'ding)
(when (eq system-type 'windows-nt)
  (set-message-beep 'question))

