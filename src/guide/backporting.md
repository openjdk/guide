# Backporting

::: {.box}
[Quick Links]{.boxheader}

* [Push approval for JDK updates](https://openjdk.org/projects/jdk-updates/approval.html)
* [Skara documentation on backports](https://wiki.openjdk.org/display/SKARA/Backports)
:::

Development of the latest version of the JDK often results in bug fixes that might be interesting to include in some of the JDK Update releases still being maintained or in a feature release stabilization branch. Moving a fix from a more recent release train (e.g. JDK 21) to an older release train (e.g. JDK 17) is called *backporting*.

The guideline for what to backport into a specific release will vary over the lifetime of that release. Initially more fixes are expected to be backported as new features and large changes introduced in a mainline release stabilize. Over time the focus will shift from stabilization to keeping it stable - the release will go into maintenance mode. This means that bug fixes that require larger disruptive changes are more likely to be made in mainline and backported to more recent release trains only, and not to older release trains.

Over time it's likely that the code base will diverge between mainline and any given update release, and the cost of backporting will increase. The cost in this case is not only the effort needed to perform the actual backport, but also the cost inferred by bugs introduced by the backport. This should be taken into consideration when deciding if a change should be backported or not. For more details on how to reason around what to backport, [this email from JDK 8 Updates Project lead Andrew Haley](https://mail.openjdk.org/pipermail/jdk8u-dev/2020-June/012002.html) has some guidelines for JDK 8u. The reasoning in this mail is specific to JDK 8u, but will in general apply to any JDK release in maintenance mode.

Any change that originally required a CSR will require a new CSR to be backported unless the backport was covered by the initial CSR. Changes to Java SE specifications cannot be made in an update release without a Java SE Maintenance Release. CSR-related issues affect interfaces and behavior and must be very carefully scrutinized.

## Backporting to a feature release stabilization branch

During ramp down of a feature release there are two branches of the mainline repository in play, the release stabilization branch for the outgoing release, and the `master` branch where the next release is being developed. Any change going into the release stabilization branch is likely to be desired in `master` as well. When making a change intended for both the stabilization branch and `master`, you should always create your pull request targeting `master` first, and then, once the pull request is integrated, backport the resulting commit to the release stabilization branch. For bug fixes that are **only** applicable to the release stabilization branch, regular pull requests targeting the stabilization branch should be created.

Please note that special rules applies during ramp down regarding what can and can't be included into the stabilization branch. See the [The JDK Release Process] for more information.

## Backporting multiple related changes

Ideally fixes should not be backported until there has been enough time for any regressions or follow-on issues to have been identified. Then, when looking to backport a fix the developer should look for both [blocked by]{.jbs-value} and [causes]{.jbs-value} links in order to understand the complete set of fixes that should be backported.

When backporting a number of changes that are dependent on each other, like a change with a tail of bug fixes, it can sometimes seem attractive to merge all those commits into a single change to avoid backporting a broken change. Please don't. The general recommendation is to backport each commit individually. There are several reasons for this recommendation.

If, for instance, there are other changes between the original one and the followup fix(es) there may be a dependency on other changes that are unrelated to the issue itself. By merging the original change, the fix(es), and the unrelated changes to meet the dependency, a single very different change is created. It's unlikely that this change will match the description in the single JBS issue used for the merged backport. Backporting each commit individually will preserve the git history and make it easy to figure out what has actually been backported.

Testing each individual change is more likely to find issues than just testing the single merged change. It's also easier and less error prone to use the `/backport` command on each commit instead of manually cherrypick and deal with the merges etc.

And finally, if backporting each commit individually, the JBS records will clearly indicate that the followup changes have been backported as well. This is important as there is tooling that verifies that everything is done in the right way. That tooling will be confused if it can't deduct from JBS what has happened.

## Working with backports in JBS

::: {.box}
[Terminology]{.boxheader}

Main issue - The top issue in a backport hierarchy. Eg. [JDK-8272373](https://bugs.openjdk.org/browse/JDK-8272373) is a _main issue_, while [JDK-8277498](https://bugs.openjdk.org/browse/JDK-8277498) and [JDK-8277499](https://bugs.openjdk.org/browse/JDK-8277499) are _backport issues_ of this main issue.
:::

::: {style="text-align:center;"}
~~~{.mermaid caption="Example of backport hierarchy" format=svg theme=neutral}
graph TD
  main(JDK-8272373)
  backport1(JDK-8277498)
  backport2(JDK-8277499)
  main --> |backport to JDK 17| backport1
  main --> |backport to JDK 11| backport2
~~~
:::

In general there's no need to create backport issues in JBS manually. All work that's done in JBS in preparation for a backport (requesting approvals etc) is done in the main issue. The backport issue will be created automatically by the bots when you integrate the change to the source code repository.

There can be cases where it's desirable to create a backport issue before the fix is done, e.g. if a CSR needs to be filed. In these cases set the [Fix Version/s]{.jbs-field} of the backport to `N` or `N-pool`, where `N` is the release train the backport is targeting. E.g. `17-pool`. Please note that even if a backport issue is created ahead of time, all work done in JBS for approvals and similar is still done in the main issue.

Obviously it's possible to set the [Fix Version/s]{.jbs-field} to the exact release the backport is targeting, but in general this isn't recommended unless you are targeting a feature release in ramp down. When a change is integrated to an update release repository, the bots will look at the main issue as indicated in the PR title, and look for backports with the current `N.0.x` release version as [Fix Version/s]{.jbs-field}, if no such backport is found they will look for `N-pool`, and if that isn't found either, a new backport issue will be created. This means that if the backport has an exact [Fix Version/s]{.jbs-field} set, but is delayed and misses the release indicated by this [Fix Version/s]{.jbs-field}, a new, superfluous backport issue is created with a small mess as the result. (See [How to fix an incorrect backport creation in JBS].)

Setting the [Fix Version/s]{.jbs-field} of a backport targeted to an update release to `N` is always wrong. JDK `N` has already been released (or it wouldn't be an update release) and can't get any more fixes.

## Requesting approvals for backports

In order to be allowed to integrate a change to one of the OpenJDK update development repositories (e.g. [`jdk17u-dev`](https://github.com/openjdk/jdk17u-dev)), an approval is required. The [official process for how to request push approval for a backport](https://openjdk.org/projects/jdk-updates/approval.html) describes in detail how to work with JBS when requesting approvals. In short, there's a label [jdk&lt;release&gt;u-fix-request]{.jbs-label} that should be added to the main JBS issue. Also put a motivation as to why the issue needs to be backported as a comment in the main issue. Once the label and motivation has been added, wait for the maintainers of the release to approve your request. The approval will be indicated with a label, [jdk&lt;release&gt;u-fix-yes]{.jbs-label}, added to the main issue.

If the update release is in ramp down, changes are integrated to the release repository (e.g. [`jdk17u`](https://github.com/openjdk/jdk17u)). During ramp down the bar to get changes in is significantly higher and fixes need to be approved with [jdk&lt;release&gt;u-critical-request]{.jbs-label} / [jdk&lt;release&gt;u-critical-yes]{.jbs-label}.

If your request to backport a change is denied, but you for some reason already created the backport issue in JBS (why?!), the backport issue should be closed as [Won't Fix]{.jbs-value}.

## Using the Skara tooling to help with backports

The Skara tooling includes support for backports. [The official Skara documentation](https://wiki.openjdk.org/display/SKARA/Backports) describes in detail how to work with the tooling to create backport PRs on [GitHub](https://github.com) or using the CLI tools. As described in the documentation, the [`/backport`](https://wiki.openjdk.org/display/SKARA/Commit+Commands#CommitCommands-/backport) command can be used on a commit or a PR to create the backport PR:

    /backport :jdk25

In this example we backport the change to a stabilization branch, in this case JDK 25.

    /backport jdk25u
    /backport jdk25u-dev

In this second example we backport a change to the JDK 25 update release. The difference between `jdk25u` and `jdk25u-dev` is that `jdk25u` is used for the two first update releases (25.0.1 and 25.0.2), while `jdk25u-dev` is used for any later OpenJDK JDK 25 update releases. To backport to other update releases, replace `jdk25u` with the corresponding name for the target update repository.

Using the `/backport` command is the recommended way to perform backports as the tooling will automatically handle all the necessary steps in the background. If a backport PR is manually created, set the PR title to `Backport <original commit hash>`. This ensures that the bots will recognize it as a backport as opposed to a main fix specifically targeting an older release. One can tell whether or not the bots recognized a PR as a backport by the [backport]{.label} label being added if it's recognized.

## How to fix an incorrect backport creation in JBS

If an issue is targeted to a release and a fix referring to that issue is integrated to a different release repository, then a backport issue is automatically created in JBS. Usually this is a "good thing", e.g., when you are backporting a fix to an earlier release, but not always... If the main issue is targeted to a later release (due to schedule planning) but someone finds the time to fix that issue in the current release, or if the main issue is targeted to a feature release in ramp down and the fix is integrated to the master branch, then the issue should be retargeted to the correct release before integrating the fix. However, sometimes we forget.

Here's how to fix that:

::: {.note}
In this example a fix was integrated to JDK N+1 (the mainline master branch) while the JBS bug was targeted to JDK N (a feature release in ramp down). The same procedure can be used in the opposite situation, when a fix has been integrated to JDK N when the JBS bug was targeted to JDK N+1, by switching N and N+1 below. Remember, to keep the record clean for the future, what matters the most is that the **bug id used in the commit comment is the main bug**, and that **the "backports"** (regardless of if they are to earlier or later releases) **are Backport type issues of that main issue**. Also make sure there are never more than one Backport issue of the same main issue targeted to any given release.
:::

#. Reopen the _backport_ issue that was created automatically
   * Use a comment like the following (in the reopen dialog):
~~~
This change was integrated while the main issue was targeted to 'N'. The main issue has been reset to fixed in 'N+1', this backport issue has been reset to fix in 'na' and closed as Not An Issue to avoid confusion.
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
This change was integrated to 'N+1' while this main issue was targeted to 'N'. This issue has been reset to fixed in 'N+1' and the Robo Duke entry was copied here.
~~~
   * Reset the _main_ issue [Fix Version/s]{.jbs-field} from 'N' to 'N+1'.
   * Resolve the _main_ issue as [Fixed]{.jbs-value} in build "team" or in build "master" depending on where the fix was integrated - or to an actual build number if the change has already made it to a promoted build (look in the _backport_ issue if you are unsure). Integrations to 'openjdk/jdk' are fixed in build "master" and integrations to other Project repositories are fixed in build "team".

::: {.box}
[To the top](#){.boxheader}
:::
