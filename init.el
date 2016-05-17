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
     ansible
     ruby
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     kostajh
     (ivy :variables
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
     git
     prodigy
     markdown
     (elfeed :variables rmh-elfeed-org-files (list "~/.spacemacs.d/feeds.org"))
     (twitter :variables
              twittering-use-master-password t)
     (gtags :variables
            helm-gtags-auto-update nil)
     github
     dash
     spotify
     pandoc
     (mu4e :variables
           mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu4e"
           mu4e-compose-signature-auto-include t
           mu4e-user-mail-address-list (list "kosta@kostaharlan.net" "kosta@savaslabs.com" "kostajh@gmail.com" "kosta@embros.org" "kostaharlan@gmail.com" "kosta@durhamatletico.com")
           message-send-mail-function 'smtpmail-send-it
           epg-gpg-program "gpg"
           smtpmail-auth-credentials (expand-file-name "~/.authinfo")
           user-full-name "Kosta Harlan"
           gnutls-algorithm-priority "NORMAL:%COMPAT"
           smtpmail-stream-type 'ssl
           smtpmail-smtp-service 465
           mml2015-use 'epg
           mu4e-attachment-dir  "~/Downloads"
           mu4e-maildir-shortcuts
           '( ("/INBOX"     . ?i)
              ("/Archive"   . ?a)
              ("/Sent Items"      . ?e)
              )
           mu4e-view-show-images t
           mu4e-bookmarks `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
                            ("to:kosta@savaslabs.com AND NOT flag:trashed" "Savas" ?s)
                            ("to:kosta@kostaharlan.net OR to:kostajh@gmail.com OR to:kosta.harlan@gmail.com OR to:kosta@harlan.mayfirst.org OR to:kosta@embros.org AND NOT flag:trashed" "Personal" ?i))
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
                                   "~/org/todo.org_archive"
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
                                      org-redmine
                                      org-gcal
                                      dumb-jump
                                      (harvest
                                       :location "~/src/harvest.el")
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
                         leuven
                         solarized-dark
                         solarized-light
                         majapahit-light
                         majapahit-dark
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 33
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (load-file "~/.spacemacs.d/.credentials.el")
  (kostajh/set-slack-credentials)

  (global-set-key (kbd "<f12>") (lambda () (interactive) (org-capture nil "t")))

  ;; Refresh Harvest.
  (use-package harvest
    :load-path "~/src/harvest.el")
  (harvest-refresh-entries)

  (setq org-agenda-exporter-settings
        '((ps-number-of-columns 4)
          (ps-landscape-mode t)
          (org-agenda-add-entry-text-maxlines 5)
          (htmlize-output-type 'css)))

  ;; org-present
  (eval-after-load "org-present"
    '(progn
       (add-hook 'org-present-mode-hook
                 (lambda ()
                   (org-present-big)
                   (visual-line-mode)
                   (org-display-inline-images)
                   (org-present-hide-cursor)
                   (org-present-read-only)))
       (add-hook 'org-present-mode-quit-hook
                 (lambda ()
                   (org-present-small)
                   (org-remove-inline-images)
                   (org-present-show-cursor)
                   (org-present-read-write)))))

  ;; Mu4e contexts
  (use-package mu4e
    :config
    (setq mu4e-contexts
          `( ,(make-mu4e-context
               :name "fastmail"
               :enter-func (lambda () (mu4e-message "Switch to the Personal context")
                             )
               :leave-func (lambda () (mu4e-clear-caches))
               :match-func (lambda (_) (string-equal "home" (mu4e-context-name mu4e~context-current)))
               :vars '((user-mail-address	. "kosta@kostaharlan.net")
                       (mu4e-maildir . "~/.maildir-home")
                       (mu4e-sent-folder . "/Sent Items")
                       (mu4e-drafts-folder . "/Drafts")
                       (mu4e-get-mail-command . "mbsync fastmail")
                       (mu4e-trash-folder . "/Trash")
                       (mu4e-refile-folder . "/Archive")
                       (user-mail-address . "kosta@kostaharlan.net")
                       (smtpmail-default-smtp-server . "mail.messagingengine.com")
                       (smtpmail-local-domain . "kostaharlan.net")
                       (smtpmail-smtp-user . "kosta@fastmail.com")
                       (mu4e-compose-signature . "@kostajh | kosta@kostaharlan.net")
                       (mu4e-mu-home . "~/.mu-home")
                       (smtpmail-smtp-server . "mail.messagingengine.com")
                       (smtpmail-stream-type . ssl)
                       (smtpmail-smtp-service . 465)
                       ))
             ,(make-mu4e-context
               :name "savaslabs"
               :enter-func (lambda () (mu4e-message "Switch to the Work context")
                             )
               :leave-func (lambda () (mu4e-clear-caches))
               :match-func (lambda (_) (string-equal "work" (mu4e-context-name mu4e~context-current)))
               :vars '((user-mail-address . "kosta@savaslabs.com" )
                       (mu4e-get-mail-command . "mbsync gmail")
                       (mu4e-maildir . "~/.maildir-work")
                       (mu4e-sent-folder . "/[Gmail].SentMail")
                       (mu4e-drafts-folder . "/[Gmail].Drafts")
                       (mu4e-trash-folder . "/[Gmail].Trash")
                       (mu4e-refile-folder . "/[Gmail].AllMail")
                       (user-mail-address . "kosta@savaslabs.com")
                       (smtpmail-default-smtp-server . "smtp.gmail.com")
                       (smtpmail-local-domain . "savaslabs.com")
                       (smtpmail-smtp-user . "kosta@savaslabs.com")
                       (mu4e-mu-home . "~/.mu-work")
                       (smtpmail-smtp-server . "smtp.gmail.com")
                       (smtpmail-stream-type . starttls)
                       (mu4e-compose-signature . "Kosta Harlan\nDirector of Technology\nhttp://savaslabs.com")
                       (smtpmail-starttls-credentials . '(("smtp.gmail.com" 587 nil nil)))
                       (user-mail-address . "kosta@savaslabs.com")
                       (user-full-name . "Kosta Harlan")
                       (smtpmail-smtp-service . 587)
                       )))))

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
          ("d" "Daily standup"
           (agenda)
           ((ps-number-of-columns 2)
            (ps-landscape-mode t)
            (org-agenda-prefix-format " [ ] ")
            (org-agenda-with-colors nil)
            (org-agenda-remove-tags t))
           ("~/org/export/daily.txt"))
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

  (defun kostajh/drupalvm ()
    (interactive)
    (cd "~/src/drupal-vm")
    (vagrant-reload))

  (spacemacs/set-leader-keys
    "ovd" 'kostajh/drupalvm)

  (spacemacs/set-leader-keys
    "ot" 'kostajh/gtd)

  (use-package org-gcal
    :defer t
    :init (require 'org-gcal)
    :config
    (spacemacs/set-leader-keys
      "ocf" 'org-gcal-fetch)
    (load-file "~/.spacemacs.d/.credentials.el")
    ;; (kostajh/set-org-gcal-credentials)
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
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "5f8f1e226274b73f6e706431399a597dbfd64db34f3fba56a6ccf57d148a0e01" "78f614a58e085bd7b33809e98b6f1a5cdd38dae6257e48176ce21424ee89d058" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "3a5f04a517096b08b08ef39db6d12bd55c04ed3d43b344cf8bd855bde6d3a1ae" "5a21604c4b1f2df98e67cda2347b8f42dc9ce471a48164fcb8d3d52c3a0d10be" "70b9c3d480948a3d007978b29e31d6ab9d7e259105d558c41f8b9532c13219aa" "4ce035b661aee2ea47dbb2f368b8e573346054c04d61c45363e4cb12bc2bdffa" "df87edcf41dbdb2c5d49d53acdfc9d5c2087ef7259679ac50923f97e0b24fdfe" "2305decca2d6ea63a408edd4701edf5f4f5e19312114c9d1e1d5ffe3112cde58" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a985799595034bd95cd74ed968d15f93a1145ed81ffcf0537401ec7dd6ebed4f" "708df3cbb25425ccbf077a6e6f014dc3588faba968c90b74097d11177b711ad1" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "d4e9f95acd51433b776f1127143bbc7d0f1d41112d547e5b7a9a506be369dc39" "5b29f90eb304b440c908de31caf7d730db451b5909e8a84a2e7cd8d60f6d5c1f" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "341a1f149c8ab55893e5a065e96235e43ee9f82423f4c018bf31a430e1dc1b0f" "3a53f98f4354d66ffaec1edce1bc54a3c622c8a73a583e90fde456b311b889f2" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "48373328e7ead33ed0161ad096c688376f65a617c3fcafd62dbfe814fff12a1e" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "b7b2cd8c45e18e28a14145573e84320795f5385895132a646ff779a141bbda7e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "6ecd762f08fd5c3aab65585d5aa04f6ae8b44d969df4be669259975dac849687" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" default)))
 '(evil-disable-insert-state-bindings t)
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-phpcs-standard "Drupal")
 '(magit-diff-use-overlays nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (flyspell-correct atom-one-dark-theme jinja2-mode ansible-doc ansible ivy slack emojify circe oauth2 websocket elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed wgrep uuidgen twittering-mode smex rase rake pdf-tools tablist org-download mu4e-alert livid-mode skewer-mode simple-httpd live-py-mode link-hint eyebrowse evil-visual-mark-mode evil-ediff goto-chg undo-tree eshell-z diminish counsel swiper company-shell column-enforce-mode zonokai-theme zenburn-theme zen-and-art-theme zeal-at-point yaml-mode xterm-color ws-butler window-numbering web-mode web-beautify volatile-highlights vi-tilde-fringe vagrant-tramp vagrant underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org theme-changer tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunshine sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance stekene-theme srefactor sql-indent spotify spacemacs-theme spaceline powerline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restclient restart-emacs rbenv ranger rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-yapf purple-haze-theme professional-theme prodigy popwin planet-theme pip-requirements phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox spinner pandoc-mode hydra page-break-lines ox-pandoc ht osx-location orgit organic-green-theme org-redmine org-present org-pomodoro org-plus-contrib org-gcal alert request-deferred deferred log4e gntp org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-http noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode ledger-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-spotify multi helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gtags helm-gitignore request helm-flyspell helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gmail-message-mode ham-mode markdown-mode html-to-markdown gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh logito pcache gh-md ggtags gandalf-theme flycheck-pos-tip flycheck-ledger flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight espresso-theme eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emoji-cheat-sheet-plus emmet-mode emacs-phan elisp-slime-nav edit-server dumb-jump drupal-mode php-mode dracula-theme dockerfile-mode django-theme diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-emoji company-anaconda company colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler inf-ruby buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f s ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil solarized-theme dash)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval ispell-change-dictionary "en_US")
     (eval when
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
            default-directory))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(slack-message-output-text ((t (:weight normal :height 1.0))))
 '(variable-pitch ((t (:family "Fira Mono")))))
