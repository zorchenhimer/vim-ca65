if exists("b:current_syntax")
    finish
endif
syn case ignore
syn spell notoplevel
let b:current_syntax = "ca65"

syn keyword asmInstruction contained adc and cmp eor lda ora sbc sta containedin=asmZeroPage,asmZeroPageX,asmAbsolute,asmImmediate,asmAbsoluteX,asmIndexedX,asmIndexedY,asmAbsoluteY,asmIndirectX,asmIndirectY,asmAbsoluteLabel
syn keyword asmInstruction contained stx containedin=asmZeroPage,asmZeroPageY,asmAbsolute,asmIndexedY,asmAbsoluteLabel
syn keyword asmInstruction contained sty containedin=asmZeroPage,asmZeroPageX,asmAbsolute,asmAbsoluteLabel
syn keyword asmInstruction contained ldx containedin=asmZeroPage,asmZeroPageY,asmAbsolute,asmImmediate,asmAbsoluteY,asmIndexedY,asmAbsoluteLabel
syn keyword asmInstruction contained ldy containedin=asmZeroPage,asmZeroPageX,asmAbsolute,asmImmediate,asmAbsoluteX,asmIndexedX,asmAbsoluteLabel

syn keyword asmInstruction contained bit inc containedin=asmZeroPage,asmAbsolute,asmAbsoluteLabel
syn keyword asmInstruction contained lsr asl rol ror containedin=asmZeroPage,asmZeroPageX,asmAbsolute,asmAbsoluteLabel
syn keyword asmInstruction contained inc dec containedin=asmAbsolute,asmIndexedX,asmAbsoluteLabel
syn keyword asmInstruction contained cpx cpy containedin=asmZeroPage,asmAbsolute,asmImmediate,asmAbsoluteLabel

syn keyword asmInstruction contained asl lsr rol ror containedin=asmAbsolute,asmAbsoluteX,asmIndexedX,asmAbsoluteLabel

syn keyword asmIndexMode contained x y
syn keyword asmRegisterA contained a
hi! def link asmIndexMode Special
hi! def link asmRegisterA Special

syn keyword asmInstruction contained dec inc containedin=asmZeroPageX,asmZeroPage,asmAbsolute,asmAbsoluteX,asmIndexedX,asmAbsoluteLabel

" This uses "asmZeroPage" because it is the same format as relative single
" byte addressing.  Same thing for "asmAbsoluteLabel"
syn keyword asmInstruction contained bcc bcs beq bmi bne bpl bvc bvs containedin=asmAnonBranch,asmZeroPage,asmLocalBranch,asmLabelBranch,asmLocalLabelBranch,asmAbsoluteLabel

syn keyword asmInstruction contained jmp containedin=asmAnonBranch,asmLocalBranch,asmIndirectAbsolute,asmLabelBranch,asmLocalLabelBranch,asmAbsolute,asmAbsoluteLabel
syn keyword asmInstruction contained jsr containedin=asmLabelBranch,asmLocalBranch,asmAbsolute,asmAbsoluteLabel

syn keyword asmInstruction brk clc cld cli dex dey inx iny nop pha php pla rti rts sec sed sei tax tay tya tsx txa txs
hi! def link asmInstruction Statement

" List of values
syn keyword asmPreProcWords contained byte byt word res lobytes hibytes define dbyt dword
" A single string
syn keyword asmPreProcWords contained include incbin out
" 'regions'
syn keyword asmPreProcWords contained enum endenum
syn keyword asmPreProcWords contained repeat endrepeat
" Conditional
syn keyword asmPreProcWords contained if ifdef else endif

" special
syn keyword asmPreProcWords contained case charmap assert out sprintf

" nes2header.inc macros
syn keyword asmPreProcWords contained nes2mapper nes2prg nes2chr nes2bram nes2mirror nes2tv
" this one isn't contained in anything
syn keyword asmPreProcWords nes2end

"syn match asmBlankLine /^\s\+/
"hi! def link asmBlankLine Error

"syn match asmJustSpaces /\s\+$/ contained containedin=ALL
syn match asmJustSpaces /\s\+$/ contained containedin=ALL
"syn match asmJustSpaces / \+/ contained containedin=ALL
hi! def link asmJustSpaces Error

