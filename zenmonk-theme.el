; zenmonk.el --- A low contrast color theme for Emacs, inspired by Zenburn.

; Copyright (C) 2011-2014 Bozhidar Batsov
; Copyright (C) 2014 Linus Arver

; Author: Linus Arver <linus <at> ucla <dot> edu>
; URL: http://github.com/listx/zenmonk
; Version: 0.1

; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(deftheme zenmonk "The Zenmonk color theme")

; Color Palette

(defvar zenmonk-colors-alist
	'(
		("zm-fg+1"      . "#ffffef")
		("zm-fg"        . "#cccccf")
		("zm-fg-1"      . "#656555")

		("zm-bg+3"      . "#6f6f6f")
		("zm-bg+2"      . "#5f5f5f")
		("zm-bg+1"      . "#4f4f4f")
		("zm-bg+05"     . "#494949")
		("zm-bg"        . "#22222a")
		("zm-bg-05"     . "#383838")
		("zm-bg-1"      . "#2b2b2b")
		("zm-bg-2"      . "#000000")

		("zm-red+2"     . "#f18c96")
		("zm-red+1"     . "#dca3a3")
		("zm-red"       . "#cc9393")
		("zm-red-1"     . "#bc8383")
		("zm-red-2"     . "#ac7373")
		("zm-red-3"     . "#9c6363")
		("zm-red-4"     . "#8c5353")

		("zm-orange+1"  . "#ffcfaf")
		("zm-orange"    . "#dfaf8f")

		("zm-yellow+1"  . "#dfdfbf")
		("zm-yellow"    . "#f0dfaf")
		("zm-yellow-1"  . "#e0cf9f")
		("zm-yellow-2"  . "#d0bf8f")

		("zm-green+4"   . "#bfebbf")
		("zm-green+3"   . "#afd8af")
		("zm-green+2"   . "#9fc59f")
		("zm-green+1"   . "#8fb28f")
		("zm-green"     . "#7f9f7f")
		("zm-green-1"   . "#5f7f5f")
		("zm-green-2"   . "#1e2320")

		("zm-cyan"      . "#93e0e3")

		("zm-blue+1"    . "#94bff3")
		("zm-blue"      . "#8cd0d3")
		("zm-blue-1"    . "#7cb8bb")
		("zm-blue-2"    . "#6ca0a3")
		("zm-blue-3"    . "#5c888b")
		("zm-blue-4"    . "#4c7073")
		("zm-blue-5"    . "#366060")

		("zm-magenta"   . "#dc8cc3")
	)
	"List of Zenmonk colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker."
)

