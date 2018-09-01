(global-set-key "\C-ca" 'windmove-left)
(global-set-key "\C-cd" 'windmove-right)
(global-set-key "\C-cw" 'windmove-up)
(global-set-key "\C-cs" 'windmove-down)

(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)

(global-set-key (kbd "M-\\") 'er/mark-inside-quotes) ;; package expand-region

;; ---------------- Word marking -------------------------
;;(modify-syntax-entry ?_ "w"  c-mode-syntax-table)
;;(modify-syntax-entry ?_ "w" perl-mode-syntax-table)
;; Causes key press or yank to overwrite current selection
(delete-selection-mode)

;; ---------------- Window/Frame control -------------------------
(defun toggle-current-window-dedication ()
 "toggle-current-window-dedication"
 (interactive)
 (let* ((window    (selected-window))
        (dedicated (window-dedicated-p window)))
   (set-window-dedicated-p window (not dedicated))
   (message "Window %sdedicated to %s"
            (if dedicated "no longer " "")
            (buffer-name))))

(global-set-key [pause] 'toggle-current-window-dedication)


(defun copy-line ()
  (interactive)
  (save-excursion
    (back-to-indentation)
    (kill-ring-save
     (point)
     (line-end-position)))
  (message "1 line copied"))



(defun xah-show-kill-ring ()
  "Insert all `kill-ring' content in a new buffer.
   URL `http://ergoemacs.org/emacs/emacs_show_kill_ring.html' Version 2017-06-19"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (progn
      (switch-to-buffer $buf)
      (funcall 'fundamental-mode)
      (setq buffer-offer-save t)
      (dolist (x kill-ring )
        (insert x "\n--------------------------------------------------\n\n"))
      (goto-char (point-min)))))
