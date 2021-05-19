if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "potion"

syntax keyword potionKeyword to  times
syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
syntax keyword potionFunction print join string


highlight link potionKeyword Keyword
highlight link potionFunction Function

syntax match potionComment "\v#.*$"
highlight link potionComment Comment
" 后面的优先级高
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\+"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

highlight link potionOperator Operator

syntax match potionNumber "\v\d+"
highlight link potionNumber Number

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link potionString String
