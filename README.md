## About

Zenmonk for Emacs is a derivative of the popular
[Zenburn](http://slinky.imukuppi.org/zenburnpage/) theme for vim,
developed by Jani Nurminen.

This version was derived from [zenburn-emacs](https://github.com/bbatsov/zenburn-emacs) by Bozhidar Batsov.

It is meant to be used alongside [Evil](https://gitorious.org/evil/pages/Home),
to capture the full spirit of the Zenburn (and hence, Vim), experience. ;)

## Installation

### Manual

Download `zenmonk-theme.el` to the directory `~/.emacs.d/themes/`. Add this to your
`.emacs`:

```lisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenmonk t)
```

Now you can load the theme with the interactive function `load-theme` like this:

`M-x load-theme RET zenmonk`

. Or, you can do make it permanent with

```lisp
(load-theme 'zenmonk t)
```

# Design Changes Compared to the Original Zenburn

This version changes uses some of the colors from Daniel Brockman's
[port](github.com/dbrock/zenburn-el) of Zenburn. The biggest influence is
probably the selection (region) colors.

This version also adds four font-lock* faces; these are `font-lock-{decimal,hex,float,octal}-face`.
The idea was adopted from http://stackoverflow.com/questions/8860050/emacs-c-mode-how-do-you-syntax-highlight-hex-numbers.
You can create these custom faces by customizing your `~/.emacs` file like in the way below:

```
(make-face 'font-lock-hex-face)
(setq font-lock-hex-face 'font-lock-hex-face)
(make-face 'font-lock-float-face)
(setq font-lock-float-face 'font-lock-float-face)
(make-face 'font-lock-decimal-face)
(setq font-lock-decimal-face 'font-lock-decimal-face)
(make-face 'font-lock-octal-face)
(setq font-lock-octal-face 'font-lock-octal-face)
(setq number-mode-list
    '(  c-mode-hook
        c++-mode-hook
        lisp-mode-hook
        emacs-lisp-mode-hook
        haskell-mode-hook
        python-mode-hook
        cperl-mode-hook
    )
)
(dolist (mode number-mode-list)
    (add-hook mode
        '(lambda ()
            (font-lock-add-keywords nil
                '(
                    ; Valid hex number (will highlight invalid suffix though)
                    ("\\b0x[[:xdigit:]]+[uUlL]*\\b" . font-lock-hex-face)
                    ; Valid floating point number.
                    ("\\(\\b[0-9]+\\)\\(\\.\\)\\{1\\}\\([0-9]+\\(e[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b" (1 font-lock-float-face) (2 font-lock-decimal-face) (3 font-lock-float-face))
                    ; Valid decimal number.  Must be before octal regexes otherwise 0 and 0l
                    ; will be highlighted as errors.  Will highlight invalid suffix though.
                    ("\\b\\(\\(0\\|[1-9][0-9]*\\)[uUlL]*\\)\\b" 1 font-lock-decimal-face)
                    ; Valid octal number
                    ("\\b0[0-7]+[uUlL]*\\b" . font-lock-octal-face)
                )
            )
        )
    )
)
```
