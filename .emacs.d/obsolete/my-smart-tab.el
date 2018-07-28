;; From
;; http://www.emacswiki.org/emacs/SmartTabs

;; For CC Mode (C, C++, Java et al.), add

(setq-default tab-width 4) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
	(if (memq indent-line-function
			  '(indent-relative
				indent-relative-maybe))
		(setq indent-tabs-mode nil))
	ad-do-it))

(defmacro smart-tabs-advice (function offset)
  (defvaralias offset 'tab-width)
  `(defadvice ,function (around smart-tabs activate)
	 (cond
	  (indent-tabs-mode
	   (save-excursion
		 (beginning-of-line)
		 (while (looking-at "\t*\\( +\\)\t+")
		   (replace-match "" nil nil nil 1)))
	   (setq tab-width tab-width)
	   (let ((tab-width fill-column)
			 (,offset fill-column))
		 ad-do-it))
	  (t
	   ad-do-it))))

(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)

;; NOTE: The rest of the page assumes the above is already in place.
;; JavaScript For Js2Mode, add

(smart-tabs-advice js2-indent-line js2-basic-offset)

;; Perl For CPerlMode, add

    (smart-tabs-advice cperl-indent-line cperl-indent-level)

;; Python For python.el, add

(smart-tabs-advice python-indent-line-1 python-indent)
(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)
			(setq tab-width (default-value 'tab-width))))

;; Smart tabs are, of course, fully Python compliant,
;; as the interpreter ignores the leading whitespace of continuation lines.
;; However, in accordance with PEP 8, you should probably use tabs only when maintaining old code.

;; Ruby For RubyMode, add

(smart-tabs-advice ruby-indent-line ruby-indent-level)
(setq ruby-indent-tabs-mode t)

;; VHDL For VhdlMode, add

(smart-tabs-advice vhdl-indent-line vhdl-basic-offset)
(setq vhdl-indent-tabs-mode t)

;; Toggling
;; Smart tabs are only used when indent-tabs-mode is non-nil (default).
;; Type C-h v indent-tabs-mode RET to see the current, buffer-local value.
;; To change indent-tabs-mode for the current buffer only:
;;   M-x set-variable indent-tabs-mode RET or customize the mode hook.

;; What you probably want to do:
;;    Disable tabs globally (spaces only)
;;    and reactivate them for modes with smart tabs handling. For CC Mode:

    (setq-default indent-tabs-mode nil)
    (add-hook 'c-mode-common-hook
              (lambda () (setq indent-tabs-mode t)))

;; See GuessStyle for a package which attempts to determine the proper values for
;;   indent-tabs-mode and the
;;   indentation offset by analysing how the file is formatted.
;;   (Of course, since smart tabs are tab size-independent, such files do not have an offset.)