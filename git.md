# `git` tips

## Branch
### Set branch's upstream
```
$ git branch --set-upstream-to=<remote>/<branch> <branch>
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
