(define-configuration buffer
  ((default-modes (append '(vi-normal-mode) %slot-default%))))
(define-configuration base-mode
  ((keymap-scheme
    (define-scheme (:name-prefix "my-base" :import %slot-default%)
      scheme:vi-normal
      (list "g s" 'search-buffers)))))
