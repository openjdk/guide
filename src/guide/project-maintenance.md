# Project Maintenance

Many OpenJDK projects build on top of the JDK source code. When doing this there are a number of common workflows that are dealt with by most project maintainers. For instance updating the code (merging) to bring in the latest changes from the upstream JDK project.

## Merging JDK mainline into a project repository

Merging changes from one git repository to another is basically the same thing as getting your own changes merged into the project repository, with the slight twist that you don't write all the changes yourself, you just pull them from somewhere else.

In this example we'll use a separate clone of the project repository to perform the merge in. This can be done using branches as well, but let's keep it simple for now.

### Init - done once

First set up your personal fork of the project repository, in this example called `my-project`. If you already are a contributor to the project you most likely have this set up. If not, see [Cloning the JDK](#cloning-the-jdk) for details on how to do that.

~~~
git clone git@github.com:OpenDuke/my-project.git project-merge
cd project-merge
git remote add upstream git@github.com:openjdk/my-project.git
git remote add mainline git@github.com:openjdk/jdk.git
~~~

We clone the personal fork into a local directory, here called `project-merge`. We then set up two remotes, `upstream` and `mainline`.

### Performing the merge

The clone we set up above is used each time you want to bring changes from mainline in to your project. This is done by first pulling the changes from mainline and then pushing to your personal fork. A regular PR will then be created which you can integrate into your main project repository. It sounds easy, and it is, but there are a few details below to keep in mind.

~~~
cd project-merge
git pull upstream master
git push
git switch -c Merge_mainline
git fetch mainline
git merge mainline/master
~~~

We start by updating the local fork with the latest changes from the main project repository. Note that we then create a new branch in which the merge will happen.

The commands above will likely run without a hitch up until the `git merge`. This is where you need to combine the changes that were made in mainline with the changes that have been made in your project repository. If there are no conflicts you're in luck, then the merge will be completely automated and you will end up with a commit ready to push. If there are conflicts however you'll need to manually go through the files where the conflicts are and make sure you select the correct version for each change. Using `git status` you can see what files that need to be merged. Depending on how much code your project has touched this can be quite a bit of work.

Once you have a working version of your merged code (make sure you test it properly) you're ready to create the commit and push. Please note that `git commit` is only needed if there were conflicts. If the changes were successfully merged by `git merge`, you're already ready to push.

~~~
git commit -m "Merge"
git push --set-upstream origin Merge_mainline
~~~

Now it's time to create the PR on GitHub. Just opening the PR page in your browser will most often be enough to see a message about new code that was pushed to your personal fork, with a question if you want to create a PR. You do.

Make sure the name of the PR starts with "Merge". You may have noticed that when you integrate a "normal" PR into an OpenJDK repository, all commits that have been done in that PR will be squashed into a single commit. For normal changes this is a good thing as each PR normally corresponds to a single JBS issue, but for a merge it would be highly undesirable to squash all the different commits that you pull in from mainline. A PR with a name that starts with "Merge" won't be squashed. That means that all the changes that you brought over will remain separate changes.

Wether a merge requires a review or not is up to your project lead to decide. Many projects don't require this so the GitHub bots will allow you to push the merge as soon as the [GHA](#github-actions)s are done. (They actually allow you to push even before the GHAs are done, but that's in general not a good idea.)

Once the PR has been integrated you can go back to your local clone and clean it up in preparation for the next merge.

~~~
git switch master
git branch -d Merge_mainline
git push -d origin Merge_mainline
~~~

These commands will remove the temporary branch that we created to perform the merge.

::: {.box}
[To the top](#){.boxheader}
:::
