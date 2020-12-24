;;; sinolor-light-theme.el --- Light theme

;;; Commentary:
;;
;; Light theme.
;;
;; Color selected from Chinese traditional colors.
;;
;; 月白	#eef7f2
;; 穹灰	#c4d7d6
;; 淡绿灰	#70887d
;;
;; 香叶红	#f07c82
;; 牡丹粉红	#eea2a4
;; 丁香淡紫	#e9d7df
;;
;; 霁青	#63bbd0
;; 鸢尾蓝	#158bb8
;; 瀑布蓝	#51c4d3
;; 远天蓝	#d0dfe6
;;
;; 玉髓绿	#41b349
;;

;;; Code:

(require 'sinolor-themes)

(defgroup sinolor-light-theme nil
  "Options for sinolor-themes"
  :group 'sinolor-themes)

(defcustom sinolor-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sinolor-light-theme
  :type 'boolean)

(defcustom sinolor-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sinolor-light-theme
  :type 'boolean)

(defcustom sinolor-light-comment-bg sinolor-light-brighter-comments
  "If non-nil, comments will have a subtle, darker background.

Enhancing their legibility."
  :group 'sinolor-light-theme
  :type 'boolean)

(defcustom sinolor-light-padded-modeline sinolor-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.

Can be an integer to determine the exact padding."
  :group 'sinolor-light-theme
  :type '(choice integer boolean))

(def-sinolor-theme sinolor-light
  "A derived light theme from `sinolor-dark.'"

  ;; name        default   256       16
  ((bg         '("#eef7f2" "#d7ffff" "brightwhite" ))
   (bg-alt     '("#c4d7d6" "#d7d7ff" "gray"        ))
   (base0      '("#f07c82" "#d7005f" "red"         ))
   (base1      '("#eea2a4" "#d700af" "magenta"     ))
   (base2      '("#c04851" "#d700ff" "magenta"     ))
   (base3      '("#d0dfe6" "#262626" "gray"        ))
   (base4      '("#ee3f4d" "#ff005f" "magenta"     ))
   (base5      '("#70887d" "#3f3f3f" "gray"        ))
   (base6      '("#73797e" "#6b6b6b" "magenta"     ))
   (base7      '("#9ca0a4" "#979797" "magenta"     ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"       ))
   (fg         '("#383a42" "#bfbfbf" "brightwhite" ))
   (fg-alt     '("#c6c7c7" "#2d2d2d" "white"       ))

   (white      '("#f8f4ed" "#dfdfdf" "white"         ))
   (grey       '("#b7ae8f" "#3f3f3f" "brightblack"   ))
   (red        '("#de1c31" "#ff6655" "red"           ))
   (orange     '("#fa7e23" "#dd8844" "brightred"     ))
   (yellow     '("#e2d849" "#ffff00" "yellow"        ))
   (gold       '("#fed71a" "#ffd700" "gold"          ))
   (gold2      '("#e2c027" "#ffd700" "gold2"         ))
   (teal       '("#12a182" "#00ff00" "brightgreen"   ))
   (blue       '("#51c4d3" "#00afff" "brightblue"    ))
   (blue2      '("#8fb2c9" "#0087ff" "brightblue"    ))
   (dark-blue  '("#10aec2" "#000087" "blue"          ))
   (cyan       '("#63bbd0" "#00ffff" "brightcyan"    ))
   (dark-cyan  '("#134857" "#00d7ff" "cyan"          ))
   (green      '("#20894d" "#00ff00" "green"         ))
   (magenta    '("#8b2671" "#870087" "brightmagenta" ))
   (purple     '("#8b2671" "#5f5faf" "brightmagenta" ))
   (violet     '("#815c94" "#af87ff" "magenta"       ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (sinolor-themes--darken base2 0.1))
   (selection      "#10aec2")
   (builtin        blue2)
   (comments       (if sinolor-light-brighter-comments cyan base4))
   (doc-comments   (sinolor-themes--darken comments 0.15))
   (constants      "#008080")
   (functions      "#0C0CA9")
   (keywords       "#A91B0C")
   (methods        cyan)
   (operators      blue)
   (type           "#A90C6C")
   (strings        "#41b349")
   (variables      (sinolor-themes--darken magenta 0.36))
   (numbers        orange)
   (region         "#3F90F7")
   (region-fg      "#46D9FF")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright sinolor-light-brighter-modeline)
   (-modeline-pad
    (when sinolor-light-padded-modeline
      (if (integerp sinolor-light-padded-modeline) sinolor-light-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (sinolor-themes--lighten blue 0.475)
      `(,(sinolor-themes--lighten (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (sinolor-themes--lighten blue 0.45)
      `(,(sinolor-themes--lighten (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(sinolor-themes--lighten (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (sinolor-themes--blend region bg 0.5))

   ((line-number &override) :foreground fg-alt :background bg)
   ((line-number-current-line &override) :foreground fg :background bg)

   (font-lock-comment-face
    :foreground comments
    :background (if sinolor-light-comment-bg (sinolor-themes--lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; table
   (table-cell :background grey)

   ;; ivy-mode
   (ivy-current-match :underline t :distant-foreground base0 :foreground base4 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (sinolor-themes--lighten base3 0.05))

   ;; info-mode
   (Info-quoted :inherit font-lock-variable-name-face)

   ;; org-mode
   (org-hide              :foreground hidden)
   (org-block             :background base3 :extend t)
   (org-block-begin-line  :background (sinolor-themes--lighten base3 0.05) :overline t)
   (org-block-end-line    :background (sinolor-themes--lighten base3 0.05) :underline t)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; sinolor-light-theme.el ends here