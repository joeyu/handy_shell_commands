# `bash` tips

## Books

[Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)


## Command line editing
[Readline](https://www.gnu.org/software/bash/manual/bash.html#Command-Line-Editing) 
is used for command line editing

### Setting command-line-editing to vi mode
By default, emacs mode is used for command line editing, but it can be changed
to vi mode.

```
$ set -o vi
```

You could put this setting to file `~/.inputrc` for every invocation of bash
shell:

```
set editing-mode vi
```

It is initially in the `insertion` mode, and pressing `ESC` will enter into
the `normal` mode.

