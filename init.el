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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; (default t)
   dotspacemacs-enable-lazy-installation t
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ruby
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     kostajh
     (spacemacs-ivy :variables
                    ivy-initial-inputs-alist nil)
     auto-completion
     finance
     dockerfile
     slack
     better-defaults
     pdf-tools
     themes-megapack
     (erc :variables
          erc-join-buffer 'bury
          erc-track-exclude-types '("NICK" "333" "353" "MODE" "JOIN" "PART")
          erc-hide-list '("JOIN" "PART" "QUIT" "NICK" "MODE")
          erc-fools '("SLACK" "omega-deployments" "redmine"))
     emacs-lisp
     (ranger :variables
             ranger-show-preview t)
     (git :variables
          git-magit-status-fullscreen t
          magit-status-buffer-switch-function 'switch-to-buffer)
     prodigy
     markdown
     twitter
     (gtags :variables
            helm-gtags-auto-update nil)
     github
     dash
     spotify
     pandoc
     (mu4e :variables
           mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu4e"
           mu4e-maildir       "~/mail"   ;; top-level Maildir
           mu4e-sent-folder   "/fastmail/INBOX.Sent Items"       ;; folder for sent messages
           mu4e-drafts-folder "/fastmail/INBOX.Drafts"     ;; unfinished messages
           mu4e-trash-folder  "/fastmail/INBOX.Trash"      ;; trashed messages
           mu4e-refile-folder "/fastmail/INBOX.Archive"   ;; saved messages
           mu4e-get-mail-command "offlineimap -q"
           mu4e-update-interval 300
           mu4e-compose-signature-auto-include t
           mu4e-user-mail-address-list (list "kosta@kostaharlan.net" "kosta@savaslabs.com" "kostajh@gmail.com" "kosta@embros.org" "kostaharlan@gmail.com" "kosta@durhamatletico.com")
           message-send-mail-function 'smtpmail-send-it
           smtpmail-smtp-server "mail.messagingengine.com"
           epg-gpg-program "gpg"
           smtpmail-auth-credentials (expand-file-name "~/.authinfo")
           smtpmail-default-smtp-server "mail.messagingengine.com"
           smtpmail-local-domain "kostaharlan.net"
           user-full-name "Kosta Harlan"
           user-mail-address "kosta@kostaharlan.net"
           gnutls-algorithm-priority "NORMAL:%COMPAT"
           smtpmail-stream-type 'ssl
           smtpmail-smtp-service 465
           mml2015-use 'epg
           mu4e-attachment-dir  "~/Downloads"
           mu4e-maildir-shortcuts
           '( ("/fastmail/INBOX"     . ?i)
              ("/fastmail/INBOX.Archive"   . ?a)
              ("/fastmail.Sent Items"      . ?e)
              ("/savaslabs/INBOX"  . ?s)
              )
           mu4e-view-show-images t
           mu4e-bookmarks `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
                            ("to:kosta@savaslabs.com AND NOT flag:trashed" "Savas" ?s)
                            ("to:kosta@kostaharlan.net OR to:kostajh@gmail.com OR to:kosta.harlan@gmail.com OR to:kosta@harlan.mayfirst.org OR to:kosta@embros.org AND NOT flag:trashed" "Personal" ?i))
           mu4e-account-alist
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
              (smtpmail-smtp-service 587)))
           (mu4e/mail-account-reset)
           )
     sql
     python
     yaml
     restclient
     semantic
     html
     (chrome :variables
             edit-server-url-major-mode-alist
             '(("github\\.com" . org-mode)
               ("pm\\.savaslabs\\.com" . markdown-mode)))
     javascript
     shell-scripts
     (geolocation :variables
                  geolocation-enable-weather-forecast t
                  geolocation-enable-location-service t
                  )
     emoji
     vagrant
     (org :variables
          org-babel-confirm-evaluate nil
          org-export-babel-evaluate nil
          org-confirm-babel-evaluate nil
          org-enable-github-support t
          org-imenu-depth 8
          org-startup-folded (quote "showeverything")
          org-directory "~/org"
          org-agenda-skip-scheduled-if-done t
          org-agenda-include-diary t
          org-agenda-sticky t
          org-clock-persist 'history
          org-outline-path-complete-in-steps nil
          org-refile-use-outline-path 'file
          org-refile-targets '((org-agenda-files :maxlevel . 4))
          org-default-notes-file (concat org-directory "/notes.org")
          org-capture-templates
          '(("t" "Task" entry (file+headline "~/org/notes.org" "Tasks")
             "** TODO %?\n  %u\n  %a")
            ("m" "Meeting" entry (file+headline "~/org/notes.org" "Meetings")
             "** MEETING %?\n %u\n %a %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"today\"))")
            ("j" "Journal" entry (file+datetree "~/org/journal.org")
             "** %?\nEntered on %U\n  %i\n  %a")
            ("P" "pull-request-review" entry (file+headline "~/org/notes.org" "Pull Requests")
             "** TODO %a %? :pr:\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))")
            ("p" "process-soon" entry (file+headline "~/org/todo.org" "Email")
             "** TODO %a %?\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+2d\"))")
            ("w" "wait-for-reply" entry (file+headline "~/org/todo.org" "Email")
             "** WAIT %u %a %?\n")
            ("r" "redmine-issue" entry (file+headline "~/org/notes.org" "Redmine Issue")
             "** TODO %a %?\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+2d\"))")
            )
          org-todo-state-tags-triggers (quote (("CANCELLED" ("CANCELLED" . t))
                                               ("WAITING" ("WAITING" . t))
                                               ("DELEGATED" ("DELEGATED" . t))
                                               ("HOLD" ("WAITING") ("HOLD" . t))
                                               (done ("WAITING") ("HOLD"))
                                               ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                                               ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                                               ("LOGGED" ("DONE") ("WAITING") ("HOLD") ("CANCELLED"))
                                               ("DONE" ("WAITING") ("CANCELLED") ("HOLD"))))
          org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "LOGGED(l)" "CANCELLED(c@/!)") (sequence "WAITING(w@/!)" "HOLD(h@/!)" "PHONE" "MEETING" "APPOINTMENT")))
          org-agenda-files (quote ("~/org/todo.org"
                                   "~/org/appts.org"
                                   "~/org/notes.org"
                                   )))
     php
     (shell :variables
            shell-default-shell 'eshell
            shell-enable-smart-eshell t
            shell-defaul-term-shell "/bin/fish"
            shell-default-height 40
            shell-default-position 'bottom)
     (spell-checking
      :variables spell-checking-enable-by-default t)
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      feature-mode
                                      ob-http
                                      org-redmine
                                      org-gcal
                                      dumb-jump
                                      (emacs-phan
                                       :location (recipe :fetcher github :repo "stevenremot/emacs-phan")
                                       :variables
                                       phan-program-location "~/.composer/vendor/bin/phan"))
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(org-repo-todo evil-jumper mu4e-maildirs-extension)
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
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(agenda todos)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 0
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         solarized-dark
                         solarized-light
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 15
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
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
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
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
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
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup "changed"
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq slack-enable-emoji t)
  (load-file "~/.spacemacs.d/.credentials.el")
  (kostajh/set-slack-credentials)
  (setq slack-room-subscription '(general slackbot))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; Refresh Harvest.
  (harvest-refresh-entries)

  (prodigy-define-service
    :name "Drupal VM"
    :tags '(vagrant)
    :command "~/src/dotfiles/waiting-vagrant.sh"
    :cwd "~/src/drupal-vm"
    :ready-message "Machine booted and ready!"
    :stop-signal 1
    )

  (prodigy-define-service
    :name "Omega VM"
    :tags '(vagrant)
    :command "~/src/dotfiles/waiting-vagrant.sh"
    :cwd "~/src/omega"
    :ready-message "Machine booted and ready!"
    :stop-signal 1
    )

    (setq org-agenda-custom-commands
        '(("t" "Today" tags "today"
           ((org-agenda-files '("~/org/todo.org" "~/org/appts.org" "~/org/notes.org")))
            (org-agenda-sorting-strategy '(todo-state-up priority-up effort-down))
           ("~/org/export/today.html"))
          ("w" "This week" tags "thisweek"
            ((org-agenda-files '("~/org/todo.org" "~/org/appts.org" "~/org/notes.org"))
             (org-agenda-sorting-strategy '(todo-state-up priority-up effort-down)))
            ("~/org/export/thisweek.html"))
          ("n" "Next week" tags "nextweek"
           ((org-agenda-files '("~/org/todo.org" "~/org/appts.org" "~/org/notes.org"))
            (org-agenda-sorting-strategy '(todo-state-up priority-up effort-down)))
           ("~/org/export/thisweek.html"))
          ("o" "Omega" tags "omega"
           ((org-agenda-files '("~/org/todo.org" "~/org/notes.org"))
            (org-agenda-sorting-strategy '(todo-state-up priority-up effort-down)))
           ("~/org/export/omega.html"))
          ))

  (setq calendar-location-name "Durham, United States"
        calendar-latitude 35.9886
        calendar-longitude 78.9072)

  (setq alert-default-style 'libnotify)

  ;; Keybindings.
  (evil-leader/set-key "og" 'org-agenda)
  (evil-leader/set-key "oa" 'org-agenda-list)

  (add-hook 'org-mode 'visual-line-mode)

  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  (add-hook 'slack-mode 'evil-insert-state)
  (add-hook 'term-mode 'evil-insert-state)
  (add-hook 'shell-mode 'evil-insert-state)
  (add-hook 'message-mode 'evil-insert-state)
  (add-hook 'mu4e-compose-mode 'evil-insert-state)

  (setq evil-move-cursor-back nil)

  (spacemacs/toggle-mode-line-org-clock-on)
  (spacemacs/toggle-mode-line-battery-on)

  ;; Layouts.
  (spacemacs|define-custom-layout "@DrupalVM"
    :binding "v"
    :body
    (find-file "~/src/drupal-vm/README.md")
    )

  (spacemacs|define-custom-layout "@Mail"
    :binding "m"
    :body
    (mu4e)
    )

  (add-hook 'drupal-mode #'(lambda ()
                             (setq flycheck-phpcs-standard "Drupal")
                             (setq phpcbf-standard "Drupal")))

  (spacemacs|define-custom-layout "@IRC"
    :binding "i"
    :body
    (kostajh/irc-freenode))

  (spacemacs|define-custom-layout "@Twitter"
    :binding "t"
    :body
    (twit))

  (spacemacs|define-custom-layout "@Deft"
    :binding "D"
    :body
    (deft)
    )

  ;; IRC settings.
  (load-file "~/.spacemacs.d/.irc.el")

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (sh . t)
     (sqlite . t)
     (sql . t)))


  (evil-leader/set-key "oko" 'kostajh/kill-offlineimap)
  (defun kostajh/kill-offlineimap ()
    (interactive)
    (shell-command "pkill -9 -f offlineimap")
    )

  (use-package org-redmine
    :ensure t
    :config
    (setq org-redmine-uri "https://pm.savaslabs.com/"
          org-redmine-auth-netrc-use t
          org-redmine-limit 99
          org-redmine-template-header "TODO #%i% %s%"
          org-redmine-template-property
          '(("assigned_to" . "%as_n%")
            ("version" . "%v_n%")))
    (spacemacs/set-leader-keys
      "ori" 'org-redmine-get-issue
      "ora" 'org-redmine-anything-show-issue-all))

  ;; mu4e integration.
  (use-package mu4e
    :defer t
    :init
    (require 'mu4e)
    (require 'org-mu4e)
    :config
    (evilified-state-evilify-map
      mu4e-headers-mode-map
      :mode mu4e-headers-mode
      :bindings "J" 'mu4e~headers-jump-to-maildir)
    (defun no-auto-fill ()
      "Turn off auto-fill-mode."
      (auto-fill-mode -1))

    (add-hook 'mu4e-compose-mode-hook #'no-auto-fill)
    (add-hook 'mu4e-compose-mode-hook 'company-mode-on)

    ;;   ;; use imagemagick, if available
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
    (require 'mu4e-contrib)
    (setq mu4e-html2text-command 'mu4e-shr2text)
    (setq message-kill-buffer-on-exit t)
    )

  (defun kostajh/gtd ()
    (interactive)
    (find-file "~/org/todo.org"))

  (spacemacs/set-leader-keys
    "ot" 'kostajh/gtd)

  (use-package org-gcal
    :defer t
    :init (require 'org-gcal)
    :config
    (spacemacs/set-leader-keys
      "ocf" 'org-gcal-fetch)
    (load-file "~/.spacemacs.d/.credentials.el")
    (kostajh/set-org-gcal-credentials)
    )

  (setq-default evil-escape-key-sequence "fd")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("df87edcf41dbdb2c5d49d53acdfc9d5c2087ef7259679ac50923f97e0b24fdfe" "2305decca2d6ea63a408edd4701edf5f4f5e19312114c9d1e1d5ffe3112cde58" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a985799595034bd95cd74ed968d15f93a1145ed81ffcf0537401ec7dd6ebed4f" "708df3cbb25425ccbf077a6e6f014dc3588faba968c90b74097d11177b711ad1" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "d4e9f95acd51433b776f1127143bbc7d0f1d41112d547e5b7a9a506be369dc39" "5b29f90eb304b440c908de31caf7d730db451b5909e8a84a2e7cd8d60f6d5c1f" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "341a1f149c8ab55893e5a065e96235e43ee9f82423f4c018bf31a430e1dc1b0f" "3a53f98f4354d66ffaec1edce1bc54a3c622c8a73a583e90fde456b311b889f2" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "48373328e7ead33ed0161ad096c688376f65a617c3fcafd62dbfe814fff12a1e" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "b7b2cd8c45e18e28a14145573e84320795f5385895132a646ff779a141bbda7e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "6ecd762f08fd5c3aab65585d5aa04f6ae8b44d969df4be669259975dac849687" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" default)))
 '(evil-disable-insert-state-bindings t)
 '(flycheck-phpcs-standard "Drupal")
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (emacs-lisp-mode)
           (when
               (fboundp
                (quote flycheck-mode))
             (flycheck-mode -1))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons ".." load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory)))))
 '(solarized-use-variable-pitch t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(slack-message-output-text ((t (:weight normal :height 1.0))))
 '(variable-pitch ((t nil))))
