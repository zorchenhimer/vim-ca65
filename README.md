# Vim Syntax for ca65 Assembly

I wasn't happy with the default highligting for assembly in Vim, so I wrote my
own.  This isn't perfect yet, but it's mostly usable.  Feel free to contribute
fixes and improvements.

## Installation

Copy `ca65.vim` into your syntax folder (on windows it's
`%UserProfile%/vimfiles/syntax/`).  It's installed now! \o/

## Usage

In order for Vim to load up this syntax instead of the default, put the
following line at the very top of your source files and leave the next line
blank:

```
; asmsyntax=ca65
```

## Misc

I've included a test file that lists all of the documented instructions as well
as their addressing modes.  Also included in this file are all instructions
with improper addressing modes.  These shouldn't highlight the same as correct
addressing modes, but sometimes do (help me fix it).
