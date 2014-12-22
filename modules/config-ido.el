(eval-when-compile (require 'ido-ubiquitous))

(ido-mode +1)
(ido-ubiquitous-mode +1)

(with-eval-after-load 'ido
  (setq
    ido-enable-flex-matching t
    ido-save-directory-list-file "~/.emacs.d/ido.last"
    ido-use-faces nil))

(add-hook 'ido-minibuffer-setup-hook
  (lambda ()
    (unless (featurep 'flx-ido)
      (flx-ido-mode +1))
    (unless (featurep 'ido-vertical-mode)
      (ido-vertical-mode +1))))

(with-eval-after-load 'smex
  (setq smex-save-file
    (concat
      user-emacs-directory
      "smex-items")))

(global-set-key (kbd "M-x") #'smex)

(global-set-key (kbd "M-=") #'idomenu)

(global-set-key (kbd "C-M-s") #'flx-isearch-forward)
(global-set-key (kbd "C-M-r") #'flx-isearch-backward)

(provide 'config-ido)
