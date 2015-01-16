;; first subtractive
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; then additive
(column-number-mode +1)
(show-paren-mode +1)
(xterm-mouse-mode +1)
(icomplete-mode +1)
(global-visual-line-mode +1)

(add-hook 'find-file-hook #'auto-save-mode)
(add-hook 'find-file-hook #'global-auto-revert-mode)
(add-hook 'activate-mark-hook #'delete-selection-mode)
(add-hook 'find-file-hook (lambda () (prefer-coding-system 'utf-8)))
(add-hook 'before-save-hook (lambda () (setq buffer-backed-up nil)))
(add-hook 'emacs-startup-hook (lambda () (message "")))

(defun generic-term-init ()
  (face-remap-add-relative 'default :background "#111")
  (visual-line-mode -1)
  (make-variable-buffer-local 'global-hl-line-mode)
  (make-variable-buffer-local 'scroll-margin)
  (make-local-variable 'global-hl-line-mode)
  (setq
    global-hl-line-mode nil
    scroll-margin 0))

(add-hook 'term-mode-hook #'generic-term-init)
(add-hook 'shell-mode-hook #'generic-term-init)
(add-hook 'eshell-mode-hook #'generic-term-init)

(global-hl-line-mode +1)

;; interpreted as C-<Arrow> in a terminal
(global-set-key (kbd "M-[ d") #'windmove-left)
(global-set-key (kbd "M-[ c") #'windmove-right)
(global-set-key (kbd "M-[ a") #'windmove-up)
(global-set-key (kbd "M-[ b") #'windmove-down)

;; and parsed normally in GUI
(global-set-key (kbd "C-<left>") #'windmove-left)
(global-set-key (kbd "C-<right>") #'windmove-right)
(global-set-key (kbd "C-<up>") #'windmove-up)
(global-set-key (kbd "C-<down>") #'windmove-down)

(setf
  delete-by-moving-to-trash t
  echo-keystrokes 0.4
  term-default-bg-color "#111"
  
  ;; switch windows without clicking
  focus-follows-mouse 1
  mouse-autoselect-window 0.3

  ;; make scrolling sane
  scroll-margin 5
  scroll-conservatively 1000
  scroll-step 1
  redisplay-dont-pause t
  mouse-wheel-progressive-speed nil
  mouse-wheel-follow-mouse t
  mouse-wheel-scroll-amount '(3 ((shift) . 1))
  
  ;; indentation settings
  indent-tabs-mode nil
  tab-width 4
  lisp-indent-offset 2
  lisp-body-indent 2
  use-dialog-box nil
  
  ;; supress useless stuff
  inhibit-default-init 1
  inhibit-startup-screen t

  ;; syntax highlighting settings
  jit-lock-defer-time 0.04
  jit-lock-stealth-nice 0.1
  jit-lock-stealth-time 0.2
  jit-lock-stealth-verbose nil

  ;; cursor and selection settings
  mouse-drag-copy-region nil
  select-active-regions t
  ring-bell-function 'ignore
  x-stretch-cursor t  
  cursor-type 'box
  
  ;; clipboard stuff
  x-select-enable-clipboard t
  x-select-enable-primary t
  x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)
  interprogram-cut-function #'x-select-text
  interprogram-paste-function #'x-selection-value
  
  ;; backup locations
  backup-directory-alist
  `((".*" . ,(concat user-emacs-directory "data/backups")))
  auto-save-file-name-transforms
  `((".*" ,(concat user-emacs-directory "data/autosave") t))

  ;; auto-save parameters
  version-control t 
  kept-new-versions 30 
  kept-old-versions 0
  delete-old-versions t 
  backup-by-copying t
  backup-by-copying-when-linked t
  auto-save-default t   
  auto-save-timeout 10  
  auto-save-interval 200
  vc-make-backup-files t

  ;; hippie expand settings
  hippie-expand-try-functions-list
  '(try-expand-dabbrev
     try-expand-dabbrev-from-kill
     try-expand-dabbrev-all-buffers
     try-complete-file-name-partially
     try-complete-file-name
     try-expand-all-abbrevs
     try-expand-list
     try-expand-line
     try-complete-lisp-symbol-partially
     try-complete-lisp-symbol))

(global-set-key (kbd "M-/") 'hippie-expand)

(setq-default
  buffer-file-coding-system 'utf-8
  indent-tabs-mode nil)

(defalias 'yes-or-no-p #'y-or-n-p)

;; make vertical window borders prettier
(let ((display-table (or standard-display-table (make-display-table))))
  (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│))
  (setq standard-display-table display-table))

(set-face-attribute 'vertical-border nil
  :inherit 'default)

(load-theme 'tango-dark)

(set-face-background 'highlight "grey20")
(set-face-attribute 'hl-line nil
  :foreground nil
  :background nil
  :inherit 'fringe)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(set-face-foreground 'highlight nil)
