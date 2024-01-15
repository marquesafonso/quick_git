# quick_git
A set of Powershell commands to simplify a two-branch (main, dev) git workflow. Suitable for individual projects where one follows a linear commit history and works in the dev branch.
<div align="center">
    <img height=200 width=400 src="https://i.kym-cdn.com/entries/icons/original/000/028/021/work.jpg">
</div>

#  Usage

## Clone and Set up

+ Clones a git repo using ssh.
+ Sets up a dev branch.
+ Adds a initialcommit.md file (to overcome times where you initialize an empty repo).
+ Commits and pushes to dev.
+ Merges dev to main and pushes changes to main.
+ Changes back to dev so you can start working.

```
powershell clone_and_setup.ps1 -repo git@github.com:<username>/<reponame>.git
```

Saves you 8 lines of code to set up a repo in *this fashion* :recycle:

## Quick push

Commit and push to a remote branch in a single command. You will need to specify a message.

```
powershell quick_push.ps1
```

It will ask you to provide the commit message.

Saves you a *humble couple* of lines every commit :recycle:

## Quick merge

To be used if, when working alone, you **always work in the dev branch** and use a linear commit "strategy", that is, always merge, commit and push your changes to main once a new feature is done.

After pushing to dev, running the code below will:

+ checkout to main
+ merge dev
+ push to main (remote)
+ checkout to dev

```
powershell quick_push.ps1
```

Saves you 3 lines of code every commit :recycle:
