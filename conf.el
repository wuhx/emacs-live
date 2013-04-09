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
(setq linum-format "%-2d")
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
;(define-key evil-normal-state-map "M-RET" 'nrepl-eval-line)

;;(require 'surround)
;;(global-surround-mode 1)

;;customize cursor color
(add-to-list 'default-frame-alist '(cursor-color . "palegoldenrod"))
;;customize font
;(add-to-list 'default-frame-alist '(font . "PragmataPro 14"))

;;shell alias config for emacs
;alias emacsd='/Applications/Emacs.app/Contents/MacOS/Emacs --daemon'
;alias demacs='emacsclient -e "(kill-emacs)"'
;alias es='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n $1'

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (yas-minor-mode . " γ")
    (paredit-mode . " Φ")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . " τ")
    (volatile-highlights-mode . " υ")
    (elisp-slime-nav-mode . " δ")
    (nrepl-mode . " ηζ")
    (nrepl-interaction-mode . " ηζ")
    ;; Major modes
    (clojure-mode . "λ")
    (hi-lock-mode . "")
    (python-mode . "Py")
    (emacs-lisp-mode . "EL")
    (markdown-mode . "md"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))


(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;; Greek letters - C-u C-\ greek ;; C-\ to revert to default
;;; ς ε ρ τ υ θ ι ο π α σ δ φ γ η ξ κ λ ζ χ ψ ω β ν μ

;;reload buffer if file changed by external editor
;;same as M-x revert-buffer
(global-auto-revert-mode 1)



;;macro
(global-set-key (kbd "C-c a") 'nrepl-eval-pare)
(fset 'nrepl-eval-pare
   [?v ?% ?\C-c ?\C-r escape])
