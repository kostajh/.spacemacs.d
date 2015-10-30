;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     kostajh
     auto-completion
     better-defaults
     emacs-lisp
     git
     prodigy
     markdown
     (gtags :variables
            helm-gtags-auto-update nil)
     github
     spotify
     pandoc
     sql
     python
     yaml
     restclient
     semantic
     html
     javascript
     emoji
     vagrant
     (deft :variables
       deft-extension "org"
       deft-directory "~/org/notes/"
       deft-use-filter-string-for-filename t
       deft-text-mode 'org-mode)
     (org :variables
          org-enable-github-support t
          org-startup-folded (quote "showeverything")
          org-directory "~/org"
          org-agenda-skip-scheduled-if-done t
          org-agenda-include-diary t
          org-clock-persist 'history
          org-outline-path-complete-in-steps nil
          org-refile-use-outline-path 'file
          org-refile-targets '((org-agenda-files :maxlevel . 4))
          org-default-notes-file (concat org-directory "/notes.org")
          org-todo-state-tags-triggers (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("HOLD" ("WAITING") ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("LOGGED" ("DONE") ("WAITING") ("HOLD") ("CANCELLED"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD"))))
          org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "LOGGED(l)" "CANCELLED(c@/!)") (sequence "WAITING(w@/!)" "HOLD(h@/!)" "PHONE" "MEETING" "APPOINTMENT")))
          org-agenda-files (quote ("~/org/todo.org"
                                   "~/org/notes.org"
                                   )))
     php
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(feature-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(org-repo-todo)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         solarized-light
                         solarized-dark
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; Keybindings.
  (evil-leader/set-key "oa" 'org-agenda)
  (evil-leader/set-key "oc" 'org-capture)
  (evil-leader/set-key "ois" 'kostajh/irc-slack)
  (evil-leader/set-key "oif" 'kostajh/irc-freenode)
  (evil-leader/set-key "ohi" 'harvest-clock-in)

  ;; IRC settings.
  (load-file "~/.spacemacs.d/.irc.el")

  ;; Use GPG2.
  (setq epg-gpg-program "gpg2")

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (sh . t)
     (sqlite . t)
     (sql . t)))

  ;; Harvest integration.
  (use-package harvest
    :load-path "~/src/harvest.el/"
    :demand t
    :bind (("C-c C-h r" . harvest-refresh-entries)
           ("C-c C-h i" . harvest-clock-in)
           ("C-c C-h o" . harvest-clock-out))
    )

  (evil-leader/set-key "oko" 'kostajh/kill-offlineimap)
  (defun kostajh/kill-offlineimap ()
    (interactive)
    (shell-command "pkill -9 -f offlineimap")
    )
  ;; mu4e integration.
  (use-package mu4e
    :defer t
    :init
    (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
    (evil-leader/set-key "om" 'mu4e)
    (require 'mu4e)
    (require 'org-mu4e)
    :config
    (setq
     mu4e-maildir       "~/mail"   ;; top-level Maildir
     mu4e-sent-folder   "/fastmail/INBOX.Sent Items"       ;; folder for sent messages
     mu4e-drafts-folder "/fastmail/INBOX.Drafts"     ;; unfinished messages
     mu4e-trash-folder  "/fastmail/INBOX.Trash"      ;; trashed messages
     mu4e-refile-folder "/fastmail/INBOX.Archive"   ;; saved messages
     mu4e-get-mail-command "offlineimap -q"
     mu4e-update-interval 300
     mu4e-compose-signature-auto-include t
     )
    (setq mu4e-user-mail-address-list (list "kosta@kostaharlan.net" "kosta@savaslabs.com" "kostajh@gmail.com" "kosta@embros.org" "kostaharlan@gmail.com"))

    (defun no-auto-fill ()
      "Turn off auto-fill-mode."
      (auto-fill-mode -1))

    (add-hook 'mu4e-compose-mode-hook #'no-auto-fill)

    (setq message-send-mail-function 'smtpmail-send-it)
    (setq smtpmail-smtp-server "mail.messagingengine.com")
    (setq smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
    (setq smtpmail-default-smtp-server "mail.messagingengine.com")
    (setq smtpmail-local-domain "kostaharlan.net")
    (setq user-full-name "Kosta Harlan")
    (setq user-mail-address "kosta@kostaharlan.net")
    (setq gnutls-algorithm-priority "NORMAL:%COMPAT")
    (setq smtpmail-stream-type 'ssl)
    (setq smtpmail-smtp-service 465)
    (setq mml2015-use 'epg)
    (setq mu4e-attachment-dir  "~/Downloads")
    (setq mu4e-maildir-shortcuts
          '( ("/fastmail/INBOX"     . ?i)
             ("/fastmail/INBOX.Archive"   . ?a)
             ("/fastmail.Sent Items"      . ?e)
             ("/savaslabs/INBOX"  . ?s)
             ))

    ;; enable inline images
    (setq mu4e-view-show-images t)
    ;; use imagemagick, if available
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
    (require 'mu4e-contrib)
    (setq mu4e-html2text-command 'mu4e-shr2text)

    (setq message-kill-buffer-on-exit t)

    (add-to-list 'mu4e-bookmarks
                 '("to:kosta@savaslabs.com"           "savas"          ?i) t)
    (defvar my-mu4e-account-alist
      '(("fastmail"
         (mu4e-sent-folder "/fastmail/INBOX.Sent Items")
         (mu4e-drafts-folder "/fastmail/INBOX.Drafts")
         (mu4e-trash-folder "/fastmail/INBOX.Trash")
         (mu4e-refile-folder "/fastmail/INBOX.Archive")
         (user-mail-address "kosta@kostaharlan.net")
         (smtpmail-default-smtp-server "mail.messagingengine.com")
         (smtpmail-local-domain "kostaharlan.net")
         (smtpmail-smtp-user "kosta@fastmail.com")
         (mu4e-compose-signature "@kostajh | kosta@kostaharlan.net")
         (smtpmail-smtp-server "mail.messagingengine.com")
         (smtpmail-stream-type ssl)
         (smtpmail-smtp-service 465))
        ("savaslabs"
         (mu4e-sent-folder "/savaslabs/[Gmail].Sent Mail")
         (mu4e-drafts-folder "/savaslabs/[Gmail].Drafts")
         (mu4e-trash-folder "/savaslabs/[Gmail].Trash")
         (mu4e-refile-folder "/savaslabs/[Gmail].All Mail")
         (user-mail-address "kosta@savaslabs.com")
         (smtpmail-default-smtp-server "smtp.gmail.com")
         (smtpmail-local-domain "savaslabs.com")
         (smtpmail-smtp-user "kosta@savaslabs.com")
         (smtpmail-smtp-server "smtp.gmail.com")
         (smtpmail-stream-type starttls)
         (mu4e-compose-signature "Kosta Harlan\nDirector of Technology\nhttp://savaslabs.com")
         (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
         (user-mail-address "kosta@savaslabs.com")
         (user-full-name "Kosta Harlan")
         (smtpmail-smtp-service 587))))

    (defun my-mu4e-set-account ()
      "Set the account for composing a message."
      (let* ((account
              (if mu4e-compose-parent-message
                  (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                    (string-match "/\\(.*?\\)/" maildir)
                    (match-string 1 maildir))
                (completing-read (format "Compose with account: (%s) "
                                         (mapconcat #'(lambda (var) (car var))
                                                    my-mu4e-account-alist "/"))
                                 (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                                 nil t nil nil (caar my-mu4e-account-alist))))
             (account-vars (cdr (assoc account my-mu4e-account-alist))))
        (if account-vars
            (mapc #'(lambda (var)
                      (set (car var) (cadr var)))
                  account-vars)
          (error "No email account found"))))

    (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account 'company-mode-on)
    )

(add-hook 'php-mode-hook
          (lambda ()
                          (defvar company-backends)
                          (defvar company-semantic-modes)
                          (set (make-local-variable 'company-backends)
                               '((company-keywords company-semantic php-extras-company company-gtags company-dabbrev-code company-files company-capf company-yasnippet)))
                          (add-to-list 'company-semantic-modes 'php-mode)
                          (add-hook 'php-mode-hook #'semantic-mode)
                          (flycheck-mode-on-safe)
                          (setq flycheck-phpcs-standard "PSR2")
                          (setq flycheck-phpmd-rulesets '("codesize" "controversial" "design" "naming" "unusedcode"))))

(use-package semantic-php
  :load-path "~/src/jorissteyn-semantic-php/"
  :init (load "~/src/jorissteyn-semantic-php/loaddefs.el")
  :config (add-hook 'php-mode-hook #'semantic-mode))

(use-package ede-php-autoload-mode
  :load-path "~/src/ede-php-autoload/"
  :init (progn
          (add-hook 'php-mode-hook #'ede-php-autoload-mode)))

(setq erc-track-exclude-types '("NICK" "333" "353" "MODE"))

(use-package feature-mode
  :mode (("\\.feature\\'" . feature-mode)))

;; Pull up todo.org and load the agenda.
(find-file "~/org/todo.org")
(org-agenda nil "a")

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(org-scheduled-today ((t (:foreground "#bc6ec5" :weight bold :height 1.0))))
 '(variable-pitch ((t nil))))