syn match asmLabel      /\v[a-z0-9_]+/ contained contains=ALLBUT,asmPreProcWords,asmNumbers
syn match asmLocalLabel /\v\@[a-z0-9_]+/ contained
hi! def link asmLabel Identifier
hi! def link asmLocalLabel Function

syn match asmLabelDef   /\v^[a-z0-9_]+:/
syn match asmLabelDef   /\v^\@[a-z0-9_]+:/
hi! def link asmLabelDef Function

syn match asmNumbers    /$[a-f0-9]\{2,4\}/ contained
syn match asmNumbers    /[a-f0-9]\{2,4\}h/ contained
syn match asmNumbers    /%[01]\{8\}/ contained
syn match asmNumbers    /\d\+/ contained
hi! def link asmNumbers Number

syn match asmImmediateValueChar /\v'.'/ contained
hi! def link asmImmediateValueChar Special

" Should this be expanded to include all binary operators?
syn match asmConstantMath /\v[\-\+\*\/\|\(\) ]/ contained containedin=asmLabel
syn match asmConstantMath />>/ contained
syn match asmConstantMath /<</ contained
hi! def link asmConstantMath Special

syn match asmImmediateValueString /\v"[^"]+"/ contained
hi! def link asmImmediateValueString String

"syn match asmImmediateValue   /\v#[\$\%]?[a-z0-9_\-\+:\*\/]+/ contained contains=asmNumbers,asmLabel,asmConstantMath
syn match asmImmediateValue   /\v#.+/ contained contains=asmNumbers,asmLabel,asmConstantMath
syn match asmImmediateValue   /\v#\<[a-z0-9_\-\+:].+/ contained contains=asmLabel
syn match asmImmediateValue   /\v#\>[a-z0-9_\-\+:]+/ contained contains=asmLabel
" this dosen't work, apparently
syn match asmImmediateValue   /\v#'.'/ contained contains=asmLabel,asmImmediateValueChar
hi! def link asmImmediateValue Constant

"syn match asmConstantDef   /\v[a-z0-9_]*\s*\=[0-9\-\+\*\/]+/ contains=asmLabel,asmNumbers,asmConstantMath
syn match asmConstantDef /\v[a-z0-9_]+\s*\=.+/ contains=asmLabel,asmNumbers,asmConstantMath
hi! def link asmConstantDef Constant

" zero page
syn match asmZeroPage       /\v[a-z]{3} \$[a-f0-9]{2}/ contains=asmNumbers
syn match asmZeroPageX      /\v[a-z]{3} \$[a-f0-9]{2}, x/ contains=asmNumbers
hi! def link asmZeroPageX Special

syn match asmZeroPageY      /\v(stx|ldx) \$[a-f0-9]+, y/ contains=asmNumbers,asmIndexMode
hi! def link asmZeroPageY Special

" Absolute
syn match asmAbsolute       /\v[a-z]{3} \$[a-f0-9]{4}/ contains=asmNumbers
syn match asmAbsoluteX      /\v[a-z]{3} \$[a-f0-9]{4}, x/ contains=asmNumbers,asmIndexMode
hi! def link asmAbsoluteX Special
syn match asmAbsoluteY      /\v[a-z]{3} \$[a-f0-9]{4}, y/ contains=asmNumbers,asmIndexMode
hi! def link asmAbsoluteY Special

syn match asmLocalBranch    /\v[a-z]{3} \@[a-z0-9_\-\+]+/ contains=asmLocalLabel

syn match asmIndirectAbsolute   /\vjmp \([a-z0-9_\-\+]+\)/ contains=asmNumbers,asmLabel
syn match asmIndirectAbsolute   /\vjmp \(\$[a-f0-9]+\)/ contains=asmNumbers
hi! def link asmIndirectAbsolute Special

" Immediate
syn match asmImmediate      /\v[a-z]{3} #.+/ contains=asmImmediateValue

" Branch Anon
syn match asmAnonLabelRef   /\v:[\+\-]+/ contained
syn match asmAnonLabelDef   /\v^:/
syn match asmAnonBranch     /\v[a-z]{3} :[\-\+]+/ contains=asmAnonLabelRef
hi! def link asmAnonLabelRef Function
hi! def link asmAnonLabelDef Function

" Indirects
syn match asmIndirectX      /\v[a-z]{3} \([a-z0-9_\-\+]+, x\)/ contains=asmLabel,asmIndexMode
syn match asmIndirectX      /\v[a-z]{3} \(\$[a-f0-9]+, x\)/ contains=asmNumbers,asmIndexMode
hi! def link asmIndirectX Special

