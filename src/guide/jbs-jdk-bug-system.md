# JBS - JDK Bug System

::: {.box}
[Quick Links]{.boxheader}

* [Bug Report Tool](https://bugreport.java.com/)
* [JDK Bug System (JBS)](https://bugs.openjdk.org/)
  :::

[JBS](https://bugs.openjdk.org/) is a public issue tracker used by many OpenJDK projects and is open for anyone to read and search. In order to get write access you need to be registered in the [OpenJDK Census](https://openjdk.org/census) by becoming, for instance, an [Author](https://openjdk.org/bylaws#author) in an OpenJDK [Project](https://openjdk.org/bylaws#project).

## Filing an issue

When a new failure is found, or an improvement identified, an issue should be filed to describe and track its resolution.
Depending on your role in OpenJDK you can either use the [Bug Report Tool](https://bugreport.java.com/) or, if you
are registered in the [OpenJDK Census](https://openjdk.org/census), you can report the issue directly in [JBS](https://bugs.
openjdk.org/).

When filing an Issue, try to make the report as complete as possible in order to make it easier to triage, investigate and resolve the issue.

#### Types of Issues

The most common [Issue]{.jbs-field} types are:
<br />
<table class="dictionary" summary="JBS Issue Types">
<tr style="text-align:left;"><th>Issue Type</th><th>Covers</th></tr>
<tr>
    <td class="dictionary">[Bug]{.jbs-field}</td>
    <td class="dictionary">Used when reporting a problem: crashes; hangs; failures of functionality etc.</td>
</tr>
<tr>
    <td class="dictionary">[Enhancement]{.jbs-field}</td>
    <td class="dictionary">For a small improvement to existing functionality<br />
</tr>
<tr>
    <td class="dictionary">[New Feature]{.jbs-field}</td>
    <td class="dictionary">Not recommended to use<br /></td>
</tr>
<tr>
    <td class="dictionary">[JEP]{.jbs-field}</td>
    <td class="dictionary">For a proposal for a significant change or new feature which will take 4 weeks or more of work - see [JEP-1](https://openjdk.org/jeps/1)</td>
</tr>
<tr>
    <td class="dictionary">[Sub-task]{.jbs-field}</td>
    <td class="dictionary">Can be used to break up the work for an issue, such as the changes to the docs, tests etc. This is not recommended as a way to break up a large amount of code change associated with a new feature - see "Implementing a JEP or any Large Change" below</td>
</tr>
<tr>
    <td class="dictionary">[Task]{.jbs-field}</td>
    <td class="dictionary">Where something needs to happen other than a code change - for example a request for a new JBS version, or other work associated with a release</td>
</tr>
</table>
Note: If you suspect that the issue is a vulnerability, **don't file a JBS issue**, instead send your report to [vuln-report@openjdk.org](mailto:vuln-report@openjdk.org), also use this alias if you find an existing report which may be a vulnerability. Please do *not* report or discuss potential vulnerabilities on any open lists or other public channels - see [OpenJDK Vulnerabilities](https://openjdk.org/groups/vulnerability/report) for more information.

<br>
A few things to keep in mind when filing an issue to report a problem:

* Before filing, verify that there isn't an issue already filed.
    * Search [JBS](https://bugs.openjdk.org/) for things like the name of the failing test, assert messages, the name of the source code file where a crash occurred etc.
* Make a reasonable attempt to narrow down which build or release the failure first appeared in.
* Add relevant [Labels]{.jbs-field} like [[intermittent]{.jbs-label}](#intermittent), [[regression]{.jbs-label}](#regression), [[noreg-self]{.jbs-label}](#noreg-self), [[tier1]{.jbs-label}](#tier) etc.
    * For more information see the [JBS Label Dictionary](#jbs-label-dictionary)
* Set [Affects Version/s]{.jbs-field} to the earliest JDK version(s) where the failure was seen.
    * If the failure is found in an update train of the JDK (e.g. 11.0.x), please make an effort to see if it is also present in [mainline](https://github.com/openjdk/jdk).
* Set the priority
    * It's not the reporter's responsibility to set a correct priority, but a qualified guess is always better than the default.
    * To help with setting the right priority, consider things like how the bug impacts the product and our testing, how likely is it that the bug is triggered, how difficult is it to work around, and whether it's a regression, since that may break existing applications. Regressions are often higher priority than long-standing bugs and may block a release if not fixed. An example of a P1 would be an issue that is blocking a build or a release, whereas a P5 would be a minor typo in a code comment - most bugs will be P3 or P4.
* In the [Description]{.jbs-field}, always include (if possible):
    * error messages
    * assert messages
    * stack trace
    * command line information
    * relevant information from the logs
    * full name of any failing tests
* Avoid including in the description or comments:
    * personal information
    * passwords, logins, machine names
    * logs which may include sensitive data
* If the failure isn't reproducible with an existing OpenJDK test, attach a reproducer if possible, while in a number of cases it isn't possible, having a test case will decrease the time required to resolve the issue.
* Only set [CPU]{.jbs-field} and/or [OS]{.jbs-field} fields if the bug **ONLY** happens on that particular platform or set of platforms.
* Including the java -fullversion is encouraged for bugs in the JVM, hangs, network issues where the exact version can be critical to determine what fixes may be missing from an older version.
* Always file separate bugs for different issues.
    * If two crashes looks related, but not similar enough to be sure they are the same, it's easier to later close a bug as a duplicate than it is to separate out one bug into two.

Things to keep in mind when requesting an improvement:

* Unlike reporting a problem, when it comes to improvements what constitutes a reasonable request can take discussion, and in general it is encouraged that the mailing list for the area is used to suggest an improvement before filing.
* Enhancements to The Java Language Specification and The JVM Specification are managed through the [Java Community Process](http://jcp.org/)

To find out which component to use for different bugs, consult the [directory to area mapping](#directory-to-area-mapping).

### Implementing a Large Change
When managing the work for a large change, especially when the work involves multiple engineers, it is recommended that the work is distributed across one or more "implementation" issues which should be linked to the main [Enhancement]{.jbs-field} with a "blocks" link along with any relevant CSRs. The [Enhancement]{.jbs-field} should not be considered done until all the blocking elements are completed.  The use of subTasks for [Enhancement]{.jbs}s is not recommended unless all the [Sub-task]{.jbs-field}s are relevant to the fix, if it were to be backported.

### Implementing a JEP
It recommended that for [JEP]{.jbs-field}s that the implementation is spread across one or more [Enhancement]{.jbs-field}s as above.

## Issue states

JBS only has a few states in which an issue can be in:

<table class="dictionary" summary="JBS Label Dictionary">
  <tr style="text-align:left;"><th>Type</th><th>Covers</th></tr>
<tr>
    <td class="dictionary">[New]{.jbs-field}</td>
    <td class="dictionary">Initial state after an issue is filed. [Bugs]{.jbs-field} in the JDK Project must be taken out of the [New]{.jbs-field} state (Triaged - see below) in a timely manner. In general, this is recommended to be done for all issue types and projects as a sign that the issue is correctly filed, and will be seen by the right group - this is especially important towards the end of a release.</td>
</tr>
<tr>
    <td class="dictionary">[Open]{.jbs-field}</td>
    <td class="dictionary">Most straightforward issues stay in this state until they are closed.  If the issue has some attention then use [In Progress]{.jbs-field} to show more clearly that the issue is being worked</td>
</tr>
<tr>
    <td class="dictionary">[In Progress]{.jbs-field}</td>
    <td class="dictionary">The [In Progress]{.jbs-field} state has the option of the sub-states ([Understanding]{.jbs-field}): [Cause Known]{.jbs-field}, [Fix Understood]{.jbs-field}, [In Review]{.jbs-field}.</td>
</tr>
<tr>
    <td class="dictionary">[Closed]{.jbs-field}/[Resolved]{.jbs-field}</td>
    <td class="dictionary">While [Closed]{.jbs-field} and [Resolved]{.jbs-field} are essentially equivalent, when it comes to fixing issues there is an additional [Verify]{.jbs-field} step available between the [Resolved]{.jbs-field} and [Closed]{.jbs-field} states</td>
</tr>
</table>

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

First give the issue a general review

1. If the issue is a duplicate, close it as such.
1. If the issue belongs to a different area (it was filed in libraries, but it is an HotSpot issue), transfer it to the correct component/subcomponent making sure that the state remains [New]{.jbs-field}.
1. If the issue is incomplete, add a comment noting what is needed and close the bug as [Resolved]{.jbs-field} - 'Incomplete'. If no more information is obtained within reasonable time, the issue should be closed ([Closed]{.jbs-field} - `Incomplete`).

Now that the issue is in the right component and has the basic information, the analysis continues to get a more detailed understanding of the issue, and what should be done:

1. ensure the priority is correct - an approach that has been used for getting a consistent view of priority is to consider three aspects of the issue: [Impact]{.jbs-field} or issue; [Likelihood]{.jbs-field} of it occurring; and, whether there is a [Workaround]{.jbs-field}. The higher the [Impact]{.jbs-field} and [Likelihood]{.jbs-field} the higher the priority; then, having a [Workaround]{.jbs-field} reduces that priority - but mostly where the Impact and Likelihood are not that severe.
1. ensure the 'Affects Version/s' field is correct (within reason)
    1. this may involve reproducing the bug, if doing so is fast and easy
    1. In addition to the version where the bug was found, take special care to also investigate if the bug affects the supported releases - the latest LTS release and the latest six-month release.
    1. The affects version is not meant to be an exhaustive list of releases the issue is relevant to - it should initially be set to the release the issue was reproduced or identified on, and by implication it will be relevant on all releases past that point (see (Rel)-na label). If it is later found to be applicable to an earlier release family then adding that earlier release is encouraged if the issue needs to be fixed in that release.
    1.  Do not add additional release values to `Affected Versions` for the same release family: if there is the value 11.0.2 do not add 11.0.5, 11.0.7 etc.  Adding an additional value for a separate release family where it is still reproducible, 12 say, is not necessary but ok, especially if the bug is old (reported on 8 say) but still relevant to the latest release (20 say).
1. set the 'Fix Version'
    1. a bug should be fixed first in the most recent version where it exists, if you don't know what version it will go into set it to `tbd`
    1. if the bug also exists in older versions it may require backporting
        * the decision to backport should be made inline with the guidelines of the lead for the release
        * There are two options for creating backport issue(s) to track the backport: one is to create it manually once it is agreed that the bug should be backported; the second, is to let the bots create the backport issue once you push the fix to the repo.
    1. Only one fixversion should ever be set, if the issue is to be fixed in additional releases then a separate backport must be created (See Working with backports in JBS).  There are exceptions to this rule for: CSRs; and, Release Notes.
1. make sure the bug has all the required labels – JBS Label Dictionary
    1. bugs that are new in the current release: 'regression'
    1. bugs that do not affect product code, but are only against the regression test: 'noreg-self'
    1. issues that seem to be trivial to fix: 'starter'
    1. RFEs that are pure cleanups: 'noreg-cleanup'
    1. project specific issues usually have their own labels as well

At this point move the issue into the [Open]{.jbs-field} state, bring high priority (P1, P2) bugs to the attention of the team.

### Sensitive information (e.g. hs_err.log)

It may sound obvious, but avoid placing sensitive information in bug reports. Things like user names, IP addresses, host names, and exact version information of third party libraries etc may be crucial to be able to debug in some cases, but could also help an attacker gain information about your system. JBS is a public database that anyone can search, so be mindful of what you place there. In particular when attaching log files like the hs_err.log you should make sure that you are comfortable with sharing the details exposed in it. Sometimes it may be better to leave a comment saying that these details can be obtained on request.

If you file a bug through the [Bug Report Tool](https://bugreport.java.com/) there's a specific field that should be used to place sensitive information like this. Information placed there will not be part of the public bug report.

## Updating an issue while fixing

Once you are made, or you make yourself, the assignee of an Issue you take on the responsibility of moving the issue through to resolution and providing the current status, and ultimately leaving a record for others in the future to understand what happened.  There are no set rules for how you manage the bug while you are assigned to it, as it depends on the type and importance of an issue.  A simple update to the doc needs little to be done, fix the problem and close the issue; an intricate timing issue or crash should be handled differently - documenting your progress in identifying the problem (for example
[JDK-8212207](https://bugs.openjdk.org/browse/JDK-8212207),
[JDK-6984895](https://bugs.openjdk.org/browse/JDK-6984895),
[JDK-8287982](https://bugs.openjdk.org/browse/JDK-8287982)
), this is especially helpful if you ultimately move the Issue to a different area as you have found that the problem lies elsewhere, or is closed as [Will Not Fix]{.jbs-field}.  Your updates then provide a resource to others to better understand what has been done or the code. See [The Importance of Writing Stuff Down](https://stuartmarks.wordpress.com/2023/02/22/the-importance-of-writing-stuff-down) for a good explanation as to why it is also important to write an evaluation when something is not fixed.

Some additional fields should be filled in as you get a better understanding of the issue:
- for a regression, if you identify the fix that caused it add a link to that issue (and add a [regression_]{.jbs-field}*(ID)* label) and set the _Introduced in Release_ field.
- The [Description]{.jbs-field} usually explains what went wrong and how the failure was found, then there's some investigation and eventually the root cause is found. At this point the [Summary]{.jbs-field} should be updated to correctly describe the bug. The [Description]{.jbs-field} however should remain a description of how the failure was found.

## Resolving an issue

Once the work on an issue has been completed this should be indicated in JBS by moving the issue to a "closed" state.  There are two "closed" states: [Resolved]{.jbs-field} and [Closed]{.jbs-field} which can be used interchangeably except in the case of [Fixed]{.jbs-field}, or when flagged as  [Incomplete]{.jbs-field} (See Triaging).

<table class="dictionary" summary="JBS Label Dictionary">
  <tr style="text-align:left;"><th>Type</th><th>Covers</th></tr>
<tr>
    <td class="dictionary">[Fixed]{.jbs-field}</td>
    <td class="dictionary">If a change is required in a repo to address an issue then the [Fixed]{.jbs-field} status should be used - for the JDK project in almost all cases the bots will transition the issue to [Fixed]{.jbs-field} when the changeset is pushed to the repo.<br />
<ul>
        <li>Once a bug is marked as fixed there is now the option of someone, other than the person that fixed it, marking it as [Verified]{.jbs-field} to confirm that the issue is fix after testing; marking it as [Fix Failed]{.jbs-field} if it did not solve the issue; or, [Not Verified]{.jbs-field} to indicate that it wasn't explicitly tested.  Note that the UI does not highlight when [Fix Failed]{.jbs-field} has been set, you need to look for the [Verification]{.jbs-label} Field at the bottom of the left-hand colum in the Details section.</li>
</ul><br />
    If there is not a fix in the repo (and so no associated changeset) then the issue should not be marked as [Fixed]{.jbs-field}, but set to [Delivered]{.jbs-field}<br />
    If you know that an issue was fixed, try searching for the issue that resolved it and close it as a duplicate of that issue. If that would entail a significant effort, and/or it isn't a critical issue, close it out as Not Reproducible.<br />
    </td>
</tr>
<tr>
    <td class="dictionary">[Won't Fix]{.jbs-field}</td>
    <td class="dictionary">Used when the issue is describing behavior which, while maybe problematic or not ideal, is not going to be changed - for compatibility reasons for example</td>
</tr>
<tr>
    <td class="dictionary">[Duplicate]{.jbs-field}</td>
    <td class="dictionary">Where the same issue is described in another issue then close one against the other as a [Duplicate]{.jbs-field}. In general the new issue is closed as a duplicate of the older one, but where the newer issue has a clearer description then doing it the other way round is ok</td>
</tr>
<tr>
    <td class="dictionary">[Incomplete]{.jbs-field}</td>
    <td class="dictionary">Described above</td>
</tr>
<tr>
    <td class="dictionary">[Cannot Reproduce]{.jbs-field}</td>
    <td class="dictionary">Use when a reproducer is provided (or clear steps) but it is not possible to see the same behavior. When you can't reproduce an issue, where feasible try on the release the issue was reported against, as a way of confirming that it is indeed addressed on the latest release, rather than you not having the right environment in which to reproduce the issue</td>
</tr>
<tr>
    <td class="dictionary">[Other]{.jbs-field}</td>
    <td class="dictionary">Used where none of the other statuses fit the situation</td>
</tr>
<tr>
    <td class="dictionary">[Future Project]{.jbs-field}</td>
    <td class="dictionary">This status is not recommended</td>
</tr>
<tr>
    <td class="dictionary">[External]{.jbs-field}</td>
    <td class="dictionary">Use where the issue is due to a problem in a Java library (not shipped with the JDK) or an IDE or other external tool</td>
</tr>
<tr>
    <td class="dictionary">[Not an Issue]{.jbs-field}</td>
    <td class="dictionary">Use when the behavior is expected and valid (cf. [Won't Fix]{.jbs-field}) and the reporter perhaps has misunderstood what the behavior should be</td>
</tr>
<tr>
    <td class="dictionary">[Migrated]{.jbs-field}</td>
    <td class="dictionary">Used rarely, but can be seen when issues are transferred into another Project by opening up a separate issue in that Project, with the issue in the original Project being [Closed]{.jbs-field}</td>
</tr>
<tr>
    <td class="dictionary">[Rejected]{.jbs-field}</td>
    <td class="dictionary">This status should not be used</td>
</tr>
<tr>
    <td class="dictionary">[Withdrawn]{.jbs-field}</td>
    <td class="dictionary">Is essentially the partner state to Delivered for issues that would not have resulted in a fix to the repo, and also part of the [CSR](https://wiki.openjdk.org/display/csr/Main) and Release Note process</td>
</tr>
<tr>
    <td class="dictionary">[Delivered]{.jbs-field}</td>
    <td class="dictionary">Use to close out issues where a change to the code is not required, common examples are Release Notes</td>
</tr>
<tr>
    <td class="dictionary">[Approved]{.jbs-field}</td>
    <td class="dictionary">Used as part of the [CSR process](https://wiki.openjdk.org/display/csr/Main)
</tr>
<tr>
    <td class="dictionary">Challenge States</td>
    <td class="dictionary">[Exclude [Challenge]]{.jbs-field}, [Alternative Tests [Challenge]]{.jbs-field}, and [Reject [Challenge]]{.jbs-field} are only relevant within the context of the JCK Project</td>
</tr>
</table>

## JBS labels

JBS labels are used to tag and group related issues. JBS labels are an open namespace, which means that anyone can create new labels at any time. In order to avoid confusion, however, it's best to reuse existing labels where possible. Most areas have their commonly used labels to identify issues in their respective area. Make an effort to find and use these labels. This can be done by editing the [Labels]{.jbs-field} field of a bug and entering the first few characters of the label you want to add. JIRA will pop up an autocomplete window with existing labels that match that prefix. Then choose one of the existing labels. Using the autocomplete window is preferable to typing the whole label name (even if you're a good typist) because it's easy for minor spelling errors to creep in, which can inadvertently introduce multiple labels with spurious spelling variations.

JBS labels should not be used to write documentation - don't try to write sentences using labels. Adding a number of random labels is unlikely to be helpful to anyone.

> ---
>
> ### Labels are case sensitive
> When using labels in Jira gadgets (like pie charts, heat maps, and statistics tables) Jira will be case-sensitive and treat e.g. OpenJDK and openjdk as two different labels. Searching however is case-insensitive. This means that if you group a set of issues in a gadget based on a label, and then click one of the groups to see the list of issues, that list will contain more results than the gadget if there are usages of the label with different casing. This can be very confusing and for this reason the recommendation is to stick with the commonly used case for all labels, regardless of your personal taste for upper or lower case letters. Most labels are lower case only, but there are examples where upper case letters are used in the most common version of a label. Use of the autocomplete popup window (described above) when adding labels will avoid inadvertent introduction of labels with differing case.
>
> ---

## JBS label dictionary

This table contains some frequently used JBS labels and their meaning. Please help keeping this dictionary up to date by adding your favorite labels. This table doesn't dictate how to use labels, but rather document how they are used. That said, obviously it will help everyone if we try to follow a common standard and use similar labels in the same way across all entities that use JBS.

<table class="dictionary" summary="JBS Label Dictionary">
  <tr style="text-align:left;"><th>Label</th><th>Description</th></tr>
  <!-- Area -->
  <tr>
    <td class="dictionary">[*(Area)*[-interest]{.jbs-label}]{#area-interest}</td>
    <td class="dictionary">
      Used to indicate that an area (usually a team or project) is interested in the issue. This label doesn't indicate ownership of the issue. E.g., [redhat-interest]{.jbs-label}, [azul-interest]{.jbs-label}, [coin-interest]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Area)*[-related]{.jbs-label}]{#area-related}</td>
    <td class="dictionary">
      Used to indicate that an issue is related to a specific area (usually a feature or project). This label doesn't indicate ownership of the issue. E.g., [graal-related]{.jbs-label}, [testcolo-related]{.jbs-label}, [doc-related]{.jbs-label}
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
      Used in the rampdown phases of specific releases to request approval of changes that requires project lead approval (or similar) to be included. *(Rel)* is the release in question. E.g., [jdk11-critical-request]{.jbs-label}

      *(Rel)*[-critical-approved]{.jbs-label} is used to signal that the change has been approved for inclusion. E.g., [jdk11-critical-approved]{.jbs-label}<br />
      *(Rel)*[-critical-watch]{.jbs-label} is used for issues that must get into a specific release but risk running late. The label is used while the issue is still in progress and is replaced with *(Rel)*[-critical-request]{.jbs-label} once the issue is resolved. E.g., [jdk11-critical-watch]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-defer-request]{.jbs-label}]{#rel-defer-request}<br />
                           [*(Rel)*[-defer-yes]{.jbs-label}]{#rel-defer-yes}<br />
                           [*(Rel)*[-defer-no]{.jbs-label}]{#rel-defer-no}</td>
    <td class="dictionary">
      Used to request deferral of changes that requires project lead approval (or similar) to defer. *(Rel)* is the release in question. E.g., [jdk12-defer-request]{.jbs-label}

      *(Rel)*[-defer-yes]{.jbs-label} and *(Rel)*[-defer-no]{.jbs-label} are used to indicate wether the deferral has been approved or not. E.g., [jdk12-defer-yes]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](https://openjdk.org/jeps/3#Bug-Deferral-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-enhancement-request]{.jbs-label}]{#rel-enhancement-request}<br />
                           [*(Rel)*[-enhancement-yes]{.jbs-label}]{#rel-enhancement-yes}<br />
                           [*(Rel)*[-enhancement-no]{.jbs-label}]{#rel-enhancement-no}</td>
    <td class="dictionary">
      Used in the rampdown phases to request the late inclusion of an enhancement. *(Rel)* is the release in question. E.g., [jdk10-enhancement-request]{.jbs-label}

      *(Rel)*[-enhancement-yes]{.jbs-label} and *(Rel)*[-enhancement-no]{.jbs-label} are used to indicate the response on the request. E.g., [jdk10-enhancement-yes]{.jbs-label}, [jdk10-enhancement-no]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](http://openjdk.org/jeps/3#Late-Enhancement-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-fix-request]{.jbs-label}]{#rel-fix-request}<br />
                           [*(Rel)*[-fix-SQE-ok]{.jbs-label}]{#rel-fix-SQE-ok}<br />
                           [*(Rel)*[-fix-yes]{.jbs-label}]{#rel-fix-yes}<br />
                           [*(Rel)*[-fix-no]{.jbs-label}]{#rel-fix-no}</td>
    <td class="dictionary">
      Used in rampdown phase 2 to indicate that an issue would be of interest to get integrated into release *(Rel)*. E.g., [jdk12u-fix-request]{.jbs-label}

      *(Rel)*[-fix-SQE-ok]{.jbs-label} is used to indicate that the issue will be covered by the test plan for *(Rel)*. E.g., [jdk12u-fix-SQE-ok]{.jbs-label}<br />
      *(Rel)*[-fix-yes]{.jbs-label} and *(Rel)*[-fix-no]{.jbs-label} are used to indicate wether an issue has been approved for backport to *(Rel)*. E.g., [jdk12u-fix-yes]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](http://openjdk.org/jeps/3#Fix-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[*(Rel)*[-na]{.jbs-label}]{#rel-na}</td>
    <td class="dictionary">
      The [Affects Version/s]{.jbs-field} field is used to indicate the releases where an issue has been seen - it is implied that the issue is also applicable to newer releases. Where this is not the case - for instance a bug in code that was removed in *(Rel)* - then use the *(Rel)-na* to indicate this. Note that there should only be **one** *(Rel)*[-na]{.jbs-label} label on any JBS issue.
    </td>
  </tr>
  <!-- Team -->
  <tr>
    <td class="dictionary">[*(Team)*[-triage-]{.jbs-label}*(Rel)*]{#team-triage-rel}</td>
    <td class="dictionary">
      Used to indicate that *(Team)* has triaged this issue for release *(Rel)*. It's encouraged that all open bugs are triaged on a regular basis so that old bugs aren't forgotten. It's therefore common to see several triage labels on the same issue which helps keeping track of which bugs has been triaged for each release. E.g., [oracle-triage-13]{.jbs-label}

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

      [c2-]{.jbs-label}`.*` labels are used to identify different c2 features. E.g., [c2-intrinsic]{.jbs-label}, [c2-loopopts]{.jbs-label}
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
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[graal]{.jbs-label}]{#graal}</td>
    <td class="dictionary">
      Used to indicate that this is a Graal issue. (Something that needs to be fixed in Graal rather than in OpenJDK.)
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
      The [noreg-]{.jbs-label}`.*` and [nounit-]{.jbs-label}`.*` labels are used to explain why a bugfix doesn't need/have a regression test or a unit test. The suffix of the label is described below.

      Please note that the [noreg-]{.jbs-label} namespace is closed, meaning that no new [noreg-]{.jbs-label} labels should be added unless properly
      motivated, discussed, and agreed upon.

[[-sqe]{.jbs-label}]{#noreg-sqe}
:    Change can be verified by running an existing SQE test suite; the bug should identify the suite and the specific test case(s).

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
      One or more tests has been problem-listed due to this bug.
    </td>
  </tr>
  <!-- Q -->
  <!-- R -->
  <tr>
    <td class="dictionary">[[regression]{.jbs-label}]{#regression}</td>
    <td class="dictionary">
      Used to identify regressions. A regression is a bug that didn't exist in the previous release. Ideally all regressions must be fixed in the following release. All regressions must have the [Affects Version/s]{.jbs-field} set.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[regression_]{.jbs-label}*(ID)*]{#regressionId}</td>
    <td class="dictionary">
      Used to identify the fix that caused the regression, where known.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[release-note]{.jbs-label}]{#release-note}</td>
    <td class="dictionary">
      Used to indicate that the issue is a release note. See [Release Notes](#release-notes).
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[release-note=yes]{.jbs-label}]{#release-note-yes}<br />
                           [[release-note=no]{.jbs-label}]{#release-note-no}<br />
                           [[~~release-note=done~~]{.jbs-label}]{#release-note-done}</td>
    <td class="dictionary">
      Used to indicate whether a change requires a release note or not. The labels are always placed on the main JBS issue, never on the actual release note issue. See [Release Notes](#release-notes).

      [release-note=done]{.jbs-label} is deprecated and should no longer be used.
    </td>
  </tr>
  <tr>
    <td class="dictionary">[[RN-]{.jbs-label}`.*`]{#rn}</td>
    <td class="dictionary">
      Used to indicate what kind of change the release note is for. See [Release Notes](#release-notes).
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

      Please note that these labels are reserved for bugs seen in the `jdk/jdk` CI pipeline. Use *(Rel)*[-tier1] for other CI pipelines, where *(Rel)* is the name of the pipeline. E.g. [8u-tier1]{.jbs-label}
    </td>
  </tr>
  <!-- U -->
  <!-- V -->
  <tr>
    <td class="dictionary">[[vthreads]{.jbs-label}]{#vthreads}</td>
    <td class="dictionary">
      Used to identify an issue in the virtual thread implementation.
    </td>
  </tr>
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
