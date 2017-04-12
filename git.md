# `git` tips

## Branch
### Set branch's upstream
```
$ git branch --set-upstream-to=<remote>/<branch> <branch>
```
### Push to a remote and set it as upstream
```
$ git push --set-upstream <remote> [branch]
```

### Push to another branch on another remote
```
$ git push <remote> <src_commit>:<dst_branch>
```

### Delete a remote branch
```
$ git push <remote> --delete <branch>
```
## Log
## Show commit history of all branches in a tree view
```
$ git log --all --graph -- decorate
```

## Show if a file is being tracked
```
git ls-tree -r HEAD --name-only |grep <file_name>
```
Note: you need to run the above command in the directory that contains the file or whose sub-directory contains the file.

If you want a list of files that ever existed (i.e. including deleted files):
```
git log --pretty=format: --name-only --diff-filter=A | grep <file_name>
```
