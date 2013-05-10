" Vim syntax file
"
" This file adds C11 support to c.vim,
" put it in ~/.vim/after/syntax/c.vim

if &filetype != "cpp"
  syn keyword cStatement	_Static_assert
  syn keyword cOperator		_Alignas
endif
syn keyword cStatement	static_assert
syn keyword cOperator	alignas alignof
syn keyword cType	char16_t char32_t

" unicode strings
syn region cUString	start=+\%(U\|u8\=\)"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,cFormat,@Spell
syn match	cUCharacter		"[Uu]'[^\\]'"
syn match	cUCharacter		"[Uu]'[^']*'" contains=cSpecial
if exists("c_gnu")
  syn match	cSpecialError		"[Uu]'\\[^'\"?\\abefnrtv]'"
  syn match	cSpecialUCharacter	"[Uu]'\\['\"?\\abefnrtv]'"
else
  syn match	cSpecialError		"[Uu]'\\[^'\"?\\abfnrtv]'"
  syn match	cSpecialUCharacter	"[Uu]'\\['\"?\\abfnrtv]'"
endif
syn match	cSpecialUCharacter	display "[Uu]'\\\o\{1,3}'"
syn match	cSpecialUCharacter	display "[Uu]'\\x\x\+'"

if version >= 508 || !exists("did_c11_syntax_inits")
  if version < 508
    let did_c11_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cUString		cString
  HiLink cUCharacter		cCharacter
  HiLink cUSpecialCharacter	cSpecialCharacter
  delcommand HiLink
endif

" vim: ts=8 noet
