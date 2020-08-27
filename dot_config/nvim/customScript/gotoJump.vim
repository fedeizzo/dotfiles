function! GotoJump(j)
  " jumps
  " let j = input("Please select your jump: ")
  if a:j != ''
    let pattern = '\v\c^\+'
    if a:j =~ pattern
      let a:j = substitute(a:j, pattern, '', 'g')
      execute "normal " . a:j . "\<c-i>"
    else
      execute "normal " . a:j . "\<c-o>"
    endif
  endif
endfunction
