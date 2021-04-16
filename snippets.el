;;; yasnippet-snippets.el --- Collection of yasnippet snippets

;;; Code:

(require 'yasnippet)

(defconst luismayta-snippets-dir
  (expand-file-name
   "snippets"
   (file-name-directory
    ;; Copied from ‘f-this-file’ from f.el.
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

;;;###autoload
(defun luismayta-snippets-initialize ()
  "Load the `luismayta-snippets' snippets directory."
  ;; NOTE: we add the symbol `luismayta-snippets-dir' rather than its
  ;; value, so that luismayta will automatically find the directory
  ;; after this package is updated (i.e., moves directory).
  (add-to-list 'yas-snippet-dirs 'luismayta-snippets-dir t)
  (yas-load-directory luismayta-snippets-dir t))

(defgroup luismayta-snippets nil
  "Options for luismayta setups.

This is useful for customizing options declared in
“.yas-setup.el” files.  For example, you could declare a
customizable variable used for a snippet expansion.

See Info node `(elisp)Customization Types'."
  :group 'luismayta)

(defun luismayta-snippets--fixed-indent ()
  "Set `yas-indent-line' to `fixed'."
  (set (make-local-variable 'yas-indent-line) 'fixed))

(defun luismayta-snippets--no-indent ()
  "Set `yas-indent-line' to nil."
  (set (make-local-variable 'yas-indent-line) nil))

;;;###autoload
(eval-after-load 'luismayta
   '(luismayta-snippets-initialize))


(provide 'luismayta-snippets)

;;; snippets.el ends here
