;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; autohotkey
     ;; html
     ;; python
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
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
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ivy-posframe
                                      imenu-list
                                      phi-rectangle
                                      vimrc-mode
                                      yaml-mode
                                      ;; edit-indirect
                                      json-mode
                                      org-elp
                                      org-fragtog
                                      fcitx
                                      powershell
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   ;; dotspacemacs-verbose-loading nil
   dotspacemacs-verbose-loading t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'random

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 12)
                                (projects . 6))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; Use `:location local', Or spacemacs will try to install the theme everytime at startup.
                         (vscode-dark-plus :location local)
                         spacemacs-dark
                         doom-dark+
                         )

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Sarasa Fixed SC"
                               :size 20
                               :weight normal
                               :width normal
                               ;; :powerline-scale 1.1
                               )

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m"
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
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
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
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
   ;; If non nil, advise quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; ______________________________Set Proxy____________________________________
  ;; (setq url-gateway-method 'socks)
  ;; (setq socks-server '("Default server" "127.0.0.1" 1080 5))

  ;; (setq url-proxy-services
  ;;       '(("https" . "127.0.0.1:12333")
  ;;         ("http"  . "127.0.0.1:12333")
  ;;         ;; socks not working, @see url-default-find-proxy-for-url
  ;;         ;; ("socks5" . "localhost:1080")
  ;;         ))
  ;; ___________________________Set ELPA Source_________________________________
  ;; 如果是 spacemacs/master 分支, 设置变量 configuration-layer--elpa-archives
  ;; 如果是 spacemacs/develop 分支, 使用 configuration-layer-elpa-archives 代替原来的 configuration-layer--elpa-archives （ -- 换成 - ）
  ;; 如果不是 spacemacs . 应该设置变量 package-archives
  (setq configuration-layer-elpa-archives
        '(
          ;; 清华源: See https://mirrors.tuna.tsinghua.edu.cn/help/elpa/
          ;; ;; gnu 一般是必备的，其它的 elpa 中的包会依赖 gnu 中的包
          ;; ("gnu-cn"           . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
          ;; ;; nongnu 建议启用，类似于 melpa 但是 Emacs 官方维护的
          ;; ("nongnu-cn"        . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
          ;; ;; melpa 滚动升级，收录了的包的数量最大
          ;; ("melpa-cn"         . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ;; ;; org 仅仅为了 org-plus-contrib 这一个包，org 重度用户使用
          ;; ("org-cn"           . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ;; ;; stable-melpa 依据源码的 Tag （Git）升级，数量比 melpa 少，因为很多包作者根本不打 Tag
          ;; ("stable-melpa-cn"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")

          ;; ;; 中国源: See https://elpamirror.emacs-china.org/
          ;; ("melpa-cn" . "http://1.15.88.122/melpa/")
          ;; ("gnu-cn"   . "http://1.15.88.122/gnu/")
          ;; ("org-cn"   . "http://1.15.88.122/org/")

          ;; 腾讯源: See https://mirrors.tencent.com/help/elpa.html
          ("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
          ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
          ("org-cn"   . "http://mirrors.cloud.tencent.com/elpa/org/")

          ;; 有些时候需要从官方源安装包, 否则安装的包会出一些莫名其妙的错误.
          ;; ("melpa"          . "https://melpa.org/packages/")
          ;; ("nongnu"         . "https://elpa.nongnu.org/nongnu/")
          ;; ("melpa-stable"   . "https://stable.melpa.org/packages/")
        )
  )

  ;; ;; CANNOT put this line in dotspacemacs/usr-config ?  Use windows shortcut property `Start In' to set this value!
  ;; (setq default-directory "~/onedrive/code-snippets/")

  ;; My theme dir.
  (setq custom-theme-directory "~/.spacemacs.d/custom_themes")

  ;; Also, make sure fcitx-remote is in your PATH and exec-path. If not, use the following code in your init.el:
  (let ((fcitx-path "~/.emacs.d/bin"))
    (setenv "PATH" (concat fcitx-path ";" (getenv "PATH")))
    (add-to-list 'exec-path fcitx-path))

  ;; To Fix: spacemacs 启动时显示：Package cl is deprecated
  (setq byte-compile-warnings '(cl-functions))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; ________________________________ setq _____________________________________
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

  ;; ___________________________________________________________________________
  ;; To Fix: the problem that ivy-switch-buffer can not distinguish same filename. not tested.
  ;; (require 'uniquify)
  ;; (setq uniquify-buffer-name-style 'forward)

  ;; ____________________________ evil-normal 自动切换到英文输入法, See: https://github.com/cute-jumper/fcitx.el
  (use-package fcitx
    :ensure t)
  ;; Make sure the following comes before `(fcitx-aggressive-setup)'
  (setq fcitx-active-evil-states '(insert emacs hybrid)) ; if you use hybrid mode
  (fcitx-aggressive-setup)
  (fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
  ;; (setq fcitx-use-dbus t) ; uncomment if you're using Linux

  ;; ;; Copy from `fcitx-aggressive-setup'
  ;; ;; enable prefix-keys feature
  ;; (fcitx-prefix-keys-turn-off)
  ;; ;; enable read-* function support
  ;; (fcitx-read-funcs-turn-off)
  ;; ;; ;; enable evil-related features
  ;; ;; (fcitx-evil-turn-on)
  ;; ;; disable fcitx in minibuffer
  ;; (fcitx-aggressive-minibuffer-turn-off)
  ;; ;; enable org-speed-command support
  ;; (fcitx-org-speed-command-turn-off)

  ;; (setq fcitx-prefix-keys-polling-time 0.001)

  ;; ____________________________ use-package __________________________________
  ;; ;; ____________________________
  ;; (use-package vscode-dark-plus-theme
  ;;   :ensure t)
  ;; ____________________________ See: https://github.com/jschaf/powershell.el.git
  (use-package powershell
    :ensure t)
  ;; ____________________________
  (use-package vimrc-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))
    )
  ;; ____________________________
  (use-package json-mode
    :ensure t)
  ;; ____________________________ M-x package-install to install. don't know how diff with use-package.
  ;; (use-package edit-indirect :ensure t)
  ;; ____________________________
  (use-package yaml-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
    )
  ;; ____________________________ See: https://github.com/zk-phi/phi-rectangle
  (use-package phi-rectangle :ensure t)
  ;; ____________________________ See: https://github.com/guanyilun/org-elp
  (use-package org-elp
    :config
    (setq org-elp-idle-time 0.5
          org-elp-split-fraction 0.25))
  ;; ____________________________ See: https://github.com/io12/org-fragtog
  (use-package org-fragtog
    :ensure t
    :config
    (add-hook 'org-mode-hook 'org-fragtog-mode)
    (add-hook 'markdown-mode-hook 'org-fragtog-mode)
    )
  ;; ____________________________ See: https://github.com/bmag/imenu-list
  (use-package imenu-list
    :ensure t
    :bind (("C-\"" . imenu-list-smart-toggle))
    :bind (("<S-return>" . imenu-list-display-entry))
    :config
    (setq imenu-list-focus-after-activation t
          imenu-list-auto-resize nil)
    (imenu-list-smart-toggle)  ;; WTF!!! Toggle twice to let doom-modeline know!
    (imenu-list-smart-toggle)  ;; Otherwise, doom-modeline CANNOT render imenu-list's modeline.
    )
  ;; ____________________________ See: https://github.com/seagle0128/doom-modeline
  (use-package doom-modeline
    :ensure t
    :config
    (doom-modeline-mode 1)
    (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
    ;; How tall the mode-line should be (only respected in GUI Emacs).
    (setq doom-modeline-height 26)
    ;; How wide the mode-line bar should be (only respected in GUI Emacs).
    (setq doom-modeline-bar-width 1)  ;; 0 is INVALID!
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
    ;; :hook (after-init . doom-modeline-mode)  ;; CANNOT render imenu-list's modeline alone.
    )
  ;; ____________________________ See: https://github.com/tumashu/ivy-posframe
  (use-package ivy-posframe
    :ensure t
    :config
    (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
    (ivy-posframe-mode 1)
    )
  ;; ____________________________ See: https://github.com/emacs-evil/evil-surround
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))
  ;; ____________________________ Hard to Use.
  ;; (use-package vimish-fold
  ;;   :ensure
  ;;   :after evil)
  ;; (use-package evil-vimish-fold
  ;;   :ensure
  ;;   :after vimish-fold
  ;;   :hook ((prog-mode conf-mode text-mode) . evil-vimish-fold-mode))
  ;; ___________________________
  ;; Chinese and English fonts alignment
  ;; (use-package cnfonts
  ;;   :config
  ;;   (cnfonts-enable)
  ;;   ;; (setq cnfonts-use-face-font-rescale t)
  ;;   )
  ;; __________________________
  ;; (use-package benchmark-init
  ;;   :ensure t
  ;;   :config
  ;;   ;; To disable collection of benchmark data after init is done.
  ;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))
  ;; _________________________
  ;; (use-package helm-posframe
  ;;   :ensure t
  ;;   :config
  ;;   (setq helm-posframe-poshandler
  ;;         #'posframe-poshandler-window-center)
  ;;   (setq helm-posframe-width 100)
  ;;   (helm-posframe-enable)
  ;;   (global-set-key (kbd "M-x") 'helm-M-x)
  ;;  )
  ;; ________________________
  ;; (use-package awesome-tab
  ;;   ;; :ensure t
  ;;   :load-path "/home/frank/.spacemacs.d/files-to-load/"
  ;;   :config
  ;;   (awesome-tab-mode t))
  ;; (setq awesome-tab-label-fixed-length 10)
  ;; (setq awesome-tab-height 150)

  ;; _________________________________HOOK______________________________________
  (add-hook 'markdown-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c C-x C-u") 'markdown-toggle-url-hiding)
              (local-set-key (kbd "C-c C-x C-l") 'org-latex-preview)
              (local-set-key (kbd "C-c C-x C-v") 'markdown-toggle-inline-images)
              ))

  ;; ____________________________ key-bindings _________________________________
  (global-unset-key (kbd "C-SPC"))
  (global-set-key (kbd "<f7>") 'ivy-switch-buffer)
  (global-set-key (kbd "<C-tab>") 'next-buffer)
  (with-eval-after-load 'evil
    (define-key evil-motion-state-map (kbd "g l") 'evil-end-of-line)
    (define-key evil-motion-state-map (kbd "g h") 'evil-beginning-of-line)
    ;; (define-key evil-motion-state-map (kbd "<C-tab>") 'evil-next-buffer)
    )

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-fontify-angle-bracketed-flag nil)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(desktop-save-mode nil)
 '(global-evil-vimish-fold-mode t)
 '(imenu-list-position 'left)
 '(imenu-list-size 0.2)
 '(markdown-fontify-code-blocks-natively t)
 '(org-adapt-indentation nil)
 '(org-agenda-files
   '("~/onedrive/code-snippets/emacs.org" "~/onedrive/code-snippets/ml-math.org"))
 '(org-cycle-emulate-tab nil)
 '(org-download-heading-lvl nil)
 '(org-download-image-dir "./error-global-org-download-image-dir")
 '(org-download-method 'directory)
 '(org-edit-src-content-indentation 0)
 '(org-file-apps
   '(("\\.docx?\\'" . "wps %s")
     (auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)))
 '(org-image-actual-width nil)
 '(org-list-indent-offset 2)
 '(package-selected-packages
   '(undo-tree queue spinner org-plus-contrib magit-section compat shrink-path fcitx org-fragtog org-elp web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode org-preview-html company yasnippet cdlatex json-mode dash-functional anaconda-mode pythonic evil-vimish-fold vimish-fold yaml-mode vimrc-mode phi-rectangle rectangle-utils edit-indirect auto-complete-auctex company-auctex auto-completion-auctex auctex doom-modeline ewal-doom-themes doom-acario-dark-theme doom-solarized-dark-theme doom-material-theme doom-dark+-theme doom-theme doom-themes-theme spaceline-all-the-icons all-the-icons org-category-capture alert log4e gntp markdown-mode magit-popup gitignore-mode magit git-commit with-editor transient ivy-posframe packed wgrep smex ivy-hydra counsel-projectile counsel swiper ivy yapfify ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide imenu-list hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word cython-mode company-statistics company-anaconda column-enforce-mode cnfonts clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))
 '(safe-local-variable-values
   '((org-image-actual-width quote
                             (400))
     (org-image-actual-width quote
                             (600))
     (eval setq-local org-download-image-dir
           (concat
            (file-name-base
             (buffer-file-name))
            ".assets"))))
 '(yaml-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-search-highlight-persist-highlight-face ((t (:inherit lazy-highlight :background "LightGoldenrod2" :foreground "black"))))
 '(font-latex-sectioning-0-face ((t (:height 1.0))))
 '(font-latex-sectioning-1-face ((t (:height 1.0))))
 '(font-latex-sectioning-2-face ((t (:height 1.0))))
 '(font-latex-sectioning-3-face ((t (:height 1.0))))
 '(font-latex-sectioning-4-face ((t (:height 1.0))))
 '(font-latex-sectioning-5-face ((t (:height 1.0))))
 '(font-latex-slide-title-face ((t (:height 1.0))))
 '(hl-line ((t (:extend t :background "sienna4"))))
 '(hlt-regexp-level-1 ((t (:background "orange"))))
 '(info-title-1 ((t (:height 1.0))))
 '(info-title-2 ((t (:height 1.0))))
 '(info-title-3 ((t (:height 1.0))))
 '(info-title-4 ((t (:height 1.0))))
 '(isearch ((t nil)))
 '(markdown-blockquote-face ((t (:inherit font-lock-doc-face))))
 '(markdown-code-face ((t (:inherit fixed-pitch :family "Sarasa Fixed SC"))))
 '(markdown-header-face ((t (:height 1.0))))
 '(markdown-header-face-1 ((t (:height 1.0))))
 '(markdown-header-face-2 ((t (:height 1.0))))
 '(markdown-header-face-3 ((t (:height 1.0))))
 '(markdown-header-face-4 ((t (:height 1.0))))
 '(markdown-header-face-5 ((t (:height 1.0))))
 '(markdown-header-face-6 ((t (:height 1.0))))
 '(mode-line ((t (:background "#222226" :foreground "#b2b2b2" :box (:line-width 1 :color "#5d4d7a") :height 129 :foundry "yahei" :family "consolas"))))
 '(org-document-title ((t (:height 1.0))))
 '(org-level-1 ((t (:height 1.0))))
 '(org-level-2 ((t (:height 1.0))))
 '(org-level-3 ((t (:height 1.0))))
 '(org-level-4 ((t (:height 1.0))))
 '(org-level-5 ((t (:height 1.0))))
 '(org-level-6 ((t (:height 1.0))))
 '(org-level-7 ((t (:height 1.0))))
 '(org-level-8 ((t (:height 1.0)))))
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
 '(Info-fontify-angle-bracketed-flag nil)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes '(vscode-dark-plus))
 '(custom-safe-themes
   '("631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "b194290f97b32989529a03b315c769d03e64eed675b7f57500357d6cc8ae6f01" "c517e98fa036a0c21af481aadd2bdd6f44495be3d4ac2ce9d69201fcb2578533" "ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" "3da4d7317a707d720dcc332565510fc5631d3637fe10b046b2373af705b6042b" "6395575116fccbcc921a7134c3da729795fdf018660e56d901514410a5ad9c26" default))
 '(debug-on-error nil)
 '(desktop-save-mode nil)
 '(global-evil-vimish-fold-mode t)
 '(imenu-list-position 'left)
 '(imenu-list-size 0.2)
 '(ls-lisp-use-insert-directory-program t)
 '(markdown-enable-math t)
 '(markdown-fontify-code-blocks-natively t)
 '(org-adapt-indentation nil)
 '(org-agenda-files
   '("~/onedrive/code-snippets/emacs.org" "~/onedrive/code-snippets/ml-math.org"))
 '(org-cycle-emulate-tab nil)
 '(org-download-heading-lvl nil)
 '(org-download-image-dir "./error-global-org-download-image-dir")
 '(org-download-method 'directory)
 '(org-edit-src-content-indentation 0)
 '(org-file-apps
   '(("\\.docx?\\'" . "wps %s")
     (auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)))
 '(org-image-actual-width nil)
 '(org-list-indent-offset 2)
 '(org-preview-latex-default-process 'dvisvgm)
 '(org-startup-with-inline-images nil)
 '(package-selected-packages
   '(counsel-ag-popup ahk-mode undo-tree queue spinner org-plus-contrib magit-section compat shrink-path fcitx org-fragtog org-elp web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode org-preview-html company yasnippet cdlatex json-mode dash-functional anaconda-mode pythonic evil-vimish-fold vimish-fold yaml-mode vimrc-mode phi-rectangle rectangle-utils edit-indirect auto-complete-auctex company-auctex auto-completion-auctex auctex doom-modeline ewal-doom-themes doom-acario-dark-theme doom-solarized-dark-theme doom-material-theme doom-dark+-theme doom-theme doom-themes-theme spaceline-all-the-icons all-the-icons org-category-capture alert log4e gntp markdown-mode magit-popup gitignore-mode magit git-commit with-editor transient ivy-posframe packed wgrep smex ivy-hydra counsel-projectile counsel swiper ivy yapfify ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide imenu-list hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word cython-mode company-statistics company-anaconda column-enforce-mode cnfonts clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))
 '(safe-local-variable-values
   '((org-image-actual-width quote
                             (400))
     (org-image-actual-width quote
                             (600))
     (eval setq-local org-download-image-dir
           (concat
            (file-name-base
             (buffer-file-name))
            ".assets"))))
 '(smtpmail-smtp-server "smtp.qq.com")
 '(smtpmail-smtp-service 25)
 '(yaml-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-search-highlight-persist-highlight-face ((t (:inherit lazy-highlight :background "LightGoldenrod2" :foreground "black"))))
 '(font-latex-sectioning-0-face ((t (:height 1.0))))
 '(font-latex-sectioning-1-face ((t (:height 1.0))))
 '(font-latex-sectioning-2-face ((t (:height 1.0))))
 '(font-latex-sectioning-3-face ((t (:height 1.0))))
 '(font-latex-sectioning-4-face ((t (:height 1.0))))
 '(font-latex-sectioning-5-face ((t (:height 1.0))))
 '(font-latex-slide-title-face ((t (:height 1.0))))
 '(hl-line ((t (:extend t :background "sienna4"))))
 '(hlt-regexp-level-1 ((t (:background "orange"))))
 '(info-title-1 ((t (:height 1.0))))
 '(info-title-2 ((t (:height 1.0))))
 '(info-title-3 ((t (:height 1.0))))
 '(info-title-4 ((t (:height 1.0))))
 '(isearch ((t nil)))
 '(markdown-blockquote-face ((t (:inherit font-lock-doc-face))))
 '(markdown-code-face ((t (:inherit fixed-pitch :family "Sarasa Fixed SC"))))
 '(markdown-header-face ((t (:height 1.0))))
 '(markdown-header-face-1 ((t (:height 1.0))))
 '(markdown-header-face-2 ((t (:height 1.0))))
 '(markdown-header-face-3 ((t (:height 1.0))))
 '(markdown-header-face-4 ((t (:height 1.0))))
 '(markdown-header-face-5 ((t (:height 1.0))))
 '(markdown-header-face-6 ((t (:height 1.0))))
 '(mode-line ((t (:background "#222226" :foreground "#b2b2b2" :box (:line-width 1 :color "#5d4d7a") :height 129 :foundry "yahei" :family "consolas"))))
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
