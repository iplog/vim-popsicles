"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    ____                 _      _
"   |  _ \ ___  _ __  ___(_) ___| | ___  ___
"   | |_) / _ \| '_ \/ __| |/ __| |/ _ \/ __|
"   |  __/ (_) | |_) \__ \ | (__| |  __/\__ \
"   |_|   \___/| .__/|___/_|\___|_|\___||___/
"              |_|
"
" Author: Nicolas Blanchot <nicolasblanchot@gmail.com>
" Maintainer: Nicolas Blanchot <nicolasblanchot@gmail.com>
" Notes:  My really pop theme
"
"     Widely inspired by the gummybears vim scheme by
"       Jose Elera Campana - https://github.com/jelera
"     And the base16 themes by
"       Chris Kempson - https://github.com/chriskempson/base16
"     Built using the vim colorscheme template by
"       Gerardo Galindez <gerardo.galindez@gmail.com>
"
" Helper function that you can use to find out the current group-name
" ```
" nmap <leader>s :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc
" ```
"
" In order to convert values between RGB hex codes and xterm-256 color codes
" you can use the following script:
" [colortrans.py](https://gist.github.com/MicahElliott/719710)
"
"================================================================
" Colors used                                                   |
"                                                               |
" let s:gui00 = #000000 -> 0                                    |
" let s:gui01 = #202020 -> 234                                  |
" let s:gui02 = #303030 -> 236                                  |
" let s:gui03 = #505050 -> 240                                  |
" let s:gui04 = #b0b0b0 -> 249                                  |
" let s:gui05 = #d0d0d0 -> 252                                  |
" let s:gui06 = #e0e0e0 -> 254                                  |
" let s:gui07 = #f5f5f5 -> 15                                   |
"                                                               |
" let s:gui08 = #ff5f5f -> 203                                  |
" let s:gui09 = #01a0e4 -> 38                                   |
" let s:gui0A = #0080fb -> 33                                   |
" let s:gui0B = #fefb67 -> 227                                  |
" let s:gui0C = #4fdd56 -> 77                                   |
" let s:gui0D = #96cbfe -> 117                                  |
" let s:gui0E = #e474e4 -> 176                                  |
" let s:gui0F = #ff73fd -> 213                                  |
"                                                               |
"================================================================

"----------------------------------------------------------------
" Theme setup                                                   |
"----------------------------------------------------------------
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name="popsicles"

"----------------------------------------------------------------
" GUI color definitions                                         |
"----------------------------------------------------------------
let s:gui00 = "000000"
let s:gui01 = "202020"
let s:gui02 = "303030"
let s:gui03 = "505050"
let s:gui04 = "b0b0b0"
let s:gui05 = "d0d0d0"
let s:gui06 = "e0e0e0"
let s:gui07 = "f5f5f5"
let s:gui08 = "ff5f5f"
let s:gui09 = "01a0e4"
let s:gui0A = "0080fb"
let s:gui0B = "fefb67"
let s:gui0C = "4fdd56"
let s:gui0D = "96cbfe"
let s:gui0E = "e474e4"
let s:gui0F = "ff73fd"

"----------------------------------------------------------------
" Terminal color definitions                                    |
"----------------------------------------------------------------
let s:cterm00 = "0"
let s:cterm01 = "234"
let s:cterm02 = "236"
let s:cterm03 = "240"
let s:cterm04 = "249"
let s:cterm05 = "252"
let s:cterm06 = "254"
let s:cterm07 = "15"
let s:cterm08 = "203"
let s:cterm09 = "33"
let s:cterm0A = "38"
let s:cterm0B = "227"
let s:cterm0C = "77"
let s:cterm0D = "117"
let s:cterm0E = "176"
let s:cterm0F = "213"

