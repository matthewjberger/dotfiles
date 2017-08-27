# spacemacs-cmake-ide

Adds [cmake-ide](https://github.com/atilaneves/cmake-ide) as a rudimentary spacemacs layer.

## To install

1. Install RTags and its dependencies as described [here](https://github.com/andersbakken/rtags).

2. Edit your .spacemacs file and tell emacs where rtags.el is installed (this is required because
   RTags will install this file to site-lisp by default, but spacemacs normally removes these
   directories from the load-path).

    ```elisp
    (defun dotspacemacs/user-init ()
      (push "/usr/local/share/emacs/site-lisp/rtags" load-path))
    ```

3. After installation, restart emacs and type

    M-x irony-install-server
