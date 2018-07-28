;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; junk.el : ELisp fragments that
;;   I've written but can no longer decipher
;;   I've collected from other sources but don't need or understand


;; What even is the md5 crap??? Something to do with xml path attributes
(defun insert-md5 (begin end)
  "Convert marked text and insert at point"
  (interactive "r")
  (setq md5-str (md5 (current-buffer) begin end))
  (delete-region begin end)
  (insert md5-str)
  )

(defun im5 (begin end)
  (interactive "r")
  (insert (md5 (delete-region begin end))))

(defalias 'i5 'insert-md5)

(defun rpm5 ()
  "replace id=path with with id=md5(path) & path=path"
  (interactive)
  (replace-regexp "id=\"\\(.*\\)\""
				  (quote
				   (replace-eval-replacement concat "id=\""
											 (replace-quote
											  (md5 (match-string 1))) "\"" " path=\"\\1\"")) nil
											  (if (and transient-mark-mode mark-active)
												  (region-beginning))
											  (if (and transient-mark-mode mark-active)
												  (region-end)))
  )
(defun rm5 ()
  "replace id=path id=md5(path)"
  (interactive)
  (replace-regexp "id=\"\\(.*\\)\""
				  (quote
				   (replace-eval-replacement concat "id=\""
											 (replace-quote
											  (md5 (match-string 1))) "\"" )) nil
											  (if (and transient-mark-mode mark-active)
												  (region-beginning))
											  (if (and transient-mark-mode mark-active)
												  (region-end)))
  )

(defalias 'rr 'rpm5)
;;(require 'tramp)
;;(load-file "C:/apps/emacs/emacs/site-lisp/cedet-1.0pre7/common/cedet.el")
;;(require 'cedet)
;;(setq semantic-load-turn-useful-things-on t)
;;(global-ede-mode 1)
;;(require 'semantic)

;;(add-to-list 'load-path "C:/apps/emacs/emacs/site-lisp/ecb-2.40")
;;(require 'ecb)
;;(require 'ecb-autoloads)
;;(ecb-activate)

;;(add-to-list 'load-path "C:/apps/emacs/emacs/site-lisp/elib")
;;(load-library "elib")
;;(load-library "elib-1.0")
(defun select-text-in-quote ()
"Select text between the nearest left and right delimiters.
Delimiters are paired characters: ()[]<>«»“”‘’「」, including \"\"."
 (interactive)
 (let (b1 b2)
   (skip-chars-backward "^<>(“{[「«\"‘")
   (setq b1 (point))
   (skip-chars-forward "^<>)”}]」»\"’")
   (setq b2 (point))
   (set-mark b1)
   )
 )