"----------------------------------------------------------------
" highlighting function                                         |
"----------------------------------------------------------------
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . s:gui(a:guifg)
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Return GUI color for light/dark variants
fun s:gui(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:gui00
    return s:gui07
  elseif a:color == s:gui01
    return s:gui06
  elseif a:color == s:gui02
    return s:gui05
  elseif a:color == s:gui03
    return s:gui04
  elseif a:color == s:gui04
    return s:gui03
  elseif a:color == s:gui05
    return s:gui02
  elseif a:color == s:gui06
    return s:gui01
  elseif a:color == s:gui07
    return s:gui00
  endif

  return a:color
endfun

" Return terminal color for light/dark variants
fun s:cterm(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:cterm00
    return s:cterm07
  elseif a:color == s:cterm01
    return s:cterm06
  elseif a:color == s:cterm02
    return s:cterm05
  elseif a:color == s:cterm03
    return s:cterm04
  elseif a:color == s:cterm04
    return s:cterm03
  elseif a:color == s:cterm05
    return s:cterm02
  elseif a:color == s:cterm06
    return s:cterm01
  elseif a:color == s:cterm07
    return s:cterm00
  endif

  return a:color
endfun

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" Vim editor colors
call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "")
call <sid>hi("Bold",          "", "", "", "", "bold")
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Error",         s:gui00, s:gui08, s:cterm00, s:cterm08, "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "")
call <sid>hi("FoldColumn",    "", s:gui01, "", s:cterm01, "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, s:cterm01, s:cterm09, "none")
call <sid>hi("Italic",        "", "", "", "", "none")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "")
call <sid>hi("MatchParen",    "", s:gui03, "", s:cterm03,  "")
call <sid>hi("ModeMsg",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Search",        s:gui01, s:gui0A, s:cterm01, s:cterm0A,  "")
call <sid>hi("Substitute",    s:gui01, s:gui0A, s:cterm01, s:cterm0A, "none")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "")
call <sid>hi("VisualNOS",     s:gui08, "", s:cterm08, "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("WildMenu",      s:gui08, s:gui0A, s:cterm08, "", "")
call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "none")
call <sid>hi("Conceal",       s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "")
call <sid>hi("NonText",       s:gui03, "", s:cterm03, "", "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none")
call <sid>hi("ColorColumn",   "", s:gui01, "", s:cterm01, "none")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:cterm01, "none")
call <sid>hi("CursorLine",    "", s:gui01, "", s:cterm01, "none")
call <sid>hi("CursorLineNr",  s:gui0B, s:gui01, s:cterm0B, s:cterm01, "")
call <sid>hi("QuickFixLine",  "", s:gui01, "", s:cterm01, "none")
call <sid>hi("PMenu",         s:gui04, s:gui01, s:cterm04, s:cterm01, "none")
call <sid>hi("PMenuSel",      s:gui01, s:gui04, s:cterm01, s:cterm04, "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
call <sid>hi("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("Comment",      s:gui03, "", s:cterm03, "", "")
call <sid>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none")
call <sid>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none")
call <sid>hi("Include",      s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Label",        s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "")
call <sid>hi("Operator",     s:gui05, "", s:cterm05, "", "none")
call <sid>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Special",      s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("Statement",    s:gui08, "", s:cterm08, "", "")
call <sid>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("String",       s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("Tag",          s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "")
call <sid>hi("Type",         s:gui0A, "", s:cterm0A, "", "none")
call <sid>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "")

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("csAttribute",             s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("csModifier",              s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "")
call <sid>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0C, s:gui01,  s:cterm0C, s:cterm01, "")
call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:cterm03, s:cterm01, "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:cterm08, s:cterm01, "")
call <sid>hi("DiffText",     s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "")
call <sid>hi("DiffAdded",    s:gui0C, s:gui00,  s:cterm0C, s:cterm00, "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "")
call <sid>hi("DiffNewFile",  s:gui0C, s:gui00,  s:cterm0C, s:cterm00, "")
call <sid>hi("DiffLine",     s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:gui08, "", s:cterm08, "", "")
call <sid>hi("gitcommitSummary",        s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("gitcommitComment",        s:gui03, "", s:cterm03, "", "")
call <sid>hi("gitcommitUntracked",      s:gui03, "", s:cterm03, "", "")
call <sid>hi("gitcommitDiscarded",      s:gui03, "", s:cterm03, "", "")
call <sid>hi("gitcommitSelected",       s:gui03, "", s:cterm03, "", "")
call <sid>hi("gitcommitHeader",         s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("gitcommitSelectedType",   s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("gitcommitUnmergedType",   s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("gitcommitDiscardedType",  s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("gitcommitBranch",         s:gui09, "", s:cterm09, "", "bold")
call <sid>hi("gitcommitUntrackedFile",  s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("gitcommitUnmergedFile",   s:gui08, "", s:cterm08, "", "bold")
call <sid>hi("gitcommitDiscardedFile",  s:gui08, "", s:cterm08, "", "bold")
call <sid>hi("gitcommitSelectedFile",   s:gui0B, "", s:cterm0B, "", "bold")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "")
call <sid>hi("GitGutterChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "")
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsStatement",         s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsReturn",            s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsThis",              s:gui08, "", s:cterm08, "", "")
call <sid>hi("jsClassDefinition",   s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("jsFunction",          s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsFuncName",          s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsFuncCall",          s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsClassFuncName",     s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("jsClassMethodType",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("jsRegexpString",      s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("jsGlobalObjects",     s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("jsGlobalNodeObjects", s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("jsExceptions",        s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("jsBuiltins",          s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("jsNoise",             s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("jsNumber",            s:gui09, "", s:cterm09, "", "")
call <sid>hi("jsStorageClass",      s:gui08, "", s:cterm08, "", "none")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("mailQuoted2",  s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("mailQuoted3",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("mailQuoted4",  s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("mailQuoted5",  s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("mailQuoted6",  s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("mailURL",      s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("mailEmail",    s:gui0D, "", s:cterm0D, "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "")
call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "")
call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "")
call <sid>hi("phpMethodsVar",      s:gui0C, "", s:cterm0C, "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("pythonInclude",   s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("pythonStatement", s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("pythonBuiltin",   s:gui0C, "", s:cterm0C, "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "")
call <sid>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "")
call <sid>hi("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "")
call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "")
call <sid>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "")
call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "")
call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellCap",     "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellLocal",   "", s:gui00, "", s:cterm00, "undercurl")
call <sid>hi("SpellRare",    "", s:gui00, "", s:cterm00, "undercurl")

" Startify highlighting
call <sid>hi("StartifyBracket",  s:gui03, "", s:cterm03, "", "")
call <sid>hi("StartifyFile",     s:gui07, "", s:cterm07, "", "")
call <sid>hi("StartifyFooter",   s:gui03, "", s:cterm03, "", "")
call <sid>hi("StartifyHeader",   s:gui0B, "", s:cterm0B, "", "")
call <sid>hi("StartifyNumber",   s:gui09, "", s:cterm09, "", "")
call <sid>hi("StartifyPath",     s:gui03, "", s:cterm03, "", "")
call <sid>hi("StartifySection",  s:gui0E, "", s:cterm0E, "", "")
call <sid>hi("StartifySelect",   s:gui0C, "", s:cterm0C, "", "")
call <sid>hi("StartifySlash",    s:gui03, "", s:cterm03, "", "")
call <sid>hi("StartifySpecial",  s:gui03, "", s:cterm03, "", "")

" Java highlighting
call <sid>hi("javaOperator",     s:gui0D, "", s:cterm0D, "", "")
"--------------------------------------------------------------------
" Remove functions                                                  |
"--------------------------------------------------------------------
delf <sid>hi
delf <sid>gui
delf <sid>cterm

"--------------------------------------------------------------------
" Remove color variables                                            |
"--------------------------------------------------------------------
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