(defmacro zenmonk-with-color-variables (&rest body)
	"`let' bind all colors defined in `zenmonk-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
	(declare (indent 0))
	`(let
		 ((class '((class color) (min-colors 89)))
		,@(mapcar (lambda (cons)
					(list (intern (car cons)) (cdr cons)))
			zenmonk-colors-alist))
		,@body
	)
)

; Theme Faces
(zenmonk-with-color-variables
	(custom-theme-set-faces
	 'zenmonk
; Built-in
; basic coloring
	'(button ((t (:underline t))))
	`(link ((t (:foreground ,zm-yellow :underline t :weight bold))))
	`(link-visited ((t (:foreground ,zm-yellow-2 :underline t :weight normal))))
	`(default ((t (:foreground ,zm-fg :background ,zm-bg))))
	`(cursor ((t (:foreground ,zm-fg :background ,zm-fg+1))))
	`(escape-glyph ((t (:foreground ,zm-yellow :bold t))))
	`(fringe ((t (:foreground ,zm-fg :background ,zm-bg+1))))
	`(header-line ((t (:foreground ,zm-yellow
		:background ,zm-bg-1
		:box (:line-width -1 :style released-button)))))
	`(highlight ((t (:background ,zm-bg-05))))
	`(success ((t (:foreground ,zm-green :weight bold))))
	`(warning ((t (:foreground ,zm-orange :weight bold))))
	; compilation
	`(compilation-column-face ((t (:foreground ,zm-yellow))))
	`(compilation-enter-directory-face ((t (:foreground ,zm-green))))
	`(compilation-error-face ((t (:foreground ,zm-red-1
		:weight bold :underline t))))
	`(compilation-face ((t (:foreground ,zm-fg))))
	`(compilation-info-face ((t (:foreground ,zm-blue))))
	`(compilation-info ((t (:foreground ,zm-green+4 :underline t))))
	`(compilation-leave-directory-face ((t (:foreground ,zm-green))))
	`(compilation-line-face ((t (:foreground ,zm-yellow))))
	`(compilation-line-number ((t (:foreground ,zm-yellow))))
	`(compilation-message-face ((t (:foreground ,zm-blue))))
	`(compilation-warning-face ((t (:foreground ,zm-orange
		:weight bold :underline t))))
	`(compilation-mode-line-exit ((t (:foreground ,zm-green+2 :weight bold))))
	`(compilation-mode-line-fail ((t (:foreground ,zm-red :weight bold))))
	`(compilation-mode-line-run ((t (:foreground ,zm-yellow :weight bold))))
	; grep
	`(grep-context-face ((t (:foreground ,zm-fg))))
	`(grep-error-face ((t (:foreground ,zm-red-1 :weight bold :underline t))))
	`(grep-hit-face ((t (:foreground ,zm-blue))))
	`(grep-match-face ((t (:foreground ,zm-orange :weight bold))))
	`(match ((t (:background ,zm-bg-1 :foreground ,zm-orange :weight bold))))
	; isearch
	`(isearch ((t (:foreground ,zm-bg-1
		:weight bold :background ,zm-magenta))))
	`(isearch-fail ((t (:foreground ,zm-fg :background ,zm-red-4))))
	`(lazy-highlight ((t (:foreground ,zm-bg-1
		:weight bold :background ,zm-magenta))))

	`(menu ((t (:foreground ,zm-fg :background ,zm-bg))))
	`(minibuffer-prompt ((t (:foreground ,zm-yellow))))
	`(mode-line
		((,class (:foreground ,zm-green+1
			:background ,zm-green-2
			:box (:line-width -1 :style released-button)))
		(t :inverse-video t)))
	`(mode-line-buffer-id ((t (:foreground ,zm-yellow :weight bold))))
	`(mode-line-inactive
		((t (:foreground ,zm-green-1
			:background ,zm-bg-05
			:box (:line-width -1 :style released-button)))))
	`(region ((,class (:foreground ,zm-blue-5 :background ,zm-green+4))
		(t :inverse-video t)))
	`(secondary-selection ((t (:background ,zm-bg+2))))
	`(trailing-whitespace ((t (:background ,zm-red+2))))
	`(vertical-border ((t (:foreground ,zm-fg))))
	; font lock
	`(font-lock-builtin-face ((t (:foreground ,zm-fg :weight bold))))
	`(font-lock-comment-face ((t (:foreground ,zm-green))))
	`(font-lock-comment-delimiter-face ((t (:foreground ,zm-green-1))))
	`(font-lock-constant-face ((t (:foreground ,zm-red+1 :weight bold))))
	`(font-lock-doc-face ((t (:foreground ,zm-green+2))))
	`(font-lock-function-name-face ((t (:foreground ,zm-cyan))))
	`(font-lock-keyword-face ((t (:foreground ,zm-orange+1 :weight bold))))
	`(font-lock-negation-char-face ((t (:foreground ,zm-yellow :weight bold))))
	`(font-lock-operator-face ((t (:foreground ,zm-blue-1 :weight bold))))
	`(font-lock-preprocessor-face ((t (:foreground ,zm-orange+1 :weight bold))))
	`(font-lock-pseudo-keyword-face ((t (:foreground ,zm-orange :weight bold))))
	`(font-lock-regexp-grouping-construct ((t (:foreground ,zm-yellow
		:weight bold))))
	`(font-lock-regexp-grouping-backslash ((t (:foreground ,zm-green
		:weight bold))))
	`(font-lock-string-face ((t (:foreground ,zm-red))))
	`(font-lock-type-face ((t (:foreground ,zm-yellow+1 :weight bold))))
	`(font-lock-variable-name-face ((t (:foreground ,zm-yellow))))
	`(font-lock-warning-face ((t (:foreground ,zm-red+1 :weight bold))))

	`(c-annotation-face ((t (:inherit font-lock-constant-face))))

	; Third-party
	; custom font-lock faces for highlighting numbers (see README.md)
	`(font-lock-decimal-face ((t (:foreground ,zm-blue))))
	`(font-lock-hex-face ((t (:foreground ,zm-blue :weight bold))))
	`(font-lock-float-face ((t (:foreground ,zm-magenta))))
	`(font-lock-octal-face ((t (:foreground ,zm-magenta :weight bold))))
	; column-enforce-mode
	`(column-enforce-face ((t (:foreground ,zm-bg
		:background ,zm-red+2 :underline nil))))
	; hl-line-mode
	`(hl-line-face ((,class (:background ,zm-bg-05))
					(t :weight bold)))
	`(hl-line ((,class (:background ,zm-bg-05)) ; old emacsen
			   (t :weight bold)))
	; ido-mode
	`(ido-first-match ((t (:foreground ,zm-yellow :weight bold))))
	`(ido-only-match ((t (:foreground ,zm-orange :weight bold))))
	`(ido-subdir ((t (:foreground ,zm-yellow))))
	`(ido-indicator ((t (:foreground ,zm-yellow :background ,zm-red-4))))
	; ledger-mode
	`(ledger-font-payee-uncleared-face ((t (:foreground ,zm-red-1
		:weight bold))))
	`(ledger-font-payee-cleared-face ((t (:foreground ,zm-fg :weight normal))))
	`(ledger-font-xact-highlight-face ((t (:background ,zm-bg+1))))
	`(ledger-font-pending-face ((t (:foreground ,zm-orange weight: normal))))
	`(ledger-font-other-face ((t (:foreground ,zm-fg))))
	`(ledger-font-posting-account-face ((t (:foreground ,zm-blue-1))))
	`(ledger-font-posting-account-cleared-face ((t (:foreground ,zm-fg))))
	`(ledger-font-posting-account-pending-face ((t (:foreground ,zm-orange))))
	`(ledger-font-posting-amount-face ((t (:foreground ,zm-orange))))
	`(ledger-font-posting-account-pending-face ((t (:foreground ,zm-orange))))
	`(ledger-occur-narrowed-face ((t (:foreground ,zm-fg-1 :invisible t))))
	`(ledger-occur-xact-face ((t (:background ,zm-bg+1))))
	`(ledger-font-comment-face ((t (:foreground ,zm-green))))
	`(ledger-font-reconciler-uncleared-face ((t (:foreground ,zm-red-1
		:weight bold))))
	`(ledger-font-reconciler-cleared-face ((t (:foreground ,zm-fg
		:weight normal))))
	`(ledger-font-reconciler-pending-face ((t (:foreground ,zm-orange
		:weight normal))))
	`(ledger-font-report-clickable-face ((t (:foreground ,zm-orange
		:weight normal))))
	; org-mode
	`(org-agenda-date-today
	  ((t (:foreground ,zm-fg+1 :slant italic :weight bold))) t)
	`(org-agenda-structure
	  ((t (:inherit font-lock-comment-face))))
	`(org-archived ((t (:foreground ,zm-fg :weight bold))))
	`(org-checkbox ((t (:background ,zm-bg+2 :foreground ,zm-fg+1
		:box (:line-width 1 :style released-button)))))
	`(org-date ((t (:foreground ,zm-blue :underline t))))
	`(org-deadline-announce ((t (:foreground ,zm-red-1))))
	`(org-done ((t (:bold t :weight bold :foreground ,zm-green+3))))
	`(org-formula ((t (:foreground ,zm-yellow-2))))
	`(org-headline-done ((t (:foreground ,zm-green+3))))
	`(org-hide ((t (:foreground ,zm-bg))))
	`(org-level-1 ((t (:foreground ,zm-orange))))
	`(org-level-2 ((t (:foreground ,zm-green+4))))
	`(org-level-3 ((t (:foreground ,zm-blue-1))))
	`(org-level-4 ((t (:foreground ,zm-yellow-2))))
	`(org-level-5 ((t (:foreground ,zm-cyan))))
	`(org-level-6 ((t (:foreground ,zm-green+2))))
	`(org-level-7 ((t (:foreground ,zm-red-4))))
	`(org-level-8 ((t (:foreground ,zm-blue-4))))
	`(org-link ((t (:foreground ,zm-yellow-2 :underline t))))
	`(org-scheduled ((t (:foreground ,zm-green+4))))
	`(org-scheduled-previously ((t (:foreground ,zm-red))))
	`(org-scheduled-today ((t (:foreground ,zm-blue+1))))
	`(org-sexp-date ((t (:foreground ,zm-blue+1 :underline t))))
	`(org-special-keyword ((t (:inherit font-lock-comment-face))))
	`(org-table ((t (:foreground ,zm-green+2))))
	`(org-tag ((t (:bold t :weight bold))))
	`(org-time-grid ((t (:foreground ,zm-orange))))
	`(org-todo ((t (:bold t :foreground ,zm-red :weight bold))))
	`(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
	`(org-warning ((t (:bold t :foreground ,zm-red
		:weight bold :underline nil))))
	`(org-column ((t (:background ,zm-bg-1))))
	`(org-column-title ((t (:background ,zm-bg-1 :underline t :weight bold))))
	`(org-mode-line-clock ((t (:foreground ,zm-fg :background ,zm-bg-1))))
	`(org-mode-line-clock-overrun ((t (:foreground ,zm-bg
		:background ,zm-red-1))))
	`(org-ellipsis ((t (:foreground ,zm-yellow-1 :underline t))))
	`(org-footnote ((t (:foreground ,zm-cyan :underline t))))
	; show-paren
	`(show-paren-mismatch ((t (:foreground ,zm-red+1
		:background ,zm-bg+3 :weight bold))))
	`(show-paren-match ((t (:background ,zm-bg+3 :weight bold))))
	; undo-tree
	`(undo-tree-visualizer-active-branch-face ((t (:foreground ,zm-fg+1
		:weight bold))))
	`(undo-tree-visualizer-current-face ((t (:foreground ,zm-red-1
		:weight bold))))
	`(undo-tree-visualizer-default-face ((t (:foreground ,zm-fg))))
	`(undo-tree-visualizer-register-face ((t (:foreground ,zm-yellow))))
	`(undo-tree-visualizer-unmodified-face ((t (:foreground ,zm-cyan))))
	)
)

; Theme Variables
(zenmonk-with-color-variables
	(custom-theme-set-variables
	 'zenmonk
	; ansi-color
	`(ansi-color-names-vector
		[
			,zm-bg
			,zm-red
			,zm-green
			,zm-yellow
			,zm-blue
			,zm-magenta
			,zm-cyan
			,zm-fg
		]
	)
	; fill-column-indicator
	`(fci-rule-color ,zm-bg-05)
	; vc-annotate
	`(vc-annotate-color-map
		'(
			( 20. . ,zm-red-1)
			( 40. . ,zm-red)
			( 60. . ,zm-orange)
			( 80. . ,zm-yellow-2)
			(100. . ,zm-yellow-1)
			(120. . ,zm-yellow)
			(140. . ,zm-green-1)
			(160. . ,zm-green)
			(180. . ,zm-green+1)
			(200. . ,zm-green+2)
			(220. . ,zm-green+3)
			(240. . ,zm-green+4)
			(260. . ,zm-cyan)
			(280. . ,zm-blue-2)
			(300. . ,zm-blue-1)
			(320. . ,zm-blue)
			(340. . ,zm-blue+1)
			(360. . ,zm-magenta))
		)
		`(vc-annotate-very-old-color ,zm-magenta)
		`(vc-annotate-background ,zm-bg-1)
	)
)

(provide-theme 'zenmonk)
