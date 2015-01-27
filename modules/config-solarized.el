
(defadvice load-theme
  (after load-theme-hook activate preactivate compile)
  (run-hooks 'load-theme-hook))

(add-hook 'load-theme-hook
  (lambda ()
    (set-face-attribute 'mode-line nil
      :underline nil :box nil)
    (set-face-attribute 'mode-line-inactive nil
      :underline nil :box nil)

    (if (display-graphic-p)
      (set-face-attribute 'vertical-border nil
        :foreground nil
        :inherit 'region)

      (let ((display-table (or standard-display-table (make-display-table))))
        (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│))
        (setq standard-display-table display-table)))))


(if (<= (display-color-cells) 256)
  (progn
    (load-theme 'tango-dark)
    (set-face-attribute 'hl-line nil
      :foreground nil
      :background "grey20"
      :inherit nil))
  (package-activate 'solarized-theme)
  (load-theme 'solarized-dark)
  (set-face-background 'fringe "#022F3A")
  (set-face-background 'mode-line-inactive "#073642"))

(provide 'config-solarized)
