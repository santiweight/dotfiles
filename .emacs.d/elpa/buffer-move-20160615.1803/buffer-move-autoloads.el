;;; buffer-move-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "buffer-move" "../../../../.emacs.d/elpa/buffer-move-20160615.1803/buffer-move.el"
;;;;;;  "533b7704a31bffcf5e30415dd41b2755")
;;; Generated autoloads from ../../../../.emacs.d/elpa/buffer-move-20160615.1803/buffer-move.el

(autoload 'buf-move-up "buffer-move" "\
Swap the current buffer and the buffer above the split.
   If there is no split, ie now window above the current one, an
   error is signaled.

\(fn)" t nil)

(autoload 'buf-move-down "buffer-move" "\
Swap the current buffer and the buffer under the split.
   If there is no split, ie now window under the current one, an
   error is signaled.

\(fn)" t nil)

(autoload 'buf-move-left "buffer-move" "\
Swap the current buffer and the buffer on the left of the split.
   If there is no split, ie now window on the left of the current
   one, an error is signaled.

\(fn)" t nil)

(autoload 'buf-move-right "buffer-move" "\
Swap the current buffer and the buffer on the right of the split.
   If there is no split, ie now window on the right of the current
   one, an error is signaled.

\(fn)" t nil)

(autoload 'buf-move "buffer-move" "\
Begin moving the current buffer to different windows.

Use the arrow keys to move in the desired direction.  Pressing
any other key exits this function.

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "buffer-move"
;;;;;;  "../../../../.emacs.d/elpa/buffer-move-20160615.1803/buffer-move.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/buffer-move-20160615.1803/buffer-move.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "buffer-move" '("buf")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/buffer-move-20160615.1803/buffer-move-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/buffer-move-20160615.1803/buffer-move.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; buffer-move-autoloads.el ends here
