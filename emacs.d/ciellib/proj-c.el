;; ---------------- CProj  -------------------------
(defun cproj-root-here ()
  "Set this dir as root dir, do first build"
  (interactive)
  (setq my-proj-root default-directory)
  (call-interactively 'compile))

(defun cproj-build ()
  "Set this dir as root dir, do first build"
  (interactive)
  (setq default-directory my-proj-root)
  (save-some-buffers 1)
  (call-interactively 'recompile))

(global-set-key [C-f5] 'cproj-root-here)
(global-set-key [f5] 'cproj-build)
