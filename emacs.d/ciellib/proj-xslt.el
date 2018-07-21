;;==========================
(defun xxx (start end)
  "xxx"
  (interactive "r")
  (message "Pt %d PtMin %d Region %d %d" (point) (point-min) start end))

(defun xx (start end)
  "xx"
  (interactive
   (if (and mark-active transient-mark-mode (mark))
	   (list (region-beginning) (region-end))
	 (list 1 (point-max))))
  (message "Pt %d PtMin %d Region %d %d" (point) (point-min) start end))

(defun dbl(begin end)
  "Delete ALL blank lines in buffer or region if active"
  ;;(interactive "r")
  (interactive
    (if (and mark-active transient-mark-mode (mark))
	   (list (region-beginning) (region-end))
	 (list 1 (point-max))))
 (save-excursion
	;; If there's  region selected
   (narrow-to-region begin end)
   (goto-char (point-min))
   (flush-lines "^[\t ]*$")
   (widen)))

(defun xp()
  "Process xml file with xslt"
  (interactive)
  (save-excursion
   (xslt-process-invoke-buffer-view)))

(defun setpp()
  "Set post process hook"
  (interactive)
  (setq xslt-process-xslt-processing-finished-hooks (list 'post-proc))
  )


(defun post-proc()
  "Post process"
  (interactive)
  (setq buf (get-buffer "*xslt results*"))
  (if buf (progn
			(set-buffer buf)
			(dbl 1 (point-max))
			(xml-mode)
			(pretty-print-xml-region (point-min) (point-max))
			(setq win (get-buffer-window "*xslt results*"))
			(if win
				(select-window win)))
	)
)

(defalias 'pp 'post-proc)
(defalias 'gf 'grep-find)

(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
	  (delete-trailing-whitespace)
      (indent-region begin end)
	  ;;(untabify begin end)
	  )
    ;;(message "Ah, much better!")
  )

(defalias 'ppx 'pretty-print-xml-region)


(defun cip ()
  "copy id to path attribute"
  (interactive)
  (replace-regexp "id=\"\\(.*\\)\"" "id=\"\\1\" path=\"\\1\"" nil
				  (if (and transient-mark-mode mark-active)
					  (region-beginning))
				  (if (and transient-mark-mode mark-active)
					  (region-end))))

(add-to-list 'load-path "C:/apps/emacs/emacs/site-lisp/xslt-process-2.2/lisp")
;;(load-library "xslt-process")
;;(load-library "xslt-speedbar")
;;(autoload 'xslt-process-mode "xslt-process"
;;          "Run XSLT processor on buffer" t)
