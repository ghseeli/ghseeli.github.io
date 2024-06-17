---
layout: post
title: "Git for Academic Mathematicians"
date: 2024-06-16
categories: expository
---

One of the most useful practical tools I have learned to use as a writer and programmer is Git.
Git is a version control system that is well-suited to text-based files, like LaTeX or other code, although not exclusively.
There are many benefits to using Git to manage files.

-   Version control means you never have to worry about losing a draft or deleting something permanently;
-   The entire version history is saved locally on your computer;
-   You can sync your entire version history into the cloud with GitHub, Bitbucket, or any other Git cloud service;
-   Git is designed from the ground up for collaboration;
-   Git is incredibly lightweight and works on any modern operating system;
-   Git is agnostic to what type of text files you are using;
-   Git is an industry standard that has existed since 2005.

However, the goal of this article is not really to convince you to use Git, but rather to explain how it may be useful as an academic specifically and how to get started with it.
The upside and downside of Git is that it is quite general, and thus there is a little more to learn than using something like Dropbox or Google Drive.
For any inherently complex system, there is an increased learning curve, and a busy academic may wonder whether the time investment is worth it.
For Git, I would say the answer is yes because it has the ability to handle the various complex use-cases that go into collaborative writing.


## Quick summary (skip ahead for explanations)

Pull changes from remote repository via

    git pull

This command may create merge conflicts if you made local changes and the remote repository changed before you pushed your changes.

Commit changed files via

    git add file1 file2 ... fileN
    git commit

Push changes to remote repository via

    git push

If you are not up to date when you push, then your push will be rejected and you need to pull first.


## A crash course in Git

The smallest unit in Git is called a *commit*.
These commits are then organized into a rooted tree, which is your version history of your *repository* of files. 
By storing all the changes you have ever made to your files, Git has everything it needs to give you any version of your files, including the most current one.


### Commits

A commit contains the changes between two versions of your files, along with a user-provided comment (or message) about the changes.
Here is an example of a commit:

![An example of a commit](https://ghseeli.github.io/img/commit-example.png)

Notice the data of the commit from the user's perspective.
It contains the following information.

-   The author of the commit,
-   The date of the commit,
-   A commit message ("Attempting to fix typo&#x2026;"),
-   A record of which lines of the file have been changed with the changes.

### Making a commit

There are only two commands you have to issue in order to make a commit.

    git add file1 file2 ... fileN
    git commit

Then, you are prompted in a text editor to make a commit message, and after you close it, your commit is made.

The add command tells Git which files you are adding into the commit since you may not want all your changes to all your files added in one commit.
Note, if you did, you can use the `-a` or `--all` flag on the `git commit` command.
The `git commit` command says you are done adding files and ready to bundle your changes into a commit.


### Remote repositories

In principle, if you only want a version control system that runs locally on your computer, then you have everything you need to know to get started.
However, backing up files is an important thing to do, and Git provides you a clean way to do this while also providing a gateway to collaborating on files with other people.
To do this, you need to use a *remote* repository.
A remote repository is just a copy of your rooted tree of commits on another server.
The most popular remote repository at the time of this writing is GitHub, although other alternatives exist.
If you are writing with LaTeX, it could be advantageous to use Overleaf as your remote repository.
It is well-documented how to setup a remote repository on each provider's website, but once you have it setup, you can simply send your commits to the repository via

    git push

and you can retrieve commits from the repository via

    git pull

Furthermore, if you work with collaborators, then you can give them access to the remote repository and they can do the same thing.
Once you are working with other people, it is especially smart to always run a `git pull` command before you get started on changing files in the repository.
If changes happen on your remote repository and you make changes locally before pulling the remote changes, you will have to do a *merge*.
Git will attempt to do the merge automatically.
It is quite intelligent and, for instance, if the remote changes happened on different lines of the file than your local changes, it can merge the changes no problem.
In general, I like to think that Git is checking if the remote commits and the local commits commute as operations on your files, although I do not know if that is how it works in practice or not.
However, if there are changes Git cannot automatically merge, it will present you with both versions in the file and require you to manually merge them and commit your changes before it allows you to proceed.
After a little practice, this is quite an easy thing to do.
It frees you and your collaborators to manage a file in a distributed way and manage conflicts as you go.


### Copying a remote repository onto your own computer

You may be in a situation where a Git repository already exists and you are trying to work on it or modify it.
You can get a local copy using the `git clone` command, which will copy the entire git tree onto your computer, along with configuring the connection to the remote repository.


## How I use Git

One thing I like so much about Git is that it is language agnostic.
Just like any text editor, it does not care whether I am working with `.tex` files, or `.py` files, or `.html` files or whatever else.
It reduces my cognitive load because I only have to use 1 tool to work with many different systems.
However, a powerful companion to my use of Git is the website GitHub. 
GitHub allows me to publicly or privately store my repositories in the cloud and publish websites or `.pdf` files generated from my LaTeX documents, and so on.
Also, Git integrates with the popular cloud-based LaTeX editor Overleaf.
Using Git with Overleaf allows me to keep using my personal text editor, with all my favorite configurations, while being able to share my LaTeX with my collaborators.
So, Git provides the interface between my local work on my computer and the work I put out there on the web, all nicely version controlled and stored safely on the cloud.


## Further resources

This is just the beginning of the functionality of Git.
There are many additional features, such as branches, that I did not cover.
Be sure to take a look at the [Git homepage](https://www.git-scm.com/about/free-and-open-source) for more information. 
There are lots of great tutorials online.

