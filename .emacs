(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rst-level-1 ((t (:background "blue"))))
 '(rst-level-2 ((t (:background "blue"))))
 '(rst-level-3 ((t (:background "blue"))))
 '(rst-level-4 ((t (:background "blue"))))
 '(rst-level-5 ((t (:background "blue"))))
 '(rst-level-6 ((t (:background "blue")))))


;; enable whitespace to highlight empty space and long lines.
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

;; enable scrolling and clicking with the mouse wheel.
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(autoload 'mwheel-install "mwheel" "Enable wheely mouse")
(mwheel-install)
(mouse-wheel-mode t)

;; packages for install
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;; configure scala mode
(add-hook 'scala-mode-hook '(lambda()
  (global-whitespace-mode f)
))

;; turn off tab indenting so we use spaces all the time.
(setq-default indent-tabs-mode nil)
