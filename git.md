# `git` tips

## Branch
### Setting branch's upstream
```
$ git branch --set-upstream-to=<remote>/<branch> <branch>
```

### Pushing to a remote and set it as upstream
```
$ git push --set-upstream <remote> [branch]
```

### Showing a branch's upstream
```
$ git branch -avv
```

### Pushing to another branch on another remote
```
$ git push <remote> <src_commit>:<dst_branch>
```

### Checking out a branch from a remote
```
$ git fetch <remote>
$ git checkout -b <local_branch> <remote/remote_branch>
```

### Deleting a remote branch
```
$ git push <remote> --delete <branch>
```

## Log
### Showing commit history of all branches in a tree view
```
$ git log --all --graph --decorate
```

### Showing if a file is being tracked
```
$ git ls-tree -r HEAD --name-only |grep <file_name>
```
Note: you need to run the above command in the directory that contains the file or whose sub-directory contains the file.

If you want a list of files that ever existed (i.e. including deleted files):
```
$ git log --pretty=format: --name-only --diff-filter=A | grep <file_name>
```

## Submodule
### Deleting a submodule
```
$ git deinit <submodule_path>
$ git rm <submodule_path>
```

### Making an existing submodule tracking a remote branch
See [here](https://stackoverflow.com/questions/1777854/how-can-i-specify-a-branch-tag-when-adding-a-git-submodule/18799234#18799234)

```
cd /path/to/your/parent/repo
git config -f .gitmodules submodule.<path>.branch <branch>
```
