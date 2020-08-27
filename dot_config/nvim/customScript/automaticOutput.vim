function! AutomaticOutput()
    let file_type = &filetype
    let currentWord = expand("<cword>")
    let currentLine = getpos(".")[1]
    if file_type == "python"
        let printValue = "print(f'" . currentWord . ": {" . currentWord . "}')"
        for i in range(indent(currentLine))
            let printValue = ' ' . printValue
        endfor
        call append(currentLine, printValue)
    elseif file_type == "nim"
        let printValue = 'echo "' . currentWord . ': ", ' . currentWord
        for i in range(indent(currentLine))
            let printValue = ' ' . printValue
        endfor
        call append(currentLine, printValue)
    elseif file_type == "typescript"
        let printValue = 'console.log("' . currentWord . ': ", ' . currentWord . ")"
        for i in range(indent(currentLine))
            let printValue = ' ' . printValue
        endfor
        call append(currentLine, printValue)
    endif
endfunction
