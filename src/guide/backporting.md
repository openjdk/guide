# Backporting

::: {.box}
[Quick Links]{.boxheader}

* [Push approval for JDK updates](https://openjdk.org/projects/jdk-updates/approval.html)
* [Skara documentation on backports](https://wiki.openjdk.org/display/SKARA/Backports)
:::

Development of the latest version of the JDK often results in bug fixes that might be interesting to include in some of the JDK update releases still being maintained. Moving a fix from a more recent release train (e.g. JDK 21) to an older release train (e.g. JDK 17) is called *backporting*.

The guideline for what to backport into a specific update release will vary over the lifetime of that release. Initially more fixes are expected to be backported as new features and large changes introduced in a mainline release stabilize. Over time the focus will shift from stabilization to keeping it stable - the release will go into maintenance mode. This means that bug fixes that require larger disruptive changes are more likely to be made in mainline and backported to more recent release trains only, and not to older release trains.

Over time it's likely that the code base will diverge between mainline and any given update release, and the cost of backporting will increase. The cost in this case is not only the effort needed to perform the actual backport, but also the cost inferred by bugs introduced by the backport. This should be taken into consideration when deciding if a change should be backported or not. For more details on how to reason around what to backport, [this email from JDK 8 Updates Project lead Andrew Haley](https://mail.openjdk.org/pipermail/jdk8u-dev/2020-June/012002.html) has some guidelines for JDK 8u. The reasoning in this mail is specific to JDK 8u, but will in general apply to any JDK release in maintenance mode.

Any change that originally required a CSR will require a new CSR to be backported unless the backport was covered by the initial CSR. Changes to Java SE specifications cannot be made in an update release without a Java SE Maintenance Release. CSR-related issues affect interfaces and behavior and must be very carefully scrutinized.

## Working with backports in JBS

::: {.box}
[Terminology]{.boxheader}

Main issue - The top issue in a backport hierarchy. Eg. [JDK-8272373](https://bugs.openjdk.org/browse/JDK-8272373) is a main issue, while [JDK-8277498](https://bugs.openjdk.org/browse/JDK-8277498) and [JDK-8277499](https://bugs.openjdk.org/browse/JDK-8277499) are backport issues of this main issue.
:::

::: {style="text-align:center;"}
~~~{.mermaid caption="Example of backport hierarchy" format=svg theme=neutral}
graph TD
  main(JDK-8272373)
  backport1(JDK-8277498)
  backport2(JDK-8277499)
  main --> |backport| backport1
  main --> |backport| backport2
~~~
:::

In general there's no need to create backport issues in JBS manually. All work that's done in JBS in preparation for a backport (requesting approvals etc) is done in the main issue. The backport issue will be created automatically by the bots when you integrate the change to the source code repository.

There can be cases where it's desirable to create a backport issue before the fix is done, e.g. if a CSR needs to be filed. In these cases set the [Fix Version/s]{.jbs-field} of the backport to `N` or `N-pool`, where `N` is the release train the backport is targeting. E.g. `17-pool`. Please note that even if a backport issue is created ahead of time, all work done in JBS for approvals and similar is still done in the main issue.

Obviously it's possible to set the [Fix Version/s]{.jbs-field} to the exact release the backport is targeting, but in general this isn't recommended unless you are targeting a feature release in rampdown. When a change is pushed to an update release repository, the bots will look at the main issue as indicated in the PR title, and look for backports with the current `N.0.x` release version as [Fix Version/s]{.jbs-field}, if no such backport is found they will look for `N-pool`, and if that isn't found either, a new backport issue will be created. This means that if the backport has an exact [Fix Version/s]{.jbs-field} set, but is delayed and misses the release indicated by this [Fix Version/s]{.jbs-field}, a new backport issue is created with a small mess as the result. (See [How to fix an incorrect backport creation in JBS](#how-to-fix-an-incorrect-backport-creation-in-jbs).)

Setting the [Fix Version/s]{.jbs-field} of a backport targeted to an update release to `N` is always wrong. JDK `N` has already been released (or it wouldn't be an update release) and can't get any more fixes.

## Requesting approvals for backports

In order to be allowed to push a change to one of the OpenJDK update development repositories (e.g. [`jdk17u-dev`](https://github.com/openjdk/jdk17u-dev)), an approval is required. The [official process for how to request push approval for a backport](https://openjdk.org/projects/jdk-updates/approval.html) describes in detail how to work with JBS when requesting approvals. In short, there's a label [jdk&lt;release&gt;u-fix-request]{.jbs-label} that should be added to the main JBS issue. Also put a motivation as to why the issue needs to be backported as a comment in the main issue. Once the label and motivation has been added, wait for the maintainers of the release to approve your request. The approval will be indicated with a label, [jdk&lt;release&gt;u-fix-yes]{.jbs-label}, added to the main issue.

If the update release is in rampdown, changes are pushed to the release repository (e.g. [`jdk17u`](https://github.com/openjdk/jdk17u)). During rampdown the bar to get changes in are significantly higher and fixes need to be approved with [jdk&lt;release&gt;u-critical-request]{.jbs-label} / [jdk&lt;release&gt;u-critical-yes]{.jbs-label}.

## Using the Skara tooling to help with backports

The Skara tooling includes support for backports. [The official Skara documentation](https://wiki.openjdk.org/display/SKARA/Backports) describes in detail how to work with the tooling to create backport PRs on GitHub or using the CLI tools. As described in the documentation, the [`/backport`](https://wiki.openjdk.org/display/SKARA/Commit+Commands#CommitCommands-/backport) command can be used on a commit (not a PR!) to create the backport PR. If a backport PR is manually created, set the PR title to `Backport <original commit hash>`. This ensures that the bots will recognize it as a backport as opposed to a main fix specifically targeting an older release. One can tell whether or not the bots recognized a PR as a backport by the [backport]{.label} label being added if it's recognized.

## How to fix an incorrect backport creation in JBS

If an issue is targeted to a release and a fix referring to that issue is pushed to a different release repository, then a backport issue is automatically created in JBS. Usually this is a "good thing", e.g., when you are backporting a fix to an earlier release, but not always... If the main issue is targeted to a later release (due to schedule planning) but someone finds the time to fix that issue in the current release, or if the main issue is targeted to a feature release in rampdown and the fix is pushed to the mainline repository, then the issue should be retargeted to the correct release before pushing the fix. However, sometimes we forget to do that.

Here's how to fix that:

> ---
>
> In this example a fix was pushed to JDK N+1 (the mainline repository) while the JBS bug was targeted to JDK N (a feature release in rampdown). The same procedure can be used in the opposite situation, when a fix has been pushed to JDK N when the JBS bug was targeted to JDK N+1, by switching N and N+1 below. Remember, to keep the record clean for the future, what matters the most is that the **bug id used in the commit comment is the main bug**, and that **the "backports"** (regardless of if they are to earlier or later releases) **are Backport type issues of that main issue**. Also make sure there are never more than one Backport issue of the same main issue targeted to any given release.
>
> ---

#. Reopen the _backport_ issue that was created automatically
   * Use a comment like the following (in the reopen dialog):
~~~
Fix was pushed while main issue was targeted to 'N'. Reset the main issue to fixed in 'N+1', reset this issue to fix in 'na' and closed as [Not An Issue]{.jbs-value} to avoid confusion.
~~~
   * Change the [Fix Version/s]{.jbs-field} from 'N+1' to 'na'.
   * Close the _backport_ issue as [Not an Issue]{.jbs-value}. Note: [Closed]{.jbs-value}, **not** [Resolved]{.jbs-value}

   Even if you intend to backport the issue from 'N+1' to 'N' you shouldn't reuse this backport issue. The existing (bad) push notification comment and the later to be added correct push notification comment will look very similar and it's just a disaster waiting to happen to deliberately add these to the same issue.

#. Clean up the _main_ issue
   * Copy the push notification comment from the _backport_ issue to the _main_ issue, e.g.:
~~~
Changeset: 12345678
Author: Duke <duke@openjdk.org>
Date: 2020-10-23 15:37:46 +0000
URL: https://git.openjdk.org/jdk/commit/12345678
~~~
   * Add a comment like the following to the _main_ issue:
~~~
Fix was pushed while main issue was targeted to 'N'. Reset the main issue to fixed in 'N+1' and copied the Robo Duke entry here.
~~~
   * Reset the _main_ issue [Fix Version/s]{.jbs-field} from 'N' to 'N+1'.
   * Resolve the _main_ issue as [Fixed]{.jbs-value} in build "team" or in build "master" depending on where the fix was pushed - or to an actual build number if the change has already made it to a promoted build (look in the _backport_ issue if you are unsure). Pushes to 'openjdk/jdk' are fixed in build "master" and pushes to project repositories are fixed in build "team".

::: {.box}
[To the top](#){.boxheader}
:::
