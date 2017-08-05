;;; packages.el --- cmake-ide layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: nick <nick@acer-c710-mint>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `cmake-ide-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cmake-ide/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cmake-ide/pre-init-PACKAGE' and/or
;;   `cmake-ide/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst spacemacs-cmake-ide-packages
  '(cmake-ide company-irony irony)
  "The list of Lisp packages required by the cmake-ide layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun spacemacs-cmake-ide/init-cmake-ide ()
  (use-package cmake-ide))

(defun spacemacs-cmake-ide/init-irony ()
  (use-package irony))

(defun spacemacs-cmake-ide/init-company-irony ()
  (use-package company-irony))

(defun spacemacs-cmake-ide/post-init-cmake-ide ()
  (require 'rtags)
  (cmake-ide-setup))

(defun spacemacs-cmake-ide/post-init-irony ()
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

;;; packages.el ends here
