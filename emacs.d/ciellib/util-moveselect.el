(global-set-key "\C-ca" 'windmove-left)
(global-set-key "\C-cd" 'windmove-right)
(global-set-key "\C-cw" 'windmove-up)
(global-set-key "\C-cs" 'windmove-down)
(global-set-key (kbd "M-\\") 'er/mark-inside-quotes) ;; package expand-region

;; ---------------- Word marking -------------------------
;;(modify-syntax-entry ?_ "w"  c-mode-syntax-table)
;;(modify-syntax-entry ?_ "w" perl-mode-syntax-table)
(delete-selection-mode)

;; ---------------- Window/Frame control -------------------------
(defun toggle-current-window-dedication ()
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))

(global-set-key [pause] 'toggle-current-window-dedication)
