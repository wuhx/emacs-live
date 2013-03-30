(defun system-specific-setup-mac()
;;Mac configuration

;mac key setting
(setq ns-command-modifier 'meta)
(setq ns-function-modifier 'super)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq visible-bell t)
(setq initial-buffer-choice t)

;mode setting
(ido-mode t)
(tool-bar-mode -1)
(column-number-mode t)
(show-paren-mode t)
;(scroll-bar-mode -1) ;;scroll-bar.el
(global-linum-mode t)
;(setq linum-format "%-4d")
(fset 'yes-or-no-p 'y-or-n-p)

;font
;(if window-system (
;(set-frame-font "Menlo-15")
;(set-fontset-font
;  (frame-parameter nil 'font)
;  'han
;  (font-spec :family "Hiragino Sans GB" )))
;)
;; etcetera...
)

(defun system-specific-setup-linux()
;;linux configuration
(add-to-list
  'default-frame-alist
  '(font . "-Misc-Fixed-Medium-R-Normal--14-130-75-75-C-70-ISO8859-1"))
(setq my-frame-width 95)
(setq my-frame-height 56)
; Not much else
)

(defun system-specific-setup-windows()
;;windows configuration
)

(cond ((eq system-type 'windows-nt) (system-specific-setup-windows))
      ((eq system-type 'gnu/linux) (system-specific-setup-linux))
      ((eq system-type 'darwin) (system-specific-setup-mac))
     ; (t (system-specific-setup-mac))
     )

;;evil mode
(evil-mode 1)
