(defconst cmake-ide-packages
  '(cmake-ide company-irony irony))

(defun cmake-ide/init-cmake-ide ()
  (use-package cmake-ide))

(defun cmake-ide/init-irony ()
  (use-package irony))

(defun cmake-ide/init-company-irony ()
  (use-package company-irony))

(defun cmake-ide/post-init-cmake-ide ()
  (require 'rtags)
  (cmake-ide-setup))

(defun cmake-ide/post-init-irony ()
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; Replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

