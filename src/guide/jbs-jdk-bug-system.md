# JBS - JDK Bug System

::: {.box}
[Quick Links]{.boxheader}

* [Bug Report Tool](https://bugreport.java.com/)
* [JDK Bug System (JBS)](https://bugs.openjdk.org/)
:::

[JBS](https://bugs.openjdk.org/) is a public issue tracker used by many [OpenJDK Projects](https://openjdk.org/bylaws#project) and is open for anyone to read and search. To get write access you need to be registered in the [OpenJDK Census](https://openjdk.org/census) by becoming, for instance, an [Author](https://openjdk.org/bylaws#author) in an [OpenJDK Project](https://openjdk.org/bylaws#project).

## Filing an issue

When a new failure is found, or an improvement identified, an issue should be filed to describe and track its resolution. Depending on your role in OpenJDK you can either use the [Bug Report Tool](https://bugreport.java.com/) or, if you are registered in the [OpenJDK Census](https://openjdk.org/census), you can report the issue directly in [JBS](https://bugs.openjdk.org/).

When filing an issue, try to make the report as complete as possible in order to make it easier to triage, investigate and resolve the issue. Bug descriptions and comments should be written in a professional manner.

::: {.note}
If you suspect that the issue is a vulnerability, **don't file a JBS issue!** Instead send your report to [vuln-report@openjdk.org](mailto:vuln-report@openjdk.org). Also use this alias if you find an existing report which may cover a vulnerability - please do *not* report or discuss potential vulnerabilities on any open lists or other public channels - see [OpenJDK Vulnerabilities](https://openjdk.org/groups/vulnerability/report) for more information.
:::

A few things to keep in mind when filing an issue:

* Before filing, verify that there isn't an open issue already filed.
  * Search [JBS](https://bugs.openjdk.org/) for things like the name of the failing test, assert messages, the name of the source code file where a crash occurred etc.
  * If you find a similar issue that was closed as [Cannot Reproduce]{.jbs-value} then it may be appropriate to re-open that one - if you don't have direct access to JBS you can file a bug using the [Bug Report Tool](https://bugreport.java.com/) requesting that it be reopened.
* Make a reasonable attempt to narrow down which build or release the failure first appeared in.
* Set [Affects Version/s]{.jbs-field} to the earliest JDK version where the failure was seen.
  * If the failure is found in an update train of the JDK (e.g. 11.0.x), please see (if possible) if it's also present in [mainline](https://github.com/openjdk/jdk). See [Indicating what releases an issue is applicable to](#indicating-what-releases-an-issue-is-applicable-to) for more details.
  * All issues of type [Bug]{.jbs-value} must have the [Affects Version/s]{.jbs-field} set. It's not a bug if it doesn't affect some version.
  * For enhancements the [Affects Version/s]{.jbs-field} should be left empty, unless it is only relevant to a specific release family.
* Never set [FixVersion/s]{.jbs-field} to an already released version. If you intend for the change to be fixed in a JDK 21 update, set [FixVersion/s]{.jbs-field} to [21-pool]{.jbs-value}. A fix version of [21]{.jbs-value} would indicate the mainline release of JDK 21, which was released in 2023, and it is too late to add more changes there.
* Add relevant [Labels]{.jbs-field} like [[intermittent]{.jbs-label}](#intermittent), [[regression]{.jbs-label}](#regression), [[noreg-self]{.jbs-label}](#noreg-self), [[tier1]{.jbs-label}](#tier) etc.
  * For more information see the [JBS Label Dictionary].
* Set the priority.
  * It's not the reporter's responsibility to set a correct priority, this will be done later in [triage](#triaging-an-issue), but a qualified guess is always better than the default. In JBS the range of priorities go from P1 (High/Important) to P5 (Very Low/Not Important), with the default being P4.
  * If you have a sense that the issue is critical, or not critical at all, then adjusting the priority higher or lower makes sense, otherwise you can leave it as the default.
  * When setting the priority, consider things like how the bug impacts the product and our testing, how likely is it that the bug is triggered, how difficult is it to work around, and whether it's a regression, since that may break existing applications. Regressions are often higher priority than long-standing bugs and may block a release if not fixed. An example of a P1 would be an issue that is blocking a build or a release, whereas a P5 would be a minor typo in a code comment.
* In the [Description]{.jbs-field}, always include (if possible):
  * error messages
  * assert messages
  * stack trace
  * command line information
  * relevant information from the logs
  * full name of any failing tests
* Avoid including in the report:
  * personal information
  * passwords, logins, machine names
  * logs which may include sensitive data
  * large amount of text or data - large logfiles are better provided as attachments
* If the failure isn't reproducible with an existing OpenJDK test, attach a reproducer if possible, having a test case will decrease the time required to resolve the issue.
* In general the [CPU]{.jbs-field} and/or [OS]{.jbs-field} fields should not be set. **ONLY** use them if you know that the issue is only relevant to a particular platform or set of platforms.
* Provide the output of `java -version` whenever possible - this version information is particularly critical for hangs, JVM bugs, and network issues.
* Always file separate bugs for different issues.
  * If two crashes look related, but not similar enough to be sure they are the same, it's easier to later close a bug as a duplicate than it is to separate out one bug into two.

### Types of issues

The most common issue types are:

| Issue Type | Covers |
|:-|:----------|
| [Bug]{.jbs-value} | A [Bug]{.jbs-value} should relate to functional correctness - a deviation from behavior that can be tied back to a specification. Anything else, including performance concerns, is generally not a bug, but an enhancement. Though it's not clear-cut as a significant performance regression may be classified as a [Bug]{.jbs-value}, for example. |
| [Enhancement]{.jbs-value} | An [Enhancement]{.jbs-value} is a small to medium improvement to existing functionality. |
| [JEP]{.jbs-value} | The [JEP]{.jbs-value} issue type is used for a proposal of a significant change or new feature which will take four or more weeks of work - see [JEP-1](https://openjdk.org/jeps/1). |
| [Sub-task]{.jbs-value} | Sub-tasks can be used to break up the work for an issue, such as the changes to the docs, tests etc. This is not recommended as a way to break up a large amount of code change associated with a new feature - see [Implementing a JEP] or [Implementing a large change] below. |
| [Task]{.jbs-value} | Tasks are used to track work that isn't expected to result in a change in any code repository. They are used for related activities such as a new JBS version number, a build request, an update to a document etc. |
| [New Feature]{.jbs-value} | Not recommended for use. |

::: {.note}
A [Bug]{.jbs-value} or [Enhancement]{.jbs-value} should only be used if the work is expected to result in a change in a code repository. A [Bug]{.jbs-value} or [Enhancement]{.jbs-value} with resolution [Fixed]{.jbs-value} is required to have a corresponding changeset in one of the OpenJDK repositories.
:::

### Indicating what releases an issue is applicable to

Knowing when an issue was introduced is important to determine the impact of the issue and where it needs to be resolved. While in some cases it may be clear, it is likely that on submission and during triage this won't be known, instead we will have one or two data points from which we can begin to understand the range of releases which the issue impacts.

The [Affects Version/s]{.jbs-field} field is used to indicate which releases an issue is applicable to, and to avoid having to set it to an exhaustive list of impacted releases the following assumptions are used to give that range:

1) If an issue is applicable to a feature release N, it is assumed to be applicable to all (more recent) releases unless indicated otherwise (see [(Rel)-na](#usage-of-the-rel-na-label) below).
    - Note that if it's reported against an update release then all we can say is that it's applicable to all the following update releases, not necessarily the next feature release as it may have been introduced in an update. Given this, it is always important to try and reproduce the issue in the corresponding feature release as well as mainline.

1) If an issue is applicable to release N, then it can't be assumed that it is applicable to older releases less than N. It may be, but in general this is less important to know, as the majority of issues are only fixed in the latest feature release. If the issue is a crash or important in another way, then it becomes worthwhile to take the time to determine if it's relevant to earlier maintained releases.

Another aspect is when the impacted code was added or removed from the JDK, which in either case limits the range of releases the issue impacts. Knowing that a feature was removed before the oldest currently maintained release means it can be resolved as [Won't Fix]{.jbs-value}.

#### Setting the Affects Version/s field

:::{.note}
Note that the [Affects Version/s]{.jbs-field} field is mainly used for bugs and bug-like tasks/sub-tasks etc. In general enhancements and enhancement-like tasks/sub-tasks should not have an [Affects Version/s]{.jbs-field}.
:::

Set the [Affects Version/s]{.jbs-field} field to the lowest release where the bug has been seen.

* The [Affects Version/s]{.jbs-field} isn't meant to be an exhaustive list of releases the issue is relevant to - it should initially be set to the release the issue was reproduced or identified on, and by implication it will be relevant to all releases past that point (see [Usage of the (Rel)[-na]{.jbs-label} Label](#usage-of-rel-na-label)). If it's later found to be applicable to an earlier release family then adding that earlier release is encouraged if the issue needs to be fixed in that release.
* Don't add additional release values to [Affects Version/s]{.jbs-field} for the same release family. For example, if there is the value [11.0.2]{.jbs-value}, don't add [11.0.5]{.jbs-value}, [11.0.7]{.jbs-value} etc. Adding an additional value for a separate release family where it's still reproducible, e.g. JDK 21, is encouraged if there isn't currently a feature release value set, or, it has been a few releases since it was last reproduced/reviewed. For example, if the [Affects Version/s]{.jbs-field} is [8]{.jbs-value}, but it is still relevant to the latest mainline release.
* [Affects Version/s]{.jbs-field} should never use any of the "special" values available in JBS like [tbd]{.jbs-value}, [na]{.jbs-value}, [unknown]{.jbs-value}, [(Rel)-pool]{.jbs-value} or similar. Only actual JDK release numbers should be used. If you want to reflect that an issue is relevant to an older release, use a family release value or an exact release if you know where the issue was introduced: [8]{.jbs-value}, [17]{.jbs-value}, [21u4]{.jbs-value}.

#### Usage of the (Rel)-na Label

Labels of the form (Rel)[-na]{.jbs-label} (eg. [17-na]{.jbs-label}) should be used when a bug is not applicable to a more recent release family. For example:

[Affects Version/s]{.jbs-field}: [7u111]{.jbs-value}, [8u131]{.jbs-value}

add the label [9-na]{.jbs-label} if the issue is not relevant to JDK 9 and above. Reasons why this would be the case include the fact that the source has been removed from a later release or rewritten such that the issue is no longer relevant.

Don't:

- use the label to indicate that a bug is not relevant to an earlier release, for example

  [Affects Version/s]{.jbs-field}: [11.0.20]{.jbs-value}, [17]{.jbs-value}

  the label [8-na]{.jbs-label} would not be needed - as it doesn't have a JDK 8 release, or earlier, value in the [Affects Version/s]{.jbs-field}, it is not relevant to JDK 8. Also see [Usage of the (Rel)[-wnf]{.jbs-label} Label](#usage-of-the-rel-wnf-label)
- add multiple [-na]{.jbs-label} labels: you only need one, for example don't add both [9-na]{.jbs-label} and [11-na]{.jbs-label} — [9-na]{.jbs-label} implies all following releases therefore [11-na]{.jbs-label}, or [17-na]{.jbs-label} etc. are not needed.
- It's not recommended to specify update releases like 17u4 or 21u in the label. Labels like [17-na]{.jbs-label} and [21-na]{.jbs-label} are in general enough.

#### Usage of the (Rel)-wnf Label

Labels of the form (Rel)[-wnf]{.jbs-label} (e.g. [11-wnf]{.jbs-label}) should be used to indicate that a bug is not going to be fixed in a release that it's applicable to, or any earlier releases. For example, [11-wnf]{.jbs-label} states it won't be fixed in JDK 11 and implicitly indicates it won't be fixed in JDK 8 either.

Add a comment when adding a (Rel)[-wnf]{.jbs-label} label so that it's clear for those looking at the issue, why it won't be fixed in that release.

#### Examples

![Guidelines for setting [Affects Version/s]{.jbs-field}](affects_versions.svg)

1. [Affects Version/s]{.jbs-field} contains [8]{.jbs-value} only, which means this issue is applicable to JDK 8 and all releases thereafter (until it's fixed).
2. [Affects Version/s]{.jbs-field} contains [8]{.jbs-value}, [8u40]{.jbs-value}, [9]{.jbs-value}, and [12]{.jbs-value}. Since [8]{.jbs-value} already implies that later releases are affected, adding other versions are discouraged.
3. [Affects Version/s]{.jbs-field} contains [11]{.jbs-value} and [21]{.jbs-value}. Adding occasional versions of actively maintained JDK releases (JDK 21 in this example) is fine; JDK 17 is implicitly affected as well as releases after JDK 21.
4. [Affects Version/s]{.jbs-field} contains [8]{.jbs-value} and the issue is fixed in JDK 11. The [12-na]{.jbs-label} label indicates that the issue is not applicable to JDK 12 and subsequent versions.
5. [Affects Version/s]{.jbs-field} contains [8]{.jbs-value}. The issue is fixed in JDK 21 and is backported to JDK 17. The [11-wnf]{.jbs-label} label indicates that the fix will not be backported to JDK 11 or 8.

### Implementing a large change

When managing the work for a large change, especially when the work involves multiple engineers, it's recommended that the work is distributed across one or more "implementation" issues which should be linked to the main enhancement with a "blocks" link along with any relevant CSRs. The enhancement shouldn't be considered done until all the blocking elements are completed. The use of sub-tasks for enhancements is not recommended unless all the sub-tasks are relevant to the fix, if it were to be backported, for example [JDK-8231641](https://bugs.openjdk.org/browse/JDK-8231641) or [JDK-8171407](https://bugs.openjdk.org/browse/JDK-8171407).

#### Implementing a JEP

It's recommended for [JEP]{.jbs-value}s that the implementation is spread across one or more [Enhancement]{.jbs-value}s as described above.

## Issue states

JBS only has a few states in which a [Bug]{.jbs-value} or [Enhancement]{.jbs-value} can be:

| Type | Covers |
|:-|:----------|
| [New]{.jbs-value} | Initial state after an issue is filed. Bugs in the JDK Project must be taken out of the [New]{.jbs-value} state ("Triaged" - see below) in a timely manner. In general, triaging is recommended to be done for all issue types and projects as a sign that the issue is correctly filed, and will be seen by the right developers - this is especially important towards the end of a release. |
| [Open]{.jbs-value} | Once the issue has been triaged it will be in the [Open]{.jbs-value} state and will stay here until an assignee decides to work on it, at which point it's encouraged that the "Start Work" option be selected to move it to [In Progress]{.jbs-value}. |
| [In Progress]{.jbs-value} | The [In Progress]{.jbs-value} state is used to show that the assignee is actively working on the issue. It has the optional sub-states ([Understanding]{.jbs-field}): [Cause Known]{.jbs-value}, [Fix Understood]{.jbs-value}, [In Review]{.jbs-value}. |
| [Resolved]{.jbs-value} | When the issue has been fixed it is [Resolved]{.jbs-value} using the Resolve action in JBS. |
| [Closed]{.jbs-value} | To finally close an issue it also needs to be verified using the issue's regression test. |

::: {style="text-align:center;"}
~~~{.mermaid caption="JBS Issue Flow" format=svg theme=neutral}
flowchart TD

subgraph top[" "]

New
triage
ResolvedIncomplete
ClosedIncomplete
Open
InProgress
states
Resolved
Verify
Closed

  New(NEW) --> triage
  Open --> |Move to new component|New

  triage --> |sync with submitter|ResolvedIncomplete(<font color=white>RESOLVED:Incomplete)
  ResolvedIncomplete --> |Clarified|triage
  ResolvedIncomplete --> |Not Clarified|ClosedIncomplete
  ClosedIncomplete(<font color=green>CLOSED:Incomplete) --> Closed

  triage --> Open(OPEN)
  Open --> states

  Open <--> InProgress(<font color=blue>IN PROGRESS)
  InProgress --> states

  states[Fixed, Won't Fix, Duplicate etc.] --> Closed
  states --> Resolved
  Resolved(<font color=white>RESOLVED) -.-> Verify[Verify]
  Verify --> Closed(<font color=green>CLOSED)
end

style top fill:white
style New fill:lightgrey
style Open fill:lightgrey
style triage fill:white
style states fill:white
style Verify fill:white
style Resolved fill:green
style ResolvedIncomplete fill:green
style Closed fill:lightgreen
style ClosedIncomplete fill:lightgreen
~~~
:::

## Triaging an issue

For most JDK areas, triage is performed on a regular basis (at least weekly) by triage teams. Each triage team consists of [Contributors](https://openjdk.org/bylaws#contributor) who are area experts for a specific area or feature. If you haven't been selected to be part of a triage team for a specific area *you shouldn't be triaging bugs in that area*.

When triaging an issue, first give it a general review.

1. If the issue is a duplicate, close it as such.
1. If the issue belongs to a different area (it was filed in libraries, but it's an HotSpot issue), transfer it to the correct component/subcomponent making sure that the state remains [New]{.jbs-value}.
   * Please note that issues in the [hotspot]{.jbs-value} and [security-libs]{.jbs-value} components must have a [Subcomponent]{.jbs-field} set as well.
   * If the reason for transfer isn't completely obvious, please also add a comment on why the issue belongs to the new component.
1. If the issue is incomplete, add a comment noting what is needed and resolve the bug as [Resolved]{.jbs-value} - [Incomplete]{.jbs-value}. This is the JBS way of saying "need more information". If no more information is obtained within reasonable time, the issue should be closed ([Closed]{.jbs-value} - [Incomplete]{.jbs-value}).

Now that the issue is in the right component and has the basic information, the analysis continues to get a more detailed understanding of the issue, and what should be done:

1. Ensure the priority is correct.
   * An approach that has been used for getting a consistent view of priority is to consider three aspects of the issue: **Impact** of the issue; **Likelihood** of it occurring; and, whether there is a **Workaround**. The higher the impact and likelihood the higher the priority; then, having a workaround reduces that priority - but mostly where the impact and likelihood aren't that severe.
1. Ensure the [Affects Version/s]{.jbs-field} field is correct (within reason).
    * This may involve reproducing the bug, if doing so is fast and easy.
    * In addition to the version where the bug was found, take special care to also investigate if the bug affects mainline.
    * See [Indicating what releases an issue is applicable to](#indicating-what-releases-an-issue-is-applicable-to) for more details.
1. Set the [Fix Version/s]{.jbs-field}.
   * A bug should be fixed first in the most recent version where it exists. If you don't know what version the fix will go into set the [Fix Version/s]{.jbs-field} to [tbd]{.jbs-value} or the appropriate [(Rel)-pool]{.jbs-value} if the fix is for a specific release family. If there is a [(Rel)-pool]{.jbs-value} in the fix version Skara tooling will use that issue/backport when you integrate the fix for that release family.
   * If the bug also exists in older versions it may require [backporting].
     * The decision to backport to a release should be made inline with the guidelines of the lead for that release.
     * There are two options for creating backport issues to track the backport: one is to create it manually once it's agreed that the bug should be backported; the second, is to let the bots create the backport issue once you integrate the fix to the repository (see [Working with backports in JBS]). In most cases, letting the bots create the backport issue is preferred.
   * For Project internal changes intended to be integrated to a Project repository rather than the JDK or JDK Updates repositories, the [Fix Version/s]{.jbs-field} should be set to [internal]{.jbs-value}, or if the [Project](https://openjdk.org/bylaws#project) is large enough to have its own [repo-*]{.jbs-value} fix version, use that.
   * Only one [Fix Version/s]{.jbs-field} should ever be set. If the issue is to be fixed in additional releases then separate backport issues must be created (see [Working with backports in JBS]). There are exceptions to this rule for CSRs and Release Notes.
1. Make sure the bug has all the required labels – see [JBS Label Dictionary].
   * Changes that don't affect product code, but are only against the regression test, or problem-listing: [[noreg-self]{.jbs-label}](#noreg-self)
   * Changes that don't affect product code, but are only against documentation: [[noreg-doc]{.jbs-label}](#noreg-doc)
   * Well contained issues that seem to be easy to fix: [[starter]{.jbs-label}](#starter)
   * Enhancements that are pure cleanups: [[cleanup]{.jbs-label}](#cleanup)
   * Project specific issues usually have their own labels as well
1. Managing regressions - for a bug (B) where behavior has _incorrectly_ changed from a previous fix (A) ensure that the label [[regression]{.jbs-label}](#regression) is added.  Once it is known what fix caused the regression a [caused by]{.jbs-value} link should be added to 'B' or a [causes]{.jbs-value} link to 'A'. A [causes]{.jbs-value} link would also be added to A if the fix _causes_ a change of behavior (intentional or otherwise) or it is found after integration, that additional work needs to be done. In addition to adding a [caused by]{.jbs-value} link, set the [Introduced in Version]{.jbs-field} and [Introduced in Build]{.jbs-field} fields of 'B', based on which release 'A' was fixed in.  Do not add a [caused by]{.jbs-value} link if there was no specific product fix which _caused it_, for example, the addition of a test which finds an underlying problem should not be linked.

At this point move the issue into the [Open]{.jbs-value} state.

### Sensitive information (e.g. hs_err.log)

It may sound obvious, but avoid placing sensitive information in bug reports. Things like usernames, IP addresses, host names, and exact version information of third party libraries etc. may be crucial to be able to debug in some cases, but could also help an attacker gain information about your system. JBS is a public database that anyone can search, so be mindful of what you place there. In particular when attaching log files like the hs_err.log you should make sure that you are comfortable sharing the details exposed in it. Sometimes it may be better to leave a comment saying that these details can be obtained on request.

If you file a bug through the [Bug Report Tool](https://bugreport.java.com/) there's a specific field that should be used to place sensitive information like this. Information placed there will not be part of the public bug report.

## Updating an issue while fixing

Once you are made, or you make yourself, the assignee of an issue you take on the responsibility of moving the issue through to resolution - providing the current status, and ultimately leaving a record for others in the future to understand what happened. There are no set rules for how you manage the bug while you are assigned to it, as it depends on the type and importance of an issue. A simple update to the doc needs little to be done, fix the problem and close the issue; an intricate timing issue or crash should be handled differently - documenting your progress in identifying the problem (e.g. [JDK-8212207](https://bugs.openjdk.org/browse/JDK-8212207), [JDK-6984895](https://bugs.openjdk.org/browse/JDK-6984895), [JDK-8287982](https://bugs.openjdk.org/browse/JDK-8287982)), this is especially helpful if you ultimately move the issue to a different area as you have found that the problem lies elsewhere, or is closed as [Won't Fix]{.jbs-value}. Your updates then provide a resource to others to better understand what has been done or the code itself. See [The Importance of Writing Stuff Down](https://stuartmarks.wordpress.com/2023/02/22/the-importance-of-writing-stuff-down) for a good explanation as to why it's important.

Some additional fields should be filled out or updated as you get a better understanding of the issue:

* The [Description]{.jbs-field} usually explains what went wrong and how the failure was found, then there's some investigation and eventually the root cause is found. At this point the [Summary]{.jbs-field} should be updated to correctly describe the bug. The [Description]{.jbs-field} however should remain a description of how the failure was found.
* The [Affects Version/s]{.jbs-field} should be updated if you in your investigation finds that the issue is older than what is indicated by the current [Affects Version/s]{.jbs-field}.

::: {.note}
**Note:** If during your investigation of the bug you determine that the issue is in the wrong component, make sure to move it back to the [New]{.jbs-value} state before moving it to the new component, so that it will be picked up by the component's triage team. Make sure there is a comment outlining the reason for the move, as explained above.
:::

## Linking Issues

An important aspect of any issue is making clear how it is connected/related to other issues. This can occur at any stage of the issue's lifecycle. For example, as information becomes available that might suggest a cause, or similar issue (relates to).

There are the following link types:

| Type | Usage |
|:-|:----------|
| [duplicate of]{.jbs-value} | Normally set automatically when an issue is closed as a duplicate - see [Closing issues as duplicates] for more information. |
| [backported by]{.jbs-value} | Normally set automatically when creating a backport with the “More -> Create Backport” option, or by the Skara tooling. |
| [CSR for]{.jbs-value} | When creating a CSR with the “More -> Create CSR” option, a link is automatically created between the main issue and the new CSR. |
| [blocks]{.jbs-value} | For when other issues are dependent on the current issue being resolved/fixed before they can be. For example, when a fix is broken down into a number of parts the [blocks]{.jbs-value} link should be used to ensure they are all fixed before the main issue is considered resolved - see [Implementing a large change]. |
| [relates to]{.jbs-value} | Used to indicate a relationship between two issues. To avoid lots of [relates to]{.jbs-value} links, the links should have some significance in relation to the cause and/or fix, for the current issue. |
| [causes]{.jbs-value}/[caused by]{.jbs-value} | The [causes]{.jbs-value} link implies a stronger relationship than [relates to]{.jbs-value}. If an issue 'B' can be traced back to the fix for issue 'A' then ‘A causes B’ (or ‘B is caused by A’). |

::: {.note}
**Note:** There should never be more than one type of link between two issues. It may be necessary to manually remove a link, e.g. [relates to]{.jbs-value}, if later a [duplicated by]{.jbs-value} or [caused by]{.jbs-value} link is added.
:::

## Resolving or Closing an issue

Once the work on an issue has been completed the issue's [Status]{.jbs-field} should be in a "completed" state. There are two "completed" states: [Resolved]{.jbs-value} and [Closed]{.jbs-value}. These are accompanied by a [Resolution]{.jbs-field} and a [Fix Version/s]{.jbs-value}. Which combination of [Status]{.jbs-field}, [Resolution]{.jbs-field}, and [Fix Version/s]{.jbs-value} you should use depends on how the issue is completed.

Most resolutions are used to close an issue so that it ends up being [Closed]{.jbs-value} directly, but resolutions that indicates that a change has been integrated into a Project repository must go through the [Resolved]{.jbs-value} state. An issue in [Resolved]{.jbs-value} state needs to go through [verification](#verifying-an-issue) to end up as [Closed]{.jbs-value}. For the JDK Project in almost all cases the bots will transition the issue to [Resolved]{.jbs-value}/[Fixed]{.jbs-value} when the changeset is integrated to the repository.

The [Fix Version/s]{.jbs-field} field should indicate when an issue was fixed. The most common value for this field is a JDK version number. There are some special values available for this field in JBS, these should only be used for special cases as outlined in this Guide.

::: {.note}
**Note:** An issue should never be closed if it has open sub-tasks.
:::

| Status<br />Resolution | Covers |
|:-|:-----------|
| [Resolved]{.jbs-value}/[Closed]{.jbs-value}<br />[Fixed]{.jbs-value} | The resolution [Fixed]{.jbs-value} should be used **only** if a change has been integrated in a Project repository to address the issue, and the [Fix Version/s]{.jbs-field} must always correspond to the version where the change was integrated, or be one of the [repo-*]{.jbs-value} fix versions or [internal]{.jbs-value}. If there isn't a fix in the repository (and so no associated changeset) then the issue should **not** be marked as [Fixed]{.jbs-field}. |
| [Closed]{.jbs-value}<br />[Won't Fix]{.jbs-value} | Used when the issue is describing behavior which, while maybe problematic or not ideal, isn't going to be changed - for compatibility reasons for example. |
| [Closed]{.jbs-value}<br />[Duplicate]{.jbs-value} | Used to indicate that the same issue is described in another JBS issue. See [Closing issues as duplicates] for more information. |
| [Resolved]{.jbs-value}/[Closed]{.jbs-value}<br />[Incomplete]{.jbs-value} | Used to indicate that the JBS issue doesn't contain enough information to work on the issue. See [Closing incomplete issues] for more information. |
| [Closed]{.jbs-value}<br />[Cannot Reproduce]{.jbs-value} | Use when a reproducer is provided (or clear steps) but it's not possible to see the faulty behavior. When you can't reproduce an issue, where feasible try on the release the issue was reported against as a way of confirming that it's indeed addressed on the latest release, rather than you not having the right environment in which to reproduce the issue. |
| [Closed]{.jbs-value}<br />[Other]{.jbs-value} | Used in rare cases where none of the other statuses fit the situation. |
| [Closed]{.jbs-value}<br />[External]{.jbs-value} | Use where the issue is due to a problem in a Java library (not part of the OpenJDK code base), an IDE or other external tool etc. Where known, it's good to provide a link to the site where the issue should be reported. |
| [Closed]{.jbs-value}<br />[Not an Issue]{.jbs-value} | Use when the behavior is expected and valid (cf. [Won't Fix]{.jbs-value}) and the reporter perhaps has misunderstood what the behavior should be. |
| [Closed]{.jbs-value}<br />[Migrated]{.jbs-value} | Used rarely, but can be seen when issues are transferred into another project by opening up a separate issue in that project, with the issue in the original project being [Closed]{.jbs-value}. |
| [Resolved]{.jbs-value}/[Closed]{.jbs-value}<br />[Delivered]{.jbs-value} | Used to close out issues where a change to the code isn't required, common examples are Tasks, Release Notes, and umbrella issues for larger changes. Note that the verification step is always needed to move an issue from [Resolved]{.jbs-value} to [Closed]{.jbs-value}. If your issue doesn't need verification (e.g. it's an umbrella where each sub-task is verified as a separate fix) then please move the issue directly to [Closed]{.jbs-value} without going through [Resolved]{.jbs-value}. |
| [Closed]{.jbs-value}<br />[Withdrawn]{.jbs-value} | [Withdrawn]{.jbs-value} is essentially the partner state to [Delivered]{.jbs-value} for issues that would not have resulted in a fix to the repo, and also part of the [CSR](https://wiki.openjdk.org/display/csr/Main) and [Release Note](#release-notes) process. |
| [Closed]{.jbs-value}<br />[Approved]{.jbs-value} | Used as part of the [CSR process](https://wiki.openjdk.org/display/csr/Main). |
| Challenge States| [Exclude [Challenge]]{.jbs-value}, [Alternative Tests [Challenge]]{.jbs-value}, and [Reject [Challenge]]{.jbs-value} are only relevant within the context of the JCK Project. |
| [Future Project]{.jbs-value} | This status is not recommended for use. |
| [Rejected]{.jbs-value} | This status should not be used. |

::: {.note}
When an issue is closed as [Won't Fix]{.jbs-value}, do not remove the [Fix Version/s]{.jbs-field}. It's valuable information to know what version it was decided not to fix an issue in. The same goes for resolutions such as [Duplicate]{.jbs-value}, [Cannot Reproduce]{.jbs-value} and [Not an Issue]{.jbs-value}.
:::

::: {.note}
The fix version [na]{.jbs-value} should only be used on backport issues that is created by mistake. See [How to fix an incorrect backport creation in JBS].
:::

### Closing issues as duplicates

If the same issue is described in another JBS issue then close one against the other as [Closed]{.jbs-value}/[Duplicate]{.jbs-value}. In general the newer issue is closed as a [Duplicate]{.jbs-value} of the older one, but where the newer issue has a clearer description, or more useful, up-to-date comments then doing it the other way round is ok as long as none of them has been [Fixed]{.jbs-value} already. If one of the issues has been [Fixed]{.jbs-value} the other one should be closed as a [Duplicate]{.jbs-value} of the [Fixed]{.jbs-value} issue. There may be other reasons to choose to close one or the other issue as the [Duplicate]{.jbs-value}. As always - use your best judgement to make the end result as good as possible.

::: {.note}
Any issue closed as a [Duplicate]{.jbs-value} **must** have a "Duplicates" link to the duplicating issue.
:::

::: {.note}
Be mindful of labels on issues closed as [Duplicate]{.jbs-value}. Some labels need to be copied over to the duplicating issue, see for instance the [[tck-red-]{.jbs-label}*(Rel)*](#tck-red-rel) label.
:::

### Closing issues without knowing what fixed it

If it's determined that an issue has been fixed, but it's unknown what change that fixed it, closing as [Fixed]{.jbs-value} is not an option as this requires a changeset in a project repository. [Duplicate]{.jbs-value} is also not an option since this requires a duplicate-link to the issue that fixed it. A common way to handle such cases is to close the issue as [Delivered]{.jbs-value} with the [Fix version/s]{.jbs-value} set to [unknown]{.jbs-value}. Closing an issue as [Cannot Reproduce]{.jbs-value} has also been common practice but is no longer recommended if it's known that the issue has actually been fixed.

### Closing incomplete issues

As mentioned above, issues that lack the information needed to investigate the problem are placed in status [Resolved]{.jbs-value} - [Incomplete]{.jbs-value}. Triage teams should monitor incomplete issues in their area and if needed ping the relevant person. When new information is received, the bug should be returned to status [Open]{.jbs-value}. If the required information hasn't been obtained within reasonable time (3-4 weeks) the bug should be closed as [Incomplete]{.jbs-value}.

## Verifying an issue

Once an issue is marked as resolved there is now the option of someone, other than the person that fixed it, of marking it as [Verified]{.jbs-value} to confirm that the issue is fixed after testing; marking it as [Fix Failed]{.jbs-value} if it didn't solve the issue; or, [Not Verified]{.jbs-value} to indicate that it wasn't explicitly tested. Note that the JBS UI doesn't highlight when [Fix Failed]{.jbs-value} has been set, you need to look for the [Verification]{.jbs-field} field at the bottom of the left-hand column in the Details section.

## Removing an issue

Removing a JBS issue is a rare extreme case that shouldn't be part of the normal workflow. For this reason, removing issues is restricted to admins only. If you for some reason need to remove an issue, send an email to [ops@openjdk.org](mailto:ops@openjdk.org). You need to provide the bug id and a well considered reason the issue should be removed.

Note that JBS issues are not removed just because something was a bad idea, or a reported issue turned out to be an embarrassing user mistake. Such issues are simply closed.

## JBS labels

JBS labels are used to tag and group related issues. JBS labels are an open namespace, which means that anyone can create new labels at any time. In order to avoid confusion, however, it's best to reuse existing labels where possible. Most areas have their commonly used labels to identify issues in their respective area. Make an effort to find and use these labels. This can be done by editing the [Labels]{.jbs-field} field of a bug and entering the first few characters of the label you want to add. JIRA will pop up an autocomplete window with existing labels that match that prefix. Then choose one of the existing labels. Using the autocomplete window is preferable to typing the whole label name (even if you're a good typist) because it's easy for minor spelling errors to creep in, which can inadvertently introduce multiple labels with spurious spelling variations.

JBS labels should not be used to write documentation - don't try to write sentences using labels. Adding a number of random labels is unlikely to be helpful to anyone.

::: {.note}
**Labels are case sensitive**
When using labels in Jira gadgets (like pie charts, heat maps, and statistics tables) Jira will be case-sensitive and treat e.g. OpenJDK and openjdk as two different labels. Searching however is case-insensitive. This means that if you group a set of issues in a gadget based on a label, and then click one of the groups to see the list of issues, that list will contain more results than the gadget if there are usages of the label with different casing. This can be very confusing and for this reason the recommendation is to stick with the commonly used case for all labels, regardless of your personal taste for upper or lower case letters. Most labels are lower case only, but there are examples where upper case letters are used in the most common version of a label. Use of the autocomplete popup window (described above) when adding labels will avoid inadvertent introduction of labels with differing case.
:::

## JBS label dictionary

This table contains some frequently used JBS labels and their meaning. Please help keeping this dictionary up to date by adding your favorite labels. This table doesn't dictate how to use labels, but rather document how they are used. That said, obviously it will help everyone if we try to follow a common standard and use similar labels in the same way across all entities that use JBS.

<table class="dictionary" summary="JBS Label Dictionary">
  <tr style="text-align:left;"><th>Label</th><th>Description</th></tr>
  <!-- Area -->
  <tr>
    <td class="dictionary">[*(Area)*[-interest]{.jbs-label}]{#area-interest}</td>
    <td class="dictionary">
      Used to indicate that an area (usually a team or [Project](https://openjdk.org/bylaws#project)) is interested in the issue. This label doesn't indicate ownership of the issue. E.g., [redhat-interest]{.jbs-label}, [azul-interest]{.jbs-label}, [coin-interest]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Area)*[-related]{.jbs-label}]{#area-related}</td>
    <td class="dictionary">
      Used to indicate that an issue is related to a specific area (usually a feature or [Project](https://openjdk.org/bylaws#project)). This label doesn't indicate ownership of the issue. E.g., [graal-related]{.jbs-label}, [testcolo-related]{.jbs-label}, [doc-related]{.jbs-label}
    </td>
  </tr>
  <!-- Release -->
  <tr>
    <td class="dictionary">[*(Rel)*[-bp]{.jbs-label}]{#rel-bp}</td>
    <td class="dictionary">
      Used to indicate that a bug would be suitable for backport to a release *(Rel)*. This isn't a decision to backport, just a suggestion / recommendation. E.g., [11-bp]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-critical-request]{.jbs-label}]{#rel-critical-request}<br />
                           [*(Rel)*[-critical-approved]{.jbs-label}]{#rel-critical-approved}<br />
                           [*(Rel)*[-critical-watch]{.jbs-label}]{#rel-critical-watch}</td>
    <td class="dictionary">
      Used in the ramp down phases of specific releases to request approval of changes that requires Project lead approval (or similar) to be included. *(Rel)* is the release in question. E.g., [jdk11-critical-request]{.jbs-label}

      *(Rel)*[-critical-approved]{.jbs-label} is used to signal that the change has been approved for inclusion. E.g., [jdk11-critical-approved]{.jbs-label}<br />
      *(Rel)*[-critical-watch]{.jbs-label} is used for issues that must get into a specific release but risk running late. The label is used while the issue is still in progress and is replaced with *(Rel)*[-critical-request]{.jbs-label} once the issue is resolved. E.g., [jdk11-critical-watch]{.jbs-label}

      These labels are always placed on the main JBS issue, never on backports or subtasks.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-defer-request]{.jbs-label}]{#rel-defer-request}<br />
                           [*(Rel)*[-defer-yes]{.jbs-label}]{#rel-defer-yes}<br />
                           [*(Rel)*[-defer-no]{.jbs-label}]{#rel-defer-no}</td>
    <td class="dictionary">
      Used to request deferral of changes that requires Project lead approval (or similar) to defer. *(Rel)* is the release in question. E.g., [jdk12-defer-request]{.jbs-label}

      *(Rel)*[-defer-yes]{.jbs-label} and *(Rel)*[-defer-no]{.jbs-label} are used to indicate wether the deferral has been approved or not. E.g., [jdk12-defer-yes]{.jbs-label}

      These labels are always placed on the main JBS issue, never on backports or subtasks.
      Further details are found in the [JDK Release Process](https://openjdk.org/jeps/3#Bug-Deferral-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-enhancement-request]{.jbs-label}]{#rel-enhancement-request}<br />
                           [*(Rel)*[-enhancement-yes]{.jbs-label}]{#rel-enhancement-yes}<br />
                           [*(Rel)*[-enhancement-no]{.jbs-label}]{#rel-enhancement-no}</td>
    <td class="dictionary">
      Used in the ramp down phases to request the late inclusion of an enhancement. *(Rel)* is the release in question. E.g., [jdk10-enhancement-request]{.jbs-label}

      *(Rel)*[-enhancement-yes]{.jbs-label} and *(Rel)*[-enhancement-no]{.jbs-label} are used to indicate the response on the request. E.g., [jdk10-enhancement-yes]{.jbs-label}, [jdk10-enhancement-no]{.jbs-label}

      These labels are always placed on the main JBS issue, never on backports or subtasks.
      Further details are found in the [JDK Release Process](https://openjdk.org/jeps/3#Late-Enhancement-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-fix-request]{.jbs-label}]{#rel-fix-request}<br />
                           [*(Rel)*[-fix-SQE-ok]{.jbs-label}]{#rel-fix-SQE-ok}<br />
                           [*(Rel)*[-fix-yes]{.jbs-label}]{#rel-fix-yes}<br />
                           [*(Rel)*[-fix-no]{.jbs-label}]{#rel-fix-no}</td>
    <td class="dictionary">
      *(Rel)*[-fix-request]{.jbs-label} is used in ramp down phase 2 to indicate that an issue would be of interest to be integrated into release *(Rel)*. E.g., [jdk12-fix-request]{.jbs-label}
      *(Rel)*[-fix-SQE-ok]{.jbs-label} is used to indicate that the issue will be covered by the test plan for *(Rel)*. E.g., [jdk12-fix-SQE-ok]{.jbs-label}<br />
      *(Rel)*[-fix-yes]{.jbs-label} and *(Rel)*[-fix-no]{.jbs-label} are used to indicate wether an issue has been approved for backport to *(Rel)*. E.g., [jdk12-fix-yes]{.jbs-label}

      These labels are always placed on the main JBS issue, never on backports or subtasks.
      Further details are found in the [JDK Release Process](https://openjdk.org/jeps/3#Fix-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-na]{.jbs-label}]{#rel-na}</td>
    <td class="dictionary">
      Labels of the form [11-na]{.jbs-label} or [21-na]{.jbs-label} should be used when a bug is not applicable to a **more recent** release family. See [Usage of the (Rel)-na Label].

      (Rel) can also refer to more general release atrifacts like [oraclejdk-na]{.jbs-label}, [openjdk-na]{.jbs-label}, and [sap-aix-na]{.jbs-label} to indicate that the issue doesn't affect code included in that specific atrifact.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-wnf]{.jbs-label}]{#rel-wnf}</td>
    <td class="dictionary">
      Labels of the form [11-wnf]{.jbs-label} or [21-wnf]{.jbs-label} should be used to indicate that a bug is not going to be fixed in a release where it's present. Note that there should only be **one** *(Rel)*[-wnf]{.jbs-label} label on any JBS issue. It is implied that earlier versions will not be fixed either.

      Also see [Usage of the (Rel)-wnf Label].
    </td>
  </tr>
  <!-- Team -->
  <tr>
    <td class="dictionary">[*(Team)*[-triage-]{.jbs-label}*(Rel)*]{#team-triage-rel}</td>
    <td class="dictionary">
      Used to indicate that *(Team)* has triaged this issue for release *(Rel)*. It's encouraged that all open bugs are triaged on a regular basis so that old bugs aren't forgotten. It's therefore common to see several triage labels on the same issue which helps keeping track of which bugs have been triaged for each release. E.g., [oracle-triage-13]{.jbs-label}

      There are many label variants that include the word triage in some form. The form described above is the only one recommended. Please refrain from using other forms.
    </td>
  </tr>
  <!-- A -->
  <tr>
    <td class="dictionary">[[aot]{.jbs-label}]{#aot}</td>
    <td class="dictionary">
      Used to identify issues in the JVM feature Ahead of Time Compilation.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[~~appcds~~]{.jbs-label}]{#appcds}</td>
    <td class="dictionary">
      **Deprecated.** Was used to identify issues in Application Class-Data Sharing. The [cds]{.jbs-label} label is now used instead.
    </td>
  </tr>
  <!-- B -->
  <!-- C -->
  <tr>
    <td class="dictionary">[[c1]{.jbs-label}]{#c1}</td>
    <td class="dictionary">
      Used to identify issues in the JVM JIT compiler C1.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[c2]{.jbs-label}]{#c2}<br />
                           [c2-]{.jbs-label}`.*`</td>
    <td class="dictionary">
      Used to identify issues in the JVM JIT compiler C2.

      [c2-]{.jbs-label}`.*` labels are used to identify different C2 features. E.g., [c2-intrinsic]{.jbs-label}, [c2-loopopts]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[cds]{.jbs-label}]{#cds}</td>
    <td class="dictionary">
      Used to identify issues in the JVM feature Class Data Sharing.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[cleanup]{.jbs-label}]{#cleanup}</td>
    <td class="dictionary">
      The [cleanup]{.jbs-label} label is used to indicate enhancements which has no semantic changes, whose only purpose is to make the code more maintainable or better looking.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[compilercontrol]{.jbs-label}]{#compilercontrol}</td>
    <td class="dictionary">
      Used to identify issues in the JVM Compiler Control feature.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[conformance]{.jbs-label}]{#conformance}</td>
    <td class="dictionary">
      Used to identify all TCK related conformance issues.
    </td>
  </tr>
  <!-- D -->
  <tr>
    <td class="dictionary">[[docker]{.jbs-label}]{#docker}</td>
    <td class="dictionary">
      Used to identify issues in docker support.
    </td>
  </tr>
  <!-- E -->
  <!-- F -->
  <tr>
    <td class="dictionary">[[footprint]{.jbs-label}]{#footprint}</td>
    <td class="dictionary">
      Used to identify issues affecting Java SE footprint. Issues with this label should also have a [performance]{.jbs-label} label.
    </td>
  </tr>
  <!-- G -->
  <tr>
    <td class="dictionary">[[gc-]{.jbs-label}`.*`]{#gc}</td>
    <td class="dictionary">
      Used to identify issues in specific garbage collectors in the JVM. E.g., [gc-g1]{.jbs-label}, [gc-shenandoah]{.jbs-label}, [gc-serial]{.jbs-label}, [gc-epsilon]{.jbs-label}

      There are also labels in use to identify different GC features or areas rather than GC algorithms. E.g., [gc-g1-fullgc]{.jbs-label}, [gc-largeheap]{.jbs-label}, [gc-performance]{.jbs-label}

      Note that ZGC breaks this pattern and uses the label [zgc]{.jbs-label}.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[graal]{.jbs-label}]{#graal}</td>
    <td class="dictionary">
      Used to indicate that this is a Graal issue. (Something that needs to be fixed in Graal rather than in the JDK.)
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[graal-integration]{.jbs-label}]{#graal-integration}</td>
    <td class="dictionary">
      Reserved for Graal integration umbrella bugs. The automated integration script will break if this label is used for other bugs.
    </td>
  </tr>
  <!-- H -->
  <tr>
    <td class="dictionary">[[hgupdate-sync]{.jbs-label}]{#hgupdate-sync}</td>
    <td class="dictionary">
      Used to identify backport issues created as part of automatic syncing between releases.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[~~hs-nightly~~]{.jbs-label}]{#hs-nightly}</td>
    <td class="dictionary">
      **Deprecated.** Was used to tag bugs found in the HotSpot nightly testing. Since we are now running tiered testing there is no more nightly HotSpot testing. See [tier]{.jbs-label}`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[hs-sbr]{.jbs-label}]{#hs-sbr}</td>
    <td class="dictionary">
      Used to identify issues that are found in the "same binary runs", a stress testing method used to find intermittent failures.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[~~[hs-tier]{.jbs-label}`[1-8]`~~]{#hs-tier}</td>
    <td class="dictionary">
      **Deprecated.** Was used to identify which HotSpot tier a test failure was seen in. We don't separate HotSpot tiers from the JDK tiers anymore. See [tier]{.jbs-label}`[1-8]`.
    </td>
  </tr>
  <!-- I -->
  <tr>
    <td class="dictionary">[[i18n]{.jbs-label}]{#i18n}</td>
    <td class="dictionary">
      Used to identify issues in internationalization. i18n is short for internationalization meaning "i 18 letters and an n". Used for bugs whose impact varies depending on a user's writing system, language, or locale, but aren't just a matter of locale data. The label isn't needed for classes_text, classes_util_i18n, classes_awt_im, classes_fontprop, or char_encodings.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[integration-blocker]{.jbs-label}]{#integration-blocker}</td>
    <td class="dictionary">
      Used to indicate that a bug is present in a downstream repository but not present in the upstream repository and is therefore blocking integration of downstream changes into upstream.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[intermittent]{.jbs-label}]{#intermittent}<br />
                           [[intermittent-environment]{.jbs-label}]{#intermittent-environment}<br />
                           [[intermittent-hardware]{.jbs-label}]{#intermittent-hardware}
    </td>
    <td class="dictionary">
      An intermittent issue is one that fails sometimes but not always. The exact reason for the intermittent failure is per definition unknown. Once the reason has been identified the issue is no more considered intermittent. An issue isn't intermittent if some characteristics has been found that triggers the failure consistently, even if the actual cause for the failure hasn't been found. For instance if a test fails every time it's executed on a specific host but not on other hosts it wouldn't be considered intermittent as it fails consistently on that specific host. In other cases it may be that we know that a test sometimes is unlucky in some respect and fails due to this. This test could still be considered intermittent even though we know what the reason is if the reason itself appears intermittently.

      Some issues may seem intermittent when looking at test results, even though the reason for failing is actually known. One example is where a test fails consistently on a specific host, or due to specific conditions in the environment. These failures shouldn't be considered intermittent but it may still be valuable to tag these in JBS with one of the labels [intermittent-hardware]{.jbs-label} or [intermittent-environment]{.jbs-label}. This will help to faster identify that the cause of the failure is known without having to read through the entire bug.

      A test that should be platform agnostic but is consistently failing on a specific OS would for instance be labeled with [intermittent-environment]{.jbs-label}, while a test that fails every time it's run on some specific hardware would be labeled with [intermittent-hardware]{.jbs-label}.
    </td>
  </tr>
  <!-- J -->
  <tr>
    <td class="dictionary">[[jep-superseded]{.jbs-label}]{#jep-superseded}</td>
    <td class="dictionary">
      Used to tag JEPs that have been superseded by a newer version of the JEP.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[jvmci]{.jbs-label}]{#jvmci}</td>
    <td class="dictionary">
      Used to identify issues in the JVM Compiler Interface.
    </td>
  </tr>
  <!-- K -->
  <!-- L -->
  <!-- M -->
  <tr>
    <td class="dictionary">[[maintainer-pain]{.jbs-label}]{#maintainer-pain}</td>
    <td class="dictionary">
Used to tag bugs that for some reason is wasting time or in other ways are causing pain for the OpenJDK maintainers. Examples of issues that could be considered a pain:

* A bug that occurs frequently in testing, maybe on a specific platform, maybe specific to one vendor's test infrastructure, and requires that many maintainers investigate the failure in different test runs just to realize it's the same issue as has been seen and reported before, or worse, don't realize it's a known issue and file a duplicate bug in JBS.

* Bugs that cause tests to fail without a proper explanation causing several maintainers to investigate the failures just to realize there is no information to be found.

* An underlying bug that causes several tests to fail intermittently.

* A bug that causes a test failure in a faraway place and the failure isn’t acted on quickly.

There are other cases as well and there is some flexibility in the definition. If you see a problem that is causing pain for a large number of maintainers, add an explanation in the JBS issue to why you think the issue is a pain and add the label.

If you have a [maintainer-pain]{.jbs-label} bug assigned to you please consider fixing it asap. If you chose not to work on the issue, you should at least be aware that you are choosing to waste others' time and people will be affected by this choice.

As with any issue the best way to deal with a [maintainer-pain]{.jbs-label} issue is to fix it. Another way to reduce the noise is to [exclude the failing test](#excluding-a-test). This is a viable option if there is a limited set of tests that are failing and the bug is actively investigated. When excluding a [maintainer-pain]{.jbs-label} issue, remember to move the [maintainer-pain]{.jbs-label} label to the JBS issue used to exclude. Leaving the label on the closed exclude-issue is helpful for tracking purposes.
    </td>
  </tr>
  <!-- N -->
  <tr>
    <td class="dictionary">[[noreg-]{.jbs-label}`.*`]{#noreg}<br />
                           [[nounit-]{.jbs-label}`.*`]{#nounit}</td>
    <td class="dictionary">
      The [noreg-]{.jbs-label}`.*` and [nounit-]{.jbs-label}`.*` labels are used to explain why a change doesn't need/have a regression test or a unit test. The suffix of the label is described below. Every change that is integrated into the JDK source code must either have a regression/unit test, or have at least one of these labels on its JBS issue. It's possible to have more than one of these labels on the same issue. For instance, a changeset could modify both documentation and test code. In that case it would be logical to label the issue with both [noreg-doc]{.jbs-label} and [noreg-self]{.jbs-label}.

      Please note that the [noreg-]{.jbs-label} namespace is closed, meaning that no new [noreg-]{.jbs-label} labels should be added unless properly
      motivated, discussed, and agreed upon.

[[-sqe]{.jbs-label}]{#noreg-sqe}
:    Change can be verified by running an existing jtreg test suite; the bug should identify the suite and the specific test case(s).

[[-jck]{.jbs-label}]{#noreg-jck}
:    Change can be verified by running the JCK; the bug should identify the specific test case(s).

[[-external]{.jbs-label}]{#noreg-external}
:    Change can be verified by running an existing external test suite; the bug should identify the suite and the specific test case(s).

[[-doc]{.jbs-label}]{#noreg-doc}
:    Change only affects documentation.

[[-demo]{.jbs-label}]{#noreg-demo}
:    Change only affects demo code.

[[-build]{.jbs-label}]{#noreg-build}
:    Change only affects build infrastructure (makefiles, copyrights, scripts, etc.).

[[-self]{.jbs-label}]{#noreg-self}
:    Change is a fix to a regression or unit test itself.

[[-perf]{.jbs-label}]{#noreg-perf}
:    Change is for a performance bug for which writing a regression test is infeasible; the bug should describe how to verify the fix.

[[-hard]{.jbs-label}]{#noreg-hard}
:    It's too hard to write a regression or unit test for this bug (e.g., theoretical race condition, complex setup, reboot required, editing of installed files required, specific graphics card required); the bug should explain why.

[[-long]{.jbs-label}]{#noreg-long}
:    Testing requires a very long running-time (e.g., more than a few minutes).

[[-big]{.jbs-label}]{#noreg-big}
:    Testing requires an unreasonable quantity of resources (e.g., tens of gigabytes of filesystem space).

[[-trivial]{.jbs-label}]{#noreg-trivial}
:    Change is so trivial that nothing could possibly go wrong with it.

[[-cleanup]{.jbs-label}]{#noreg-cleanup}
:    Change is a cleanup or refactoring of existing code that is covered by existing tests.

[[-l10n]{.jbs-label}]{#noreg-l10n}
:    Change only affects localized text.

[[-undo]{.jbs-label}]{#noreg-undo}
:    Change is a reversion of a previous faulty change.

[[-other]{.jbs-label}]{#noreg-other}
:    Regression or unit test is unnecessary or infeasible for some other reason; the bug report should explain why.

Examples:  If a bug fix only corrects a change in the build system, then add the [noreg-build]{.jbs-label} label to the corresponding bug. If the change improves loop optimizations in HotSpot, then add [nounit-perf]{.jbs-label} to the corresponding bug.
    </td>
  </tr>
  <!-- O -->
  <!-- P -->
  <tr>
    <td class="dictionary">[[performance]{.jbs-label}]{#performance}</td>
    <td class="dictionary">
      Used to identify an issue with noticeable performance impact. Either positive or negative.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[~~pit~~]{.jbs-label}]{#pit}</td>
    <td class="dictionary">
      **Deprecated.** Was used to indicate that a failure happened in product integration testing (PIT). Since we are now running tiered testing there is no more PIT. See [tier]{.jbs-label}`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[problemlist]{.jbs-label}]{#problemlist}</td>
    <td class="dictionary">
      One or more tests have been problem-listed due to this bug.
    </td>
  </tr>
  <!-- Q -->
  <!-- R -->
  <tr>
    <td class="dictionary">[[regression]{.jbs-label}]{#regression}</td>
    <td class="dictionary">
      Used to identify regressions. A regression is where behavior has _incorrectly_ changed from a previous build or release. Ideally all regressions are identified and fixed before they are released, if not they must be fixed at latest in the following release after they are identified. All regressions must have the [Affects Version/s]{.jbs-field} set.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[regression_]{.jbs-label}*(ID)*]{#regression_id}</td>
    <td class="dictionary">
      **Deprecated.** Formerly used to identify the fix that caused the regression, where known. Replaced by the use of the [caused by]{.jbs-value} link.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[release-note]{.jbs-label}]{#release-note}</td>
    <td class="dictionary">
      Used to indicate that the issue is a release note. See [Release Notes].
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[release-note=yes]{.jbs-label}]{#release-note-yes}<br />
                           [[release-note=no]{.jbs-label}]{#release-note-no}<br />
                           [[~~release-note=done~~]{.jbs-label}]{#release-note-done}</td>
    <td class="dictionary">
      Used to indicate whether a change requires a release note or not. The labels are always placed on the main JBS issue, never on the actual release note issue. See [Release Notes].

      [release-note=done]{.jbs-label} is deprecated and should no longer be used.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[RN-]{.jbs-label}`.*`]{#rn}</td>
    <td class="dictionary">
      Used to indicate what kind of change the release note is for. See [Release Notes].
    </td>
  </tr>
  <!-- S -->
  <tr>
    <td class="dictionary">[[starter]{.jbs-label}]{#starter}</td>
    <td class="dictionary">
      A starter bug is a well contained, small issue that is suitable for someone new to the codebase.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[startup]{.jbs-label}]{#startup}</td>
    <td class="dictionary">
      Used to identify an issue as affecting Java SE startup performance. Issues with this label should also have a [performance]{.jbs-label} label.
    </td>
  </tr>
  <!-- T -->
  <tr>
    <td class="dictionary">[[tck-red-]{.jbs-label}*(Rel)*]{#tck-red-rel}<br />
                           [[~~tck-red~~]{.jbs-label}]{#tck-red}</td>
    <td class="dictionary">
      Used to identify TCK conformance stoppers (e.g. failure of a valid TCK test that exists in a shipped TCK). The release number indicates which release of the TCK that failed. E.g., [tck-red-11]{.jbs-label}

      If an issue with a [tck-red-]{.jbs-label}*(Rel)* label is closed as a [Duplicate]{.jbs-value}, the label **must** be added to the duplicating issue as well.

      There are [tck-red]{.jbs-label} labels without the release number out there as well. This usage is deprecated.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[~~test~~]{.jbs-label}]{#test}<br />
                           [[~~test-only~~]{.jbs-label}]{#test-only}<br />
                           [[~~testbug~~]{.jbs-label}]{#testbug}</td>
    <td class="dictionary">
      The labels [test]{.jbs-label}, [test-only]{.jbs-label}, and [testbug]{.jbs-label} are deprecated and should no longer be used. Use [[noreg-self]{.jbs-label}](#noreg) to indicate that an issue is a bug in test code.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[tier]{.jbs-label}`[1-8]`]{#tier}</td>
    <td class="dictionary">
      Used to indicate which tier in the `jdk/jdk` CI pipeline a test failure has been seen in. Lower tiers would in general mean higher urgency to fix the issue. E.g., [tier1]{.jbs-label}, [tier2]{.jbs-label}

      Please note that these labels are reserved for bugs seen in the `jdk/jdk` CI pipeline. Use *(Rel)*[-tier]{.jbs-label}`[1-8]` for other CI pipelines, where *(Rel)* is the name of the pipeline. E.g. [8u-tier1]{.jbs-label}
    </td>
  </tr>
  <!-- U -->
  <!-- V -->
  <!-- W -->
  <tr>
    <td class="dictionary">[[webbug]{.jbs-label}]{#webbug}</td>
    <td class="dictionary">
      Used to identify a bug as submitted on [bugs.java.com](https://bugs.java.com/bugdatabase/).
    </td>
  </tr>
  <!-- X -->
  <!-- Y -->
  <!-- Z -->
  <tr>
    <td class="dictionary">[[zgc]{.jbs-label}]{#zgc}</td>
    <td class="dictionary">
      Used to identify an issue in ZGC.
    </td>
  </tr>
</table>

::: {.box}
[To the top](#){.boxheader}
:::
