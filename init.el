;; Switch buffers more comfortably
;;(iswitchb-mode t)

;; interactive do, fuzzy matching
;;(ido-mode t)
;;(setq ido-enable-flex-matching t)

;; No icons, thanks.
(if window-system (tool-bar-mode nil))

(fset 'yes-or-no-p 'y-or-n-p) ; stop forcing me to spell out "yes"
(setq inhibit-startup-message t) ; no need for the welcome screen

;; AuCTeX klarmachen
(require 'tex-site)

;;(add-to-list 'load-path "~/usr/share/emacs/site-lisp")

;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

;; RefTeX auf AuCTeX einstellen
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode

;; The path to the ite-lisp library.
;(setq ite-load-path "~/usr/share/ite/lib/ite.el")
;; Preload iTe
;(autoload 'ite ite-load-path "Start the interactive TeX editor" t)

;; .m-files sind Mathematica-Programme
;;(autoload 'mma-mode "~/mma.el" "Mathematica package file mode" t)
;;(setq auto-mode-alist
;;      (cons '("\\.m\\'" . mma-mode) auto-mode-alist))

;; .py sind Python scripts
;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python".python-mode))

;; now included by default
;; hg setup
;;(require 'mercurial)

;; Tramp starten
;;(require 'tramp)

;; PHP Mode
;;(require 'php-mode)

;; Schoen bunt machen
;; (require 'color-theme)
;;(color-theme-dark-blue)
;;(color-theme-pok-wog)
;; (color-theme-deep-blue)
;;(color-theme-classic)


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa" . "http://melpa.milkbox.net/packages/"))))

(when window-system
  (load-theme 'solarized-dark t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "English")
 '(custom-safe-themes
   (quote
    ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(global-font-lock-mode t nil (font-lock))
 '(org-babel-load-languages (quote ((C . t) (python . t))))
 '(safe-local-variable-values (quote ((TeX-master . "main"))))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "Andale mono")))))

(put 'narrow-to-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq org-log-done t)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/Dropbox/postdoc/org_files"))

;(setq org-latex-listings nil)
;(setq org-latex-packages-alist '("" "listings"))
;(add-to-list 'org-latex-packages-alist '("" "color"))

(if (not (boundp 'org-latex-classes))
    (setq org-latex-classes '()))
(add-to-list 'org-latex-classes
          '("koma-article"
             "\\documentclass{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
          '("article"
             "\\documentclass{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-listings 'minted)

(setq org-latex-minted-options
      '(("frame" "lines")
	("fontsize" "\\footnotesize")
	("linenos")))

(setq org-latex-to-pdf-process
      '("latexmk -shell-escape -pdf %f"))

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
			      (interactive)
			      (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
			      (interactive)
			      (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
