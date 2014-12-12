(eval-when-compile
  (progn
    (require 'evil)
    (require 'jedi)))

(add-hook 'python-mode-hook
  (lambda ()
    (add-to-list 'evil-overriding-maps 'jedi-mode-map)
    (evil-define-key 'normal jedi-mode-map (kbd "gd") 'jedi:goto-definition)
    (jedi:setup)))

(with-eval-after-load 'python
  (setq
    jedi:use-shortcuts t
    jedi:install-imenu t))