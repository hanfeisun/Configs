;; General 
(show-paren-mode 'on)
(transient-mark-mode 'on)

(if x-resource-name
    (progn
      ;; Theme 
      (add-to-list 'load-path "~/.emacs.d/solar-theme")
      (set-face-attribute 'default nil :font "inconsolata-16")
      (require 'solarized-light-theme)

      ;; For MacOS
      (setenv "PATH" (concat (getenv "PATH")
			     ":/usr/local/bin:/usr/local/mysql/bin"))
      (setq exec-path (append exec-path
			      '("/usr/local/bin" "/usr/local/mysql/bin")))))



;; For package
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; For clojure
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (progn
	      (paredit-mode 1)
	      (require 'javadoc-help)
	      (global-set-key "\C-c\C-j" 'javadoc-lookup)
	      (setq inferior-lisp-program "lein repl"))))


;; For C
(add-hook 'c-mode-hook
	  (lambda ()
	    (c-set-style "linux")))

;; For awk
(add-hook 'awk-mode-hook
	  (lambda ()
	    (c-toggle-electric-state -1)))

;; For R
(add-to-list 'load-path "~/.emacs.d/ess-12.04-4/lisp")
(require 'ess-site)

(setq sql-user "root")
(setq sql-password "")
(setq sql-database "dc")
