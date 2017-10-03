# `vim` tips

## Showing CR (^M) 
```
:e ++ff=unix
```


## Saving with the `root` privilege
```
:w !sudo tee %
```
Double quote `%` if the file name has spaces.


## Reading a range of lines from a file
The following command reads lines of 10-20 from file `foo` and inserts to the 
current position.
```
:r! sed -n 10,20p foo
```


## Enabling X clipboard in ubuntu

X-window supports two X clipboards for clipboard operations between X-window 
applications: one is the normal clipboard, which is the same as what you 
always use in Windows through the Ctrl-C/V keys; another is the X specific 
clipboard: using mouse left-select for copy and mid-click for paste.

In X terminal, vim requires the "xterm_clipboard" feature to support X 
clipboard. You can check if your installed vim supports this feature by 
running the following command:

```
$ vim --version |grep --color xterm_clipboard
```

If you see "+xterm_clipboard", then it is supported. 

In ubuntu, you can have this feature enabled by `apt-get install` the 
`vim-gnome` or `vim-gtk` packages.

Besides the mouse operations, the xterm_clipboard enabled vim defines two 
registers for accessing to the two clipboards:

Clipboard                   | VIM Rigister
----------------------------| ------------
Normal                      | "+
X specific                  | "*


## Adding to `path` for the `gf` command

The `gf` command and `<C-W><C-F>` for searching `path` for the file whose name 
is what is under the cursor to open.

`path` is a comma-separated list of paths, in each of which the search 
operation will be performed. You may append more items freely, for instance:

```
:let &path.="/usr/local/include,"
```


## Setting the build command
The `make` command actually invokes the shell command line specified in
the `makeprg` variable:
```
:set makeprg=make\ -j8
```


## Marking the line width limit
```
:set colorcolumn=80
:highlight ColorColumn ctermbg=red
```

