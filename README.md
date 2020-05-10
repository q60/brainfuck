BrainF
======
Yet another brainfuck interpreter and dialect. Written in **Nim**.

![Example](https://i.imgur.com/GhUxNkP.png)

Features
--------
  - *Unlimited tape length*.
  - *Normal comments using*`!`.
  - *Fast*.
  - *Small*.
  - *[Special Vim syntax highlight plugin supporting comment highlight](https://github.com/llathasa-veleth/vim-brainfuck)*.

Installation
------------
### Dependencies:
  - Nim >= 1.0
  - make
  - gzip

Firstly, you need to install **[Nim](https://github.com/nim-lang/Nim)**.

You can build it from source or just install pre-built binaries for your OS.

Then you should build the program.

```sh
git clone https://github.com/llathasa-veleth/brainfuck
cd brainfuck
make build
```

Executable binary: `src/brainf`.

If you want to install it globally to your **$PATH**, you should run `make install` with **sudo**.

For more options run `make help`.

Using
-----
Here are some examples of using the interpreter.

```sh
$ brainf ~/Documents/some_code.bf
Hello world!
$ echo "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>." | brainf
Hello World!
```

Use `man brainf` for help and more information.

TODO
----
  - [ ] *? Multiline comments*.
  - [ ] *? Inline comments*.
  - [ ] *? Optional additional operators*.
