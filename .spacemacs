;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; To solve:
   ;;     Found 3 orphan package(s) to delete... --> deleting doom-modeline... [3/3]
   ;; See https://emacs.stackexchange.com/questions/58566/how-to-use-doom-modeline-in-spacemacs
   dotspacemacs-mode-line-theme '(doom :separator-scale 1.5)
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     python
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
     ;; better-defaults
     ;; emacs-lisp
     ;; git
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control

     ;; user added:
     (theming :variables
              theming-headings-same-size 'all)

     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      evil-leader
                                      doom-modeline
                                      doom-themes
                                      ivy-posframe
                                      imenu-list
                                      phi-rectangle
                                      vimrc-mode
                                      yaml-mode
                                      edit-indirect
                                      json-mode
                                      org-elp
                                      org-fragtog
                                      ;; fcitx
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-ediff
                                    string-edit
                                    atom-dark-theme
                                    ;; column-enforce-mode
                                    ;; highlight-indentation
                                    ;; indent-guide
                                    ;; fill-column-indicator
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Sarasa Fixed SC"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; ___________________________________________________________________________
  ;; set elpa source.
  ;; (setq configuration-layer-elpa-archives
  ;;   '(("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
  ;;     ("org-cn"   . "http://mirrors.cloud.tencent.com/elpa/org/")
  ;;     ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")))
  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

  ;; ___________________________________________________________________________
  ;; To Fix:
  ;;    Make sure to set `evil-want-keybinding' to nil before loading evil or evil-collection.
  ;;    See https://github.com/emacs-evil/evil-collection/issues/60 for more details. Disable showing Disable logging
  ;; 此解决方法参考: https://github.com/emacs-evil/evil-collection/issues/215
  (require 'package)

  (setq package-enable-at-startup nil)

  ;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

  ;; bootstrap use-package
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (require 'use-package)

  (use-package evil
    :ensure t
    :init
    (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
    (setq evil-want-keybinding nil)
    :config
    (evil-mode 1))

  (use-package evil-leader
    :ensure t
    :init
    (setq evil-want-keybinding nil)
    (global-evil-leader-mode))

  (use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init))

  ;; ___________________________________________________________________________
  (setq default-directory "~/onedrive/code-snippets/")
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; _________________________ mode-line related _______________________________
  ;; (setq powerline-default-separator 'slant)
  ;; (setq powerline-height 27)
  ;; (set-face-attribute 'mode-line nil  :height 125) ;; :fontsizes 200)
  ;; (set-face-attribute 'mode-line-buffer-id nil :height 125) ;;  :fontsizes 200)

  ;; ___________________________________________________________________________
  ;; to solve the problem that ivy-switch-buffer can not distinguish same filename. not tested.
  ;; (require 'uniquify)
  ;; (setq uniquify-buffer-name-style 'forward)

  ;; ____________________________ key-bindings _________________________________
  (global-unset-key (kbd "C-SPC"))
  (global-set-key (kbd "<f7>") 'ivy-switch-buffer)
  (global-set-key (kbd "<C-tab>") 'next-buffer)
  (with-eval-after-load 'evil
    (define-key evil-motion-state-map (kbd "g l") 'evil-end-of-line)
    (define-key evil-motion-state-map (kbd "g h") 'evil-beginning-of-line)
    ;; (define-key evil-motion-state-map (kbd "<C-tab>") 'evil-next-buffer)
    )
  ;; ________________________________ setq _____________________________________
  (setq org-edit-src-content-indentation 0)  ;; 代码块中，相对于 "#+begin_..." 的缩进量，默认是 2，这里设置为 0，不缩进；
  (setq org-list-indent-offset 2) ;; 各级列表的偏移缩进量。默认是 0，这里设置为 2，使得各级列表最终缩进量是 4（注：emacs 各级列表基本缩进量是 2，最终缩进量是：基本缩进量 + 偏移缩进量）；

  (custom-set-faces '(markdown-code-face ((t (:family "Sarasa Fixed SC")))))

  (setq org-latex-create-formula-image-program 'dvisvgm)
  (setq org-preview-latex-image-directory "~/cache/latex-image/")
  ;; ____________________________
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode nil)
  ;; ____________________________
  (setq-default scroll-margin 12)
  ;; ____________________________
  (setq org-descriptive-links nil)
  ;; ____________________________
  (setq default-input-method "TeX")
  ;; ____________________________
  ;; (setq org-image-actual-width '(500))

  ;; ____________________________ evil-normal 自动切换到英文输入法, 详见: https://github.com/cute-jumper/fcitx.el
  ;; Make sure the following comes before `(fcitx-aggressive-setup)'
  ;; (setq fcitx-active-evil-states '(insert emacs hybrid)) ; if you use hybrid mode
  ;; (fcitx-aggressive-setup)
  ;; (fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
  ;; ;; (setq fcitx-use-dbus t) ; uncomment if you're using Linux

  ;; ____________________________ use-package __________________________________
  ;; (and
  ;;  (require 'centered-cursor-mode)
  ;;  (global-centered-cursor-mode +1))
  ;; ____________________________
  (use-package doom-modeline
    :ensure t
    :config
    (doom-modeline-mode 1)
    (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
    ;; How tall the mode-line should be (only respected in GUI Emacs).
    (setq doom-modeline-height 25)
    ;; How wide the mode-line bar should be (only respected in GUI Emacs).
    (setq doom-modeline-bar-width 3)
    ;; Whether display icons in mode-line or not.
    (setq doom-modeline-icon t)
    ;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
    (setq doom-modeline-major-mode-icon t)
    ;; Whether display color icons for `major-mode'. It respects
    ;; `doom-modeline-icon' and `all-the-icons-color-icons'.
    (setq doom-modeline-major-mode-color-icon t)
    ;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
    (setq doom-modeline-buffer-state-icon t)
    ;; Whether display buffer modification icon. It respects `doom-modeline-icon'
    ;; and `doom-modeline-buffer-state-icon'.
    (setq doom-modeline-buffer-modification-icon t)
    ;; Whether display minor modes in mode-line or not.
    (setq doom-modeline-minor-modes nil)
    ;; :hook (after-init . doom-modeline-mode)
    )
  ;; ____________________________
  (use-package vimrc-mode
    :ensure t)
  (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))
  ;; ____________________________
  (use-package json-mode
    :ensure t)
  ;; ____________________________
  ;; (use-package fcitx
  ;;   :ensure t)
  ;; ____________________________ M-x package-install to install. don't know how diff with use-package.
  ;; (use-package edit-indirect :ensure t)
  ;; ____________________________
  (use-package yaml-mode :ensure t)
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  ;; ____________________________ See: https://github.com/zk-phi/phi-rectangle
  (use-package phi-rectangle :ensure t)
  ;; ____________________________ See: https://github.com/guanyilun/org-elp
  (use-package org-elp
    :config
    (setq org-elp-idle-time 0.5
          org-elp-split-fraction 0.25))
  ;; ____________________________ See: https://github.com/zk-phi/phi-rectangle
  (use-package org-fragtog
    :ensure t
    :config
    (add-hook 'org-mode-hook 'org-fragtog-mode))
  ;; ____________________________ Hard to Use.
  ;; (use-package vimish-fold
  ;;   :ensure
  ;;   :after evil)
  ;; (use-package evil-vimish-fold
  ;;   :ensure
  ;;   :after vimish-fold
  ;;   :hook ((prog-mode conf-mode text-mode) . evil-vimish-fold-mode))
  ;; ;; ____________________________ all-the-icons
  ;; (use-package all-the-icons
  ;;   :if (display-graphic-p))
  ;; ____________________________
  (use-package ivy-posframe
    :ensure t
    :config
    (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
    (ivy-posframe-mode 1)
    )
  ;; ____________________________
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))
  ;; ____________________________ See https://github.com/bmag/imenu-list
  (use-package imenu-list
    :ensure t
    :bind (("C-\"" . imenu-list-smart-toggle))
    :bind (("<S-return>" . imenu-list-display-entry))
    :config
    (setq imenu-list-focus-after-activation t
          imenu-list-auto-resize nil
          imenu-list-position 'left
          imenu-list-size 0.2))
  ;; ________________________
  ;; (use-package awesome-tab
  ;;   ;; :ensure t
  ;;   :load-path "/home/frank/.spacemacs.d/files-to-load/"
  ;;   :config
  ;;   (awesome-tab-mode t))
  ;; (setq awesome-tab-label-fixed-length 10)
  ;; (setq awesome-tab-height 150)

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yapfify winum volatile-highlights vimrc-mode vi-tilde-fringe uuidgen tagedit spaceline powerline smex slim-mode scss-mode restart-emacs pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements phi-rectangle persp-mode paradox spinner org-projectile org-category-capture org-pomodoro alert log4e gntp org-plus-contrib org-fragtog org-elp org-download org-bullets open-junk-file neotree move-text markdown-toc lorem-ipsum live-py-mode linum-relative link-hint indent-guide imenu-list hy-mode hungry-delete hl-todo highlight-numbers parent-mode highlight-indentation helm-make google-translate golden-ratio gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-mc evil-iedit-state iedit evil-escape goto-chg eval-sexp-fu emmet-mode dumb-jump doom-themes doom-modeline shrink-path compat define-word cython-mode counsel-projectile company-web web-completion-data company-anaconda column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol ht anaconda-mode pythonic f dash s ace-link ac-ispell auto-complete yasnippet yaml-mode ws-butler which-key wgrep web-mode undo-tree queue toc-org sass-mode request rainbow-delimiters projectile popup pcre2el org-present org-mime mmm-mode markdown-mode json-mode ivy-posframe posframe ivy-hydra hydra lv htmlize highlight-parentheses haml-mode gnuplot expand-region evil-visualstar evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state smartparens evil-indent-plus evil-exchange evil-args evil-anzu anzu edit-indirect diminish counsel swiper ivy company-statistics company bind-map async aggressive-indent adaptive-wrap ace-window avy evil-collection evil use-package))
 '(safe-local-variable-values
   '((org-image-actual-width quote
                             (400))
     (eval setq-local org-download-image-dir
           (concat
            (file-name-base
             (buffer-file-name))
            ".assets"))))
 '(warning-suppress-log-types
   '((use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)))
 '(warning-suppress-types
   '((use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:height 1.0))))
 '(font-latex-sectioning-1-face ((t (:height 1.0))))
 '(font-latex-sectioning-2-face ((t (:height 1.0))))
 '(font-latex-sectioning-3-face ((t (:height 1.0))))
 '(font-latex-sectioning-4-face ((t (:height 1.0))))
 '(font-latex-sectioning-5-face ((t (:height 1.0))))
 '(font-latex-slide-title-face ((t (:height 1.0))))
 '(info-title-1 ((t (:height 1.0))))
 '(info-title-2 ((t (:height 1.0))))
 '(info-title-3 ((t (:height 1.0))))
 '(info-title-4 ((t (:height 1.0))))
 '(markdown-code-face ((t (:family "Sarasa Fixed SC"))))
 '(markdown-header-face ((t (:height 1.0))))
 '(markdown-header-face-1 ((t (:height 1.0))))
 '(markdown-header-face-2 ((t (:height 1.0))))
 '(markdown-header-face-3 ((t (:height 1.0))))
 '(markdown-header-face-4 ((t (:height 1.0))))
 '(markdown-header-face-5 ((t (:height 1.0))))
 '(markdown-header-face-6 ((t (:height 1.0))))
 '(org-document-title ((t (:height 1.0))))
 '(org-level-1 ((t (:height 1.0))))
 '(org-level-2 ((t (:height 1.0))))
 '(org-level-3 ((t (:height 1.0))))
 '(org-level-4 ((t (:height 1.0))))
 '(org-level-5 ((t (:height 1.0))))
 '(org-level-6 ((t (:height 1.0))))
 '(org-level-7 ((t (:height 1.0))))
 '(org-level-8 ((t (:height 1.0)))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yapfify winum volatile-highlights vimrc-mode vi-tilde-fringe uuidgen tagedit spaceline powerline smex slim-mode scss-mode restart-emacs pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements phi-rectangle persp-mode paradox spinner org-projectile org-category-capture org-pomodoro alert log4e gntp org-plus-contrib org-fragtog org-elp org-download org-bullets open-junk-file neotree move-text markdown-toc lorem-ipsum live-py-mode linum-relative link-hint indent-guide imenu-list hy-mode hungry-delete hl-todo highlight-numbers parent-mode highlight-indentation helm-make google-translate golden-ratio gh-md fuzzy flx-ido flx fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-mc evil-iedit-state iedit evil-escape goto-chg eval-sexp-fu emmet-mode dumb-jump doom-themes doom-modeline shrink-path compat define-word cython-mode counsel-projectile company-web web-completion-data company-anaconda column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol ht anaconda-mode pythonic f dash s ace-link ac-ispell auto-complete yasnippet yaml-mode ws-butler which-key wgrep web-mode undo-tree queue toc-org sass-mode request rainbow-delimiters projectile popup pcre2el org-present org-mime mmm-mode markdown-mode json-mode ivy-posframe posframe ivy-hydra hydra lv htmlize highlight-parentheses haml-mode gnuplot expand-region evil-visualstar evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state smartparens evil-indent-plus evil-exchange evil-args evil-anzu anzu edit-indirect diminish counsel swiper ivy company-statistics company bind-map async aggressive-indent adaptive-wrap ace-window avy evil-collection evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:height 1.0))))
 '(font-latex-sectioning-1-face ((t (:height 1.0))))
 '(font-latex-sectioning-2-face ((t (:height 1.0))))
 '(font-latex-sectioning-3-face ((t (:height 1.0))))
 '(font-latex-sectioning-4-face ((t (:height 1.0))))
 '(font-latex-sectioning-5-face ((t (:height 1.0))))
 '(font-latex-slide-title-face ((t (:height 1.0))))
 '(info-title-1 ((t (:height 1.0))))
 '(info-title-2 ((t (:height 1.0))))
 '(info-title-3 ((t (:height 1.0))))
 '(info-title-4 ((t (:height 1.0))))
 '(markdown-header-face ((t (:height 1.0))))
 '(markdown-header-face-1 ((t (:height 1.0))))
 '(markdown-header-face-2 ((t (:height 1.0))))
 '(markdown-header-face-3 ((t (:height 1.0))))
 '(markdown-header-face-4 ((t (:height 1.0))))
 '(markdown-header-face-5 ((t (:height 1.0))))
 '(markdown-header-face-6 ((t (:height 1.0))))
 '(org-document-title ((t (:height 1.0))))
 '(org-level-1 ((t (:height 1.0))))
 '(org-level-2 ((t (:height 1.0))))
 '(org-level-3 ((t (:height 1.0))))
 '(org-level-4 ((t (:height 1.0))))
 '(org-level-5 ((t (:height 1.0))))
 '(org-level-6 ((t (:height 1.0))))
 '(org-level-7 ((t (:height 1.0))))
 '(org-level-8 ((t (:height 1.0)))))
