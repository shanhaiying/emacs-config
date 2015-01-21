(eval-when-compile
  (with-demoted-errors
    (require 'dired)
    (require 'dired-x)
    (require 'ls-lisp)))

(with-eval-after-load 'dired
  (require 'ls-lisp)
  (require 'dired-x)

  (defun my-dired-up-directory ()
    "Take dired up one directory, but behave like dired-find-alternate-file"
    (interactive)
    (let ((old (current-buffer)))
      (dired-up-directory)
      (kill-buffer old)))

  (defun my-dired-enable-wdired ()
    (interactive)
    (unless (evil-insert-state-p)
      (evil-insert-state))
    (wdired-change-to-wdired-mode))

  (evil-define-key 'normal dired-mode-map "h" #'my-dired-up-directory)
  (evil-define-key 'normal dired-mode-map "l" #'dired-find-alternate-file)
  (evil-define-key 'normal dired-mode-map "j" #'dired-next-line)
  (evil-define-key 'normal dired-mode-map "k" #'dired-previous-line)

  (evil-define-key 'normal dired-mode-map "I" #'my-dired-enable-wdired)

  (evil-define-key 'normal dired-mode-map "o" #'dired-sort-toggle-or-edit)
  (evil-define-key 'normal dired-mode-map "m" #'dired-toggle-marks)
  (evil-define-key 'normal dired-mode-map "v" #'dired-mark)
  (evil-define-key 'normal dired-mode-map "V" #'dired-unmark)
  (evil-define-key 'normal dired-mode-map (kbd "C-v") #'dired-unmark-all-marks)
  (evil-define-key 'normal dired-mode-map "u" #'dired-undo)
  (evil-define-key 'normal dired-mode-map "c" #'dired-create-directory)

  (evil-define-key 'normal dired-mode-map "n" #'evil-search-next)
  (evil-define-key 'normal dired-mode-map "N" #'evil-search-previous)
  (evil-define-key 'normal dired-mode-map "q" #'kill-this-buffer)

  (require 'dired-avfs)

  (require 'dired-filter)
  (evil-define-key 'normal dired-mode-map "|" dired-filter-map)

  (setq
    ls-lisp-use-insert-directory-program nil
    ls-lisp-support-shell-wildcards t
    ls-lisp-dirs-first t
    ls-lisp-verbosity nil))
