import os, re
var
  code = if paramCount() > 0:
    readFile paramStr 1
    else:
      readAll stdin
  tape = newSeq[char]()
  index    = 0
  accessor = 0
proc bf(skip = false): bool =
  let code = re.replacef(code, re"(!.*\n)", "")
  while index >= 0 and accessor < code.len:
    if index >= tape.len:
      tape.add '\0'
    if code[accessor] == '[':
      inc accessor
      let p = accessor
      while bf(tape[index] == '\0'):
        accessor = p
    elif code[accessor] == ']':
      return tape[index] != '\0'
    elif not skip:
      case code[accessor]
      of '+':
        if tape[index] == '\255': tape[index] = '\0'
        else: inc tape[index]
      of '-':
        if tape[index] == '\0': tape[index] = '\255'
        else: dec tape[index]
      of '>': inc index
      of '<': dec index
      of '.': stdout.write tape[index]
      of ',': tape[index] = stdin.readChar
      else: discard
    inc accessor
discard bf()