syn match asmIndirectY      /\v[a-z]{3} \([a-z0-9_\-\+]+\), y/ contains=asmLabel,asmIndexMode
syn match asmIndirectY      /\v[a-z]{3} \(\$[a-f0-9]+\), y/ contains=asmNumbers,asmIndexMode
hi! def link asmIndirectY Special

syn match asmAbsoluteLabel  /\v[a-z]{3} [a-z0-9_\-\+]+/ contains=asmLabel,asmImmediateValueMath,asmNumbers
hi! def link asmAbsoluteLabel Special

syn match asmIndexedX       /\v[a-z]{3} [a-z0-9_\-\+]+, x/ contains=asmLabel,asmLocalLabel,asmIndexMode,asmNumbers
hi! def link asmIndexedX Special

syn match asmIndexedY       /\v[a-z]{3} [a-z0-9_\-\+]+, y/ contains=asmLabel,asmLocalLabel,asmIndexMode,asmNumbers
hi! def link asmIndexedY Special

syn match asmAccumulator    /\v[a-z]{3} a\b/ contains=asmRegisterA
hi! def link asmAccumulator     Statement

"syn match asmValueList  /\v[a-z0-9_\-\+\*\/]+/

syn match asmPreProc    /\v\.res \d+/ contains=asmPreProcWords,asmNumbers
syn match asmPreProc    /\v\.(d?byte?|d?word|define) .+/ contains=asmPreProcWords,asmNumbers,asmImmediateValueChar,asmImmediateValueString,asmLabel,asmConstantMath

"syn region asmEnum start=/.enum [a-z0-9_]\+/ end=+.endenum+ contains=asmLabel
syn match asmPreProc /\v\.enum [a-z0-9_]+/ contains=asmPreProcWords,asmLabel
syn match asmPreProc /\v\.endenum/

syn match asmPreProc /\v\.segment "[a-z0-9_]+"/ contains=asmPreProcWords,asmImmediateValueString

" Using a region here breaks things.
syn match asmPreProc /.repeat \d\+/ contains=asmPreProcWords,asmNumbers
syn match asmPreProc /\v\.repeat \$[a-f0-9]{2,4}/ contains=asmPreProcWords,asmNumbers
syn match asmPreProc /.endrepeat/ contains=asmPreProcWords

syn match asmPreProc /\v\.(lo|hi)bytes .+/ contains=asmPreProcWords,asmLabel,asmNumbers
syn match asmPreProc /\v\.(include|incbin|out) "[^"]+"/ contains=asmPreProcWords,asmImmediateValueString

syn match asmPreProc /\v.if(def)? .+/ contains=asmPreProcWords,asmLabel,asmNumbers
syn match asmPreProc /\v\.(else|endif)/

syn match asmRune /\v'.'/ contained
hi! def link asmRune Constant

syn match asmPreProc /\v\.case [\-\+]/ contains=asmPreProcWords
syn match asmPreProc /\v\.charmap \$[0-9a-f]{2}, \$[0-9a-f]{2}/ contains=asmPreProcWords,asmNumbers
syn match asmPreProc /\v\.charmap '.', \$[0-9a-f]{2}/ contains=asmPreProcWords,asmNumbers,asmRune
syn match asmPreProc /\v\.charmap \d+, \d+/ contains=asmPreProcWords,asmNumbers
syn match asmPreProc /\v\.charmap '.', \d+/ contains=asmPreProcWords,asmNumbers,asmRune

syn match asmPreProc /\vnes2(mapper|prg|chr|bram|mirror|tv) .+/ contains=asmPreProcWords,asmNumbers,asmImmediateValueChar
"syn match asmPreProc /\vnes2mapper .+/ contains=asmPreProcWords

syn match asmPreProc /\v\.(assert|out) .+/ contains=asmPreProcWords,asmNumbers,asmRune,asmImmediateValueString,asmLabel

hi! def link asmPreProcWords PreProc
"hi! def link asmPreProcWords NONE
hi! def link asmPreProc PreProc

syn keyword asmTodo contained TODO FIXME XXX NOTE
syn match asmComment /;.*$/ contains=asmTodo containedin=ALL
hi! def link asmComment Comment

hi! def link asmInstrImplied Constant
