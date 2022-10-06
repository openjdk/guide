# Project Maintenance

Many OpenJDK projects build on top of the JDK source code for instance to produce new language features, like projects [Amber](https://openjdk.org/projects/amber/) and [Valhalla](https://openjdk.org/projects/valhalla/). When doing this there are a number of common workflows that are dealt with by most project maintainers. For instance, updating the codebase (merging) to bring in the latest changes from the upstream JDK project.

## Merging JDK mainline into a project repository

Merging changes from one git repository to another is basically the same thing as getting your own changes merged into the project repository, with the slight twist that you don't write all the changes yourself, you just pull them from somewhere else.

In this example we'll use a separate clone of the project repository to perform the merge in. This can be done using branches as well, but let's keep it simple for now.

### Init - done once

First set up your personal fork of the project repository, in this example called `my-project`. If you already are a contributor to the project you most likely have this set up. If not, see [Cloning the JDK](#cloning-the-jdk) for details on how to do that.

~~~shell
git clone git@github.com:OpenDuke/my-project.git project-merge
cd project-merge
git remote add upstream git@github.com:openjdk/my-project.git
git remote add mainline git@github.com:openjdk/jdk.git
~~~

We clone the personal fork into a local directory, here called `project-merge`. We then set up two remotes, `upstream` and `mainline`.

### Performing the merge

The clone we set up above is used each time you want to bring changes from mainline in to your project. This is done by first pulling the changes from mainline and then pushing to your personal fork. A regular PR will then be created which you can integrate into your main project repository. It sounds easy, and it is, but there are a few details below to keep in mind.

~~~shell
cd project-merge
git pull upstream master
git push
git switch -c Merge_mainline
git fetch mainline
git merge mainline/master
~~~

We start by updating the local fork with the latest changes from the main project repository. Note that we then create a new branch in which the merge will happen.

The commands above will likely run without a hitch up until the `git merge`. This is where you need to combine the changes that were made in mainline with the changes that have been made in your project repository. If there are no conflicts you're in luck, then the merge will be completely automated and you will end up with a committed merge. If there are conflicts however you'll need to manually go through the files where the conflicts are and make sure you select the correct version for each change. Using `git status` you can see what files that need to be merged. Depending on how much code your project has touched, this can be quite a bit of work.

For complicated merges, see [Sharing the work](#sharing-the-work) below.

### Test before push

Regardless of if you encountered conflicts or not, you should always build and test your merge before pushing it to your project repository. Testing needs to be done even when there are no textual conflicts as changes like for instance a rename can result in a compile or test error without any conflict. One could argue that `git merge --no-commit` could be used and have logical errors fixed in the merge commit. However, a subsequent "Fix logical merge errors" commit, is in fact more useful, as it clearly shows the project specific adjustments needed for incoming changes.

It's always okay to have further commits to clean up after a merge. Hiding a large amount of reworking project code to fit with upstream changes in a single merge commit will make it hard for further errors post integration to be identified.

### The commit

Once you have a working version of your merged code you're ready to create the merge commit and push. Please note that `git commit` is only needed if there were conflicts. If the changes were successfully merged by `git merge`, you already have a committed merge.

~~~
git commit -m "Merge"
git push --set-upstream origin Merge_mainline
~~~

Now it's time to create the PR on GitHub. Just opening the PR page in your browser will most often be enough to see a message about new code that was pushed to your personal fork, with a question if you want to create a PR. You do.

Make sure the name of the PR starts with "Merge". You may have noticed that when you integrate a "normal" PR into an OpenJDK repository, all commits that have been done in that PR will be squashed into a single commit. For normal changes this is a good thing as each PR normally corresponds to a single JBS issue, but for a merge it would be highly undesirable to squash all the different commits that you pull in from mainline. A PR with a name that starts with "Merge" won't be squashed. That means that all the changes that you brought over will remain separate changes.

Wether a merge requires a review or not is up to your project lead to decide. Many projects don't require this so the GitHub bots will allow you to push the merge as soon as the [GHA](#github-actions)s are done. (They actually allow you to push even before the GHAs are done, but that's in general not a good idea.)

Once the PR has been integrated, you can clean up your fork and its clone in preparation for the next merge.

~~~
git switch master
git branch -d Merge_mainline
git push -d origin Merge_mainline
~~~

These commands will remove the temporary branch that we created to perform the merge.


### Sharing the work

When conflicts take place in areas requiring specialized knowledge you may need help from other contributors. Backing up the original conflicts will help if you find yourself "in too deep", and need assistance from other contributors. You can add and later remove these backups, along with a readme describing the merge status, to the actual merge branch to aid communication (i.e. you may not be able to compile certain components).

Something like the following shell one-liner can be used to perform the backup.

~~~shell
git status | grep "both modified:" | while read B M FILE; do cp -v $FILE $DEST ; done
~~~

Below are two different methods of collaborating on a merge described. Please note that extra commits are fine. The merge PR itself will describe any special actions that were taken in case further failures turn up after merge integration. Ultimately these commits will be squashed when integrating the project back into mainline.

#### Parking a merge with conflicts in place

"Park" the conflicts, unresolved, in a personal fork, and let others do the further work (by sending you a patch, or opening your personal fork up to push from other contributors). Do this by keeping a list of unresolved conflicts (perhaps checking in said list to describe the merge state), and then marking them as resolved in git, committing, and pushing them to your personal fork. E.g. `git add $UNRESOLVED_FILES; git commit; git push`

**Pros:** all unresolved conflicts are stated and can be worked on by multiple parties, all at once.

**Cons:** broken branch in terms of compile and test, may require temporary workaround patches to be passed around to complete work on specific unresolved components.

#### Incremental merging

An alternative to parking a merge with conflicts in place, is to incrementally merge up to the troublesome point. For example:

* Perform the initial merge: `git merge $TAG`
* Find yourself in trouble, identify which change is causing the issue.
* Abort: `git merge --abort`
* Find the troublesome change: `git log --topo-order --pretty=oneline --reverse $(current_branch)..$TAG`
* Merge up to the previous change, commit and push.
* Ask others to continue the merge from the troubled change forward, how far forward is up you of course, either just that troublesome change, or the rest of the merge up to the $TAG.
* Rinse and repeat: There may appear further conflicts requiring other contributors help.

**Pros:** all commits in the merge branch compile and test, you always have a working branch.

**Cons:** there is an unknown extra amount of merge work, multiple iterations create more work. For instance you may find yourself resolving the same files multiple times (e.g. back-out commits).

::: {.box}
[To the top](#){.boxheader}
:::
