(eval-when-compile (require 'cl))
(eval-when-compile (require 'projectile))

(projectile-global-mode +1)

(with-eval-after-load 'projectile
  (progn
    (setq projectile-mode-line
      '(:eval (format " ↠")))))
