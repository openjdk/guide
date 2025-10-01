# Working With Pull Requests

::: {.box}
[Quick Links]{.boxheader}

* [Skara documentation on PR commands](https://wiki.openjdk.org/display/SKARA/Pull+Request+Commands)
:::

Once you have made a change that you want to integrate into an OpenJDK code base you need to create a _Pull Request_ (PR) on [GitHub](https://github.com). This section assumes that you have previous experience from using git and [GitHub](https://github.com), and won't go into details of how those work. Still, the aim is of course to provide a useful guide, so [send an email](#about-this-guide) if more details are needed.

This section also assumes that you have already read [I have a patch, what do I do?] and followed **all** the steps there.

::: {.note}
Please note that the description of a change should always be in the JBS issue. The [GitHub](https://github.com) PR can be a good place to discuss technical implementation details regarding your change, but it's not the right place to describe the problem. Make sure you have a proper problem description in your JBS issue before publishing a PR.
:::

## Think once more

All code reviews in OpenJDK are done in public. Once you open your PR for public review the internet can see it and comment on it. Make sure your code is ready for it. Look through your comments, make sure that temporary code is gone, and make sure you have sanitized your method and variable names. Also, make sure you understand your code. Why is it working? What are the potential pitfalls? What are the edge-cases? If you haven't already answered all these questions in the mail conversation that preceded this PR, it's likely that you will need to answer them during the review.

It's also worth taking the extra time to see if the change can be split into a few different separate changes. A large change will take more effort and thus attract fewer [Reviewers](https://openjdk.org/bylaws#reviewer). Smaller changes will get reviewed faster and get better quality reviews. You can compare proposing a single large change to proposing ten individual small unrelated changes. What happens in practice when all these ten changes are presented as one PR is that there's a focus on say 5-6 of these smaller changes and no one really looks hard at the other 4-5. For complexity, even small changes that are hard to understand and test may be risky.

The timing of your change will also affect the availability of reviewers. The JDK runs on a [six-months release cadence](#release-cycle). During the months around the start of the ramp down phase most area experts will be busy working on their own changes and reviewing major features that are planned for the release. If you propose a change during this period (basically May-June, or November-December) it may take a long time before you get the required reviews.

## Rebase before creating the PR

It's likely that other people have integrated changes to the code base since you created your branch. Make sure to pull the latest changes and rebase your fix on top of that before creating your PR. This is a courtesy issue. Your reviewers shouldn't have to read your patch on top of old code that has since changed. This is hopefully obvious in cases where the upstream code has gone through cleanups or refactorings, and your patch may need similar cleanups in order to even compile. But even in cases where only smaller changes have been done, the reviewers shouldn't have to react to issues like "that line of code was moved last week, why is it back there?".

Most changes are made to the `master` branch of the mainline repository. In these cases, rebase using:

~~~
git rebase master
~~~

Note that if you are working on a backport to a stabilization branch you should replace `master` above with the name of the branch you are targeting. This would be the same name as when you cloned the branch.

After the PR has been published, rebasing, force-pushing, and similar actions are strongly discouraged. Such actions will disrupt the workflow for reviewers who fetch the PR branch. Pushing new changes is fine (and even merging if necessary) for a PR under review. Incremental diffs and other tools will help your reviewers see what you have changed. In the end, all commits will be squashed into a single commit automatically, so there're actually no drawbacks whatsoever to making commits to a PR branch during review.

## Final check before creating the PR

Creating the PR is essentially the same as asking a large group of people to start reviewing your change. Before doing that, you want to make sure your change is done in every detail you have the power to control. These are a few of the things you should think about in order to avoid wasting people's time on an unfinished change. (You may think that some of these are too obvious to even mention, but all of them are things that in the past have caused actual failures that broke the JDK for **all** developers out there.)

* Is the copyright statement at the top of each modified source file correct?

* Did you run a full build and all relevant tests on the **final** version of the change? It's important to do this on the truly final version, as even an apparently trivial change in a comment can break the build.

* Did you `git add` all new files?

* Did you add regression tests for your change?

* Did you run those new regression tests?

If you are unsure of any of these things but still want to go ahead and create the PR, **don't!**

If you have an actual reason to create a PR before the change is all done, make sure to create it in `DRAFT` mode. The bot won't add the `rfr` label or send emails to labeled [Groups](https://openjdk.org/bylaws#group) as long as the PR is in `DRAFT` mode.

## Life of a PR

#. **Make sure the PR is reviewable**

   There are changes that span across several areas, for example wide spread cleanups or the introduction of a new language feature. Accordingly, the number of lines of code touched can be quite large, which makes it harder to review the entire PR. In such cases, it may make sense to split the change into several PRs, most commonly by grouping them by module or area.

#. **Make sure you target the correct branch**

   Many project repositories have several branches. Make sure your PR targets the correct one. This is of course especially important when not targeting the default branch. At the top of your PR, right below the title, it will say "NNN wants to merge X commit(s) into [branch]". A typical red flag to watch out for is if your PR seems to include commits or changed files that shouldn't be part of your integration. E.g. Seeing the "Start of release updates for JDK N" when backporting something to JDK N-1 is a bad sign.

#. **Set a correctly formatted title**

   The title of the PR should be of the form "`nnnnnnn: Title of JBS issue`" where `nnnnnnn` is the JBS issue id of the main JBS issue that is being fixed, and the `Title of JBS issue` is the exact title of the issue as written in JBS. In fact, the title can be set to _only_ the JBS issue id (`nnnnnnn`) in which case the bot will fetch the title from JBS automatically. If you are creating a backport PR, see [Using the Skara tooling to help with backports] for more details on the title requirements.

#. **Write a useful description**

   The description of the PR should state what problem is being solved and shortly describe how it's solved. The PR description should also list what testing has been done. [Reviewers](https://openjdk.org/bylaws#reviewer) and other interested readers are referred to the text in the JBS issue for details, but the description should be enough to give an overview. This assumes there's useful information in the JBS issue, like an evaluation etc. If not, add it.

   Remember that the description is included in many emails sent to lists with many receivers, so a too long description can cause a lot of noise, while of course a too short description won't give the reader enough information to perform the review. If you have a lot of information you wish to add to your PR, like performance evaluations, you can put that in a separate comment in the PR.

#. **Finish the change before publishing it**

   Each update to a published PR will result in emails being sent to all relevant lists. This is per design and it's how we want it to be, but it also mean that if you publish a PR before you have gone through the final check mentioned above, and later find that a few more updates are necessary, a lot of people will get a lot of emails.

#. **Make sure all relevant [Groups](https://openjdk.org/bylaws#group) are included**

   The bot will make an attempt to include the [Groups](https://openjdk.org/bylaws#group) that need to review your change based on the location of the source code you have changed. There may be aspects of your change that are relevant to other [Groups](https://openjdk.org/bylaws#group) as well, and the mapping from source to [Groups](https://openjdk.org/bylaws#group) isn't always perfect, so make sure all relevant [Groups](https://openjdk.org/bylaws#group) have been included, and add new labels using [`/label`](https://wiki.openjdk.org/display/SKARA/Pull+Request+Commands#PullRequestCommands-/label) if needed. Consult the [Code Owners](#code-owners) section if you are unsure of who owns the code you are changing.

#. **Allow enough time for review**

   In general all PRs should be open for at least 24 hours to allow for reviewers in all time zones to get a chance to see it. It may actually happen that even 24 hours isn't enough. Take into account weekends, holidays, and vacation times throughout the world and you'll realize that a change that requires more than just a trivial review may have to be open for a while. In some areas [trivial changes] are allowed to be integrated without the 24 hour delay. Ask your reviewers if you think this applies to your change.

#. **Get the required reviews**

   At least one [Reviewer](https://openjdk.org/bylaws#reviewer) knowledgeable in each area being changed must approve every change. A change may therefore require multiple [Reviewers](https://openjdk.org/bylaws#reviewer) because it affects multiple areas. Some areas (e.g. Client and HotSpot) require two reviewers in most cases, so be sure to read the relevant [OpenJDK Group](https://openjdk.org/bylaws#group) pages for advice or ask your [sponsor](#reviewing-and-sponsoring-a-change).

   Be open to comments and polite in replies. Remember that the reviewer wants to improve the world just as much as you do, only in a slightly different way. If you don't understand some comment, ask the reviewer to clarify. Accept authority when applicable. If you're making changes in an area where you're not the area expert, acknowledge that your reviewers may be. Take their advice seriously, even if it is to not make the change. There are many reasons [why a change may get rejected](#why-is-my-change-rejected). And you did read the section [Things to consider before proposing changes to OpenJDK code], right?

#. **Updating the PR**

   You may need to change the code in response to review comments. To do this, simply commit new changes and push them onto the PR branch. The PR will be updated automatically. Multiple commits to the branch will be squashed into a single commit when the PR is eventually integrated.

   If the set of files in the PR has changed, this may affect the [Groups](https://openjdk.org/bylaws#group) that need to review the PR. Make sure to adjust the PR labels accordingly.

   If you want to update the title of the PR, remember that the one and only truth is the JBS issue, so the title must first be changed there.

   After having made all updates needed to get to the final version of the change, remember to re-run relevant testing. Even minor changes may go bad and you don't want to cause (another) build failure due to an updated comment.

#. **Merge the latest changes**

   If your PR is out for review for a longer time it's a good habit to pull from the target repository regularly to keep the change up to date. This will make it easier to review the change and it will help you find issues caused by other changes sooner. Typically this involves fetching changes from the `master` branch of the main JDK repo, merging them into your local branch, resolving conflicts if necessary, and then pushing these changes to the PR branch. Pushing additional commits and merges into the PR branch is fine; they will be squashed into a single commit when the PR is integrated. Avoid rebasing changes, and prefer merging instead.

   If your PR is targeting some other branch than `master`, make sure to merge the correct upstream branch (the target branch). Verify that your PR doesn't include changes from some other branch (e.g. `master`) that aren't supposed to be there.

   Once changes have been merged, rerun all relevant testing even if you think nothing in the merge affected your change. The [GHA testing](#github-actions) that's done automatically by [GitHub](https://github.com) should only be seen as a smoke test that finds the most severe problems. It's highly unlikely that it will test your actual change in any greater detail - or even at all execute the code that you have changed in most cases.

#. **Integrate your change**

   When you have the required reviews and have made sure all relevant areas have had a chance to look at your change, integrate by entering the command [`/integrate`](https://wiki.openjdk.org/display/SKARA/Pull+Request+Commands#PullRequestCommands-/integrate) in a comment on the PR. If you are not yet a [Committer](https://openjdk.org/bylaws#committer) in the [Project](https://openjdk.org/bylaws#project), ask your [sponsor](#reviewing-and-sponsoring-a-change) to enter the command [`/sponsor`](https://wiki.openjdk.org/display/SKARA/Pull+Request+Commands#PullRequestCommands-/sponsor) in the PR as well in order for your change to be allowed to be integrated.

#. **After integration**

   After you have integrated your change you are expected to stay around in case there are any issues with it. As mentioned above, you are expected to have run all relevant testing on your change before integrating your PR, but regardless of how thorough you test it, things might slip through. After your change has been integrated an automatic pipeline of tests is triggered and your change will be tested on a variety of platforms and in a variety of different modes that the JDK can be executed in. A change that causes failures in this testing may be backed out if a fix can't be provided fast enough, or if the developer isn't responsive when noticed about the failure. Note that this directive should be interpreted as "it's a really bad idea to integrate a change the last thing you do before bedtime, or the day before going on vacation".

## Webrevs

::: {.box}
[Quick Links]{.boxheader}

* [Webrev Source Repository](https://github.com/openjdk/webrev)
* [Webrev Mailing List](https://mail.openjdk.org/pipermail/webrev-dev/)
:::

As all [OpenJDK Projects](https://openjdk.org/bylaws#project) are hosted on [GitHub](https://github.com), most code reviews takes place there. When you publish a PR to an OpenJDK repository the corresponding JBS issue will get a link to the code review in the PR, making this the natural place to go for review. OpenJDK do however provide other tools and infrastructure for code reviews as well: The **webrevs**.

Webrev refers to both the tool used to create them and its output. The script, [`webrev.ksh`](https://github.com/openjdk/webrev/blob/master/webrev.ksh), is maintained in the [Code Tools Project](../projects/code-tools). Please note that this version of webrev is for use with mercurial and won't work with the git based repositories. You don't actually need tools like this anymore unless you want to host code reviews in other locations than [GitHub](https://github.com).

On the GitHub reviews you will find links to webrevs. These are automatically generated by the bot and are provided as a complement for those who prefer this style of code review. Many OpenJDK developers are used to the webrevs as this was the default way to provide code for review before OpenJDK moved to [GitHub](https://github.com). Though webrevs are mainly deprecated today, they used to be a central part of OpenJDK development and you may still see people use the word as a synonym for code review, so they do deserve to be mentioned here as well.

## File storage for OpenJDK artifacts - `cr.openjdk.org`

The `cr.openjdk.org` server provides storage and display of code review materials such as webrevs and other artifacts related to the OpenJDK Community. This area can also be used to store design documents and other documentation related OpenJDK but not related to any specific [Project](https://openjdk.org/bylaws#project) that have an OpenJDK wiki space for such purposes.

Any OpenJDK [Author](https://openjdk.org/bylaws#author) can publish materials on the `cr.openjdk.org` server. Users can upload files to temporary storage using secure methods (`rsync`, `scp`, and `sftp`).

This site is for open source materials related to the OpenJDK Community only. Users uploading inappropriate materials will lose access and the material will be deleted. Please review the [Terms of Use](https://openjdk.org/legal/terms.html) before using this server.

### Get your SSH key installed

To use `cr.openjdk.org` you'll need to get an SSH key installed. See [Generating an SSH key] for guidance on how to generate a key. Your public key (`~/.ssh/id_rsa.pub`) should be mailed as an attachment along with your JDK username to [keys@openjdk.org](mailto:keys@openjdk.org). An administrator will install your key on the server and notify you on completion. This process may take a couple of days.

::: {.note}
Users behind a SOCKS firewall can add a directive to the `~/.ssh/config` file to connect to the OpenJDK server:

    Host *.openjdk.org
    ProxyCommand /usr/lib/ssh/ssh-socks5-proxy-connect -h [socks_proxy_address] %h %p

See the `ssh-socks5-proxy-connect` man page and `ssh-config` man page for more information. Other systems may require proxy access via other programs. Some Linux distributions provide the `corkscrew` package which provides ssh access through HTTP proxies.

**It's recommended that all users check with their network administrators before installing any kind of TCP forwarding tool on their network. Many corporations and institutions have strict security policies in this area.**
:::

::: {.box}
[To the top](#){.boxheader}
:::
