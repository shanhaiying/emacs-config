(require 'package)

(eval-when-compile
  (progn
    (require 'cl)
    (require 'cl-lib)))

;; Package archives
(setq
  package-enable-at-startup nil
  package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
     ("elpa" . "http://tromey.com/elpa/")
     ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Guarantee all packages are installed on start
(defvar packages-list
  '(
     ;; ido based packages
     flx-ido
     ido-ubiquitous
     ido-vertical-mode
     smex

     ;; evil based modes
     evil
     evil-easymotion
     evil-exchange
     evil-indent-textobject
     evil-leader
     evil-matchit
     evil-nerd-commenter
     evil-org
     evil-surround
     evil-terminal-cursor-changer
     evil-visualstar

     ;; major modes
     bbcode-mode
     coffee-mode
     crontab-mode
     csharp-mode
     csv-mode
     cython-mode
     dart-mode
     fasm-mode
     haskell-mode
     idris-mode
     jedi
     js2-mode
     js2-refactor
     json-mode
     julia-mode
     less-css-mode
     livescript-mode
     markdown-mode
     matlab-mode
     php-mode
     pkgbuild-mode
     sass-mode
     scss-mode
     web-mode

     ac-js2
     ace-jump-mode
     adaptive-wrap
     aggressive-indent
     auto-async-byte-compile
     auto-complete
     auto-indent-mode
     diff-hl
     diminish
     dtrt-indent
     easy-kill
     expand-region
     flx-isearch
     flycheck
     flyspell
     framemove
     git-gutter+
     gitattributes-mode
     gitconfig-mode
     gitignore-mode
     helm-ag
     helm-projectile
     hexrgb
     icicles
     idomenu
     impatient-mode
     idle-require
     key-chord
     lacarte
     linum-relative
     load-dir
     magit
     magit-filenotify
     multiple-cursors
     noflet
     psvn
     rainbow-delimiters
     smartparens
     smartrep
     smooth-scrolling
     solarized-theme
     traad
     whole-line-or-region
     wide-n
     ws-butler
     xclip)
  "List of packages needs to be installed at launch")

(defun has-package-not-installed ()
  (loop for p in packages-list
    when (not (package-installed-p p)) do (return t)
    finally (return nil)))

(defun install-all-packages ()
  (interactive)
  (when (has-package-not-installed)
    ;; Check for new packages (package versions)
    (message "%s" "Get latest versions of all packages...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; Install the missing packages
    (dolist (p packages-list)
      (when (not (package-installed-p p))
	(package-install p)))
    (package-initialize)))

(install-all-packages)

(add-to-list 'load-path "~/.emacs.d/personal/")

(require 'idle-require)
(setq idle-require-symbols
  '(
     helm-files
     helm-ring
     helm-projectile
     helm-semantic
     helm-ag
     icicles

     magit
     magit-filenotify
     multiple-cursors
     windmove
     framemove
     easy-kill
     flx-isearch
     ace-jump-mode
     whole-line-or-region
     smex
     psvn))

(if (daemonp)
  (progn
    (message "loading symbols for server")
    (mapc 'require idle-require-symbols))

  (add-hook 'emacs-startup-hook #'idle-require-mode)
  (add-hook 'idle-require-mode-hook
    (lambda ()
      (diminish 'idle-require-mode " ⟳"))))

(provide 'config-package)
