## About

Zenmonk for Emacs is a derivative of the popular
[Zenburn](http://slinky.imukuppi.org/zenburnpage/) theme for vim,
developed by Jani Nurminen.

This version was derived from [zenburn-emacs](https://github.com/bbatsov/zenburn-emacs) by Bozhidar Batsov.

It is meant to be used alongside [Evil](https://gitorious.org/evil/pages/Home),
to capture the full spirit of the Zenburn (and hence, Vim) experience. ;)

## Installation

### Manual

Download `zenmonk-theme.el` to the directory `~/.emacs.d/themes/`. Add this to your
`.emacs`:

```lisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenmonk t)
```
.

# Design Changes Compared to the Original Zenburn

This version changes uses some of the colors from Daniel Brockman's
[port](github.com/dbrock/zenburn-el) of Zenburn. The biggest influence is
probably the selection (region) colors.

This version also adds four font-lock* faces for detecting numbers; these are `font-lock-{decimal,hex,float,octal}-face`.
They are added into the programming major modes.
The idea was adopted from http://stackoverflow.com/questions/8860050/emacs-c-mode-how-do-you-syntax-highlight-hex-numbers.
