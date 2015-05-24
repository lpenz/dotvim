" Vim syntax file
" Language:    crn
" Maintainer:  Leandro Penz <lpenz@terra.com.br>

if exists("b:current_syntax")
  finish
endif

syntax sync minlines=1

syn match crnComment /--.*$/
syn match crnHeadline /^[	 ]*[^ 	]\+:\s*.*$/ contains=crnKey1,crnKey2,crnKey3,crnColongAndVal,crnComment
syn match crnKey1 /^[ 	]*\(Resource\|Holiday\|Milestone\|[Ii]nclude\)\+/ contained nextgroup=crnColonAndVal
syn match crnKey2 /^[ 	]*\(Start\|Task\)\+/ contained nextgroup=crnColonAndVal
syn match crnKey3 /^[ 	]*\(Duration\|Date\|Comment\|Complete\|Estimate\|Float\)\+/ contained nextgroup=crnColonAndVal
syn match crnColonAndVal /:.*$/ contained contains=crnVal,crnComment
syn match crnVal /[^:].*$/ contained contains=crnComment

hi def link crnKey1 Identifier
hi def link crnKey2 Question
hi def link crnKey3 Type
hi def link crnVal String
hi def link crnComment Comment

let b:current_syntax = "crn"

