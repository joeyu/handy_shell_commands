# `AOSP` and `repo` related tips

## How to tag a set of projects revisions?

To tag a set of projects revisions:

```
$ repo forall -c 'git tag my_revisions_tag'
```

Then later you can checkout this tagged set of revisions any time by:

```
$ repo forall -c 'git checkout my_revisions_tag'
```

This is especially useful when you want to check out some specific project revisions.

## Do NOT `repo sync` a branch that you don't want to rebase!

This is because `repo sync` invokes `git remote update && git rebase` on each of your specified projects. If a merge is expected, the following commands might be helpful:

```
$ repo forall -c 'git merge branch_to_merge'
```

## How to use an AOSP repo mirror when checking out a third-party Android repo?

An Android repo consists of 200+ projects. Most of the projects of a third-party's Android repo actually just point to the corresponding ones of the AOSP repo, meaning they share the same projects. If you have a local AOSP source mirror, you can use it to save your internet bandwidth (hence your time) enormously when checking out the third-party's repo. For how to establish an AOSP repo mirror, please see section [Using a local mirror](http://source.android.com/source/downloading.html#using-a-local-mirror)

Assuming you have a third-party Android repo located in `git://git.insignal.co.kr/samsung/exynos/android/`, and you have an AOSP mirror in `/path/to/local/aosp/mirror`, you can save your time by:

```
repo init -u git://git.insignal.co.kr/samsung/exynos/android/manifest.git -b jb --reference=/path/to/local/aosp/mirror
```
