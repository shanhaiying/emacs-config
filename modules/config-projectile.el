(eval-when-compile
  (progn
    (require 'cl-lib)
    (require 'projectile)
    (load-library "config-modes")))

(with-eval-after-load 'projectile
  (require 'magit)
  (setq projectile-mode-line
    '(:eval (format " ↠"))))

(cl-macrolet
  ((define-temp-projectile-binding (key func)
     `(global-set-key ,(kbd (concat "C-c p " key)) ,func)))

  (generate-calls define-temp-projectile-binding
    (
      ("4 a" 'projectile-find-other-file-other-window)
      ("4 b" 'projectile-switch-to-buffer-other-window)
      ("4 C-o" 'projectile-display-buffer)
      ("4 d" 'projectile-find-dir-other-window)
      ("4 f" 'projectile-find-file-other-window)
      ("4 g" 'projectile-find-file-dwim-other-window)
      ("4 t" 'projectile-find-implementation-or-test-other-window)
      ("!" 'projectile-run-shell-command-in-root)
      ("&" 'projectile-run-async-shell-command-in-root)
      ("a" 'projectile-find-other-file)
      ("b" 'projectile-switch-to-buffer)
      ("c" 'projectile-compile-project)
      ("d" 'projectile-find-dir)
      ("D" 'projectile-dired)
      ("e" 'projectile-recentf)
      ("f" 'projectile-find-file)
      ("g" 'projectile-find-file-dwim)
      ("F" 'projectile-find-file-in-known-projects)
      ("i" 'projectile-invalidate-cache)
      ("I" 'projectile-ibuffer)
      ("j" 'projectile-find-tag)
      ("k" 'projectile-kill-buffers)
      ("l" 'projectile-find-file-in-directory)
      ("m" 'projectile-commander)
      ("o" 'projectile-multi-occur)
      ("p" 'projectile-switch-project)
      ("P" 'projectile-test-project)
      ("r" 'projectile-replace)
      ("R" 'projectile-regenerate-tags)
      ("s a" 'projectile-ack)
      ("s g" 'projectile-grep)
      ("s s" 'projectile-ag)
      ("S" 'projectile-save-project-buffers)
      ("t" 'projectile-toggle-between-implementation-and-test)
      ("T" 'projectile-find-test-file)
      ("v" 'projectile-vc)
      ("z" 'projectile-cache-current-file)
      ("ESC" 'projectile-project-buffers-other-buffer))))
