# JBS - JDK Bug System

::: {.box}
[Quick Links]{.boxheader}

* [Bug Report Tool](https://bugreport.java.com/)
* [JDK Bug System (JBS)](https://bugs.openjdk.java.net/)
:::

[JBS](https://bugs.openjdk.java.net/) is a public issue tracker used by many OpenJDK projects. It's open for anyone to read and search. In order to get write access you need to be registered in the [OpenJDK Census](https://openjdk.java.net/census), for instance by becoming an [Author](https://openjdk.java.net/bylaws#author) in an OpenJDK [Project](https://openjdk.java.net/bylaws#project).

## Filing a bug

When a new failure is found in the JDK a bug should be filed to describe and track the issue. Depending on your role in OpenJDK you can either use the [Bug Report Tool](https://bugreport.java.com/) or, if you are registered in the [OpenJDK Census](https://openjdk.java.net/census), report the bug directly in [JBS](https://bugs.openjdk.java.net/). Try to make the bug report as complete as possible to make it easier to triage and investigate the bug.

A few things to keep in mind when filing a new bug:

* Before filing a bug, verify that there isn't already a bug filed for this issue.
  * Search [JBS](https://bugs.openjdk.java.net/) for things like the name of the failing test, assert messages, the name of the source code file where a crash occurred etc.
* If you suspect that the bug is a vulnerability, **don't file a JBS issue**. Instead send your bug report to [vuln-report@openjdk.java.net](mailto:vuln-report@openjdk.java.net).
  * Please do *not* report or discuss potential vulnerabilities on any open lists or other public channels.
  * See [OpenJDK Vulnerabilities](https://openjdk.java.net/groups/vulnerability/report) for more information.
* Make a reasonable attempt to narrow down which build or release the failure first appeared in.
* Add relevant [Labels]{.jbs-field} like [[intermittent]{.jbs-label}](#intermittent), [[regression]{.jbs-label}](#regression), [[noreg-self]{.jbs-label}](#noreg-self), [[tier1]{.jbs-label}](#tier) etc.
  * To find relevant labels see the [JBS Label Dictionary](#jbs-label-dictionary)
* Set [Affects Version/s]{.jbs-field} to the JDK version(s) where the failure was seen.
  * If the failure is found in an update train of the JDK (e.g. 11.0.x), please make an effort to see if the bug is also present in [mainline](https://hg.openjdk.java.net/jdk/jdk/).
* Set priority
  * It's not the reporter's responsibility to set a correct priority, but a qualified guess is always better than a default value.
  * To help with setting the right priority consider things like how the bug impacts the product and our testing, how likely is it that the bug triggers, how difficult is it to work around the bug if it's not fixed soon, and whether it's a regression, since that may break existing applications. Regressions are often higher priority than long standing bugs and may block a release if not fixed.
* In the [Description]{.jbs-field}, always include (if possible):
  * full name of the failing tests
  * error messages
  * assert messages
  * stack trace
  * command line information
  * relevant information from the logs
* If the failure isn't reproducible with an existing OpenJDK test, attach a reproducer if possible.
* Only set [CPU]{.jbs-field} and/or [OS]{.jbs-field} fields if the bug **ONLY** happens on that particular platform.
* Always file separate bugs for different issues.
  * If two crashes looks related but not similar enough to for sure be the same, it's easier to close a bug as a duplicate than it is to extract the relevant info from a bug to create a new one later.

To find out which component to use for different bugs, consult the [directory to area mapping](#directory-to-area-mapping).

## Resolved - Incomplete

To resolve an issue as `Incomplete` is JBS lingo for "Need More Information". An issue that is `Resolved - Incomplete` is *not* closed but more information is needed to be able to work on it. If no more information is obtained within reasonable time the issue should be closed (`Closed - Incomplete`). Closing a resolved issue is done using the `Verify` option.

## JBS Labels

JBS labels are used to tag and group related issues. JBS labels are an open namespace, which means that anyone can create new labels at any time. In order to avoid confusion, however, it's best to reuse existing labels where possible. Most areas have their commonly used labels to identify issues in their respective area. Make an effort to find and use these labels. This can be done by editing the [Labels]{.jbs-field} field of a bug and entering the first few characters of the label you want to add. JIRA will pop up an autocomplete window with existing labels that match that prefix. Then choose one of the existing labels. Using the autocomplete window is preferable to typing the whole label name (even if you're a good typist) because it's easy for minor spelling errors to creep in, which can inadvertently introduce multiple labels with spurious spelling variations.

JBS labels should not be used to write documentation - don't try to write sentences using labels. Adding a number of random labels is unlikely to be helpful to anyone.

> ---
>
> ### Labels are case sensitive
> When using labels in Jira gadgets (like pie charts, heat maps, and statistics tables) Jira will be case sensitive and treat e.g. OpenJDK and openjdk as two different labels. Searching however is case insensitive. This means that if you group a set of issues in a gadget based on a label, and then click one of the groups to see the list of issues, that list will contain more results than the gadget if there are usages of the label with different casing. This can be very confusing and for this reason the recommendation is to stick with the commonly used case for all labels, regardless of your personal taste for upper or lower case letters. Most labels are lower case only, but there are examples where upper case letters are used in the most common version of a label. Use of the autocomplete popup window (described above) when adding labels will avoid inadvertent introduction of labels with differing case.
>
> ---

## JBS Label Dictionary

This table contains some frequently used JBS labels and their meaning. Please help keeping this dictionary up to date by adding your favorite labels. This table doesn’t dictate how to use labels, but rather document how they are used. That said, obviously it will help everyone if we try to follow a common standard and use similar labels in the same way across all entities that use JBS.

<table class="dictionary" summary="JBS Label Dictionary">
  <tr style="text-align:left;"><th>Label</th><th>Description</th></tr>
  <tr>
    <td class="dictionary">
      [*(Area)*[-interest]{.jbs-label}]{#area-interest}
    </td>
    <td class="dictionary">
      Used to indicate that an area (usually a team or project) is interested in the issue. This label doesn't indicate ownership of the issue. E.g., [redhat-interest]{.jbs-label}, [azul-interest]{.jbs-label}, [coin-interest]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Area)*[-related]{.jbs-label}]{#area-related}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to a specific area (usually a feature or project). This label doesn't indicate ownership of the issue. E.g., [graal-related]{.jbs-label}, [testcolo-related]{.jbs-label}, [doc-related]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)*[-bp]{.jbs-label}]{#rel-bp}
    </td>
    <td class="dictionary">
      Used to indicate that a bug would be suitable for backport to a release *(Rel)*. This isn't a decision to backport, just a suggestion / recommendation. E.g., [11-bp]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)*[-critical-request]{.jbs-label}]{#rel-critical-request}<br />
      [*(Rel)*[-critical-approved]{.jbs-label}]{#rel-critical-approved}<br />
      [*(Rel)*[-critical-watch]{.jbs-label}]{#rel-critical-watch}
    </td>
    <td class="dictionary">
      Used in the rampdown phases of specific releases to request approval of changes that requires project lead approval (or similar) to be included. *(Rel)* is the release in question. E.g., [jdk11-critical-request]{.jbs-label}

      *(Rel)*[-critical-approved]{.jbs-label} is used to signal that the change has been approved for inclusion. E.g., [jdk11-critical-approved]{.jbs-label}<br />
      *(Rel)*[-critical-watch]{.jbs-label} is used for issues that must get into a specific release but risk running late. The label is used while the issue is still in progress and is replaced with *(Rel)*[-critical-request]{.jbs-label} once the issue is resolved. E.g., [jdk11-critical-watch]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)*[-defer-request]{.jbs-label}]{#rel-defer-request}<br />
      [*(Rel)*[-defer-yes]{.jbs-label}]{#rel-defer-yes}<br />
      [*(Rel)*[-defer-no]{.jbs-label}]{#rel-defer-no}
    </td>
    <td class="dictionary">
      Used to request deferral of changes that requires project lead approval (or similar) to defer. *(Rel)* is the release in question. E.g., [jdk12-defer-request]{.jbs-label}

      *(Rel)*[-defer-yes]{.jbs-label} and *(Rel)*[-defer-no]{.jbs-label} are used to indicate wether the deferral has been approved or not. E.g., [jdk12-defer-yes]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](https://openjdk.java.net/jeps/3#Bug-Deferral-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)*[-enhancement-request]{.jbs-label}]{#rel-enhancement-request}<br />
      [*(Rel)*[-enhancement-yes]{.jbs-label}]{#rel-enhancement-yes}<br />
      [*(Rel)*[-enhancement-no]{.jbs-label}]{#rel-enhancement-no}
    </td>
    <td class="dictionary">
      Used in the rampdown phases to request the late inclusion of an enhancement. *(Rel)* is the release in question. E.g., [jdk10-enhancement-request]{.jbs-label}

      *(Rel)*[-enhancement-yes]{.jbs-label} and *(Rel)*[-enhancement-no]{.jbs-label} are used to indicate the response on the request. E.g., [jdk10-enhancement-yes]{.jbs-label}, [jdk10-enhancement-no]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](http://openjdk.java.net/jeps/3#Late-Enhancement-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)*[-fix-request]{.jbs-label}]{#rel-fix-request}<br />
      [*(Rel)*[-fix-SQE-ok]{.jbs-label}]{#rel-fix-SQE-ok}<br />
      [*(Rel)*[-fix-yes]{.jbs-label}]{#rel-fix-yes}<br />
      [*(Rel)*[-fix-no]{.jbs-label}]{#rel-fix-no}
    </td>
    <td class="dictionary">
      Used in rampdown phase 2 to indicate that an issue would be of interest to get integrated into release *(Rel)*. E.g., [jdk12u-fix-request]{.jbs-label}

      *(Rel)*[-fix-SQE-ok]{.jbs-label} is used to indicate that the issue will be covered by the test plan for *(Rel)*. E.g., [jdk12u-fix-SQE-ok]{.jbs-label}<br />
      *(Rel)*[-fix-yes]{.jbs-label} and *(Rel)*[-fix-no]{.jbs-label} are used to indicate wether an issue has been approved for backport to *(Rel)*. E.g., [jdk12u-fix-yes]{.jbs-label}

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](http://openjdk.java.net/jeps/3#Fix-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)*[-na]{.jbs-label}]{#rel-na}
    </td>
    <td class="dictionary">
      Used to indicate that the issue doesn't affect release *(Rel)* or later. Could for instance be a bug in code that was removed in *(Rel)*. Note that there should only be **one** *(Rel)*[-na]{.jbs-label} label on any JBS issue. The [Affects Version/s]{.jbs-field} field is used to indicate the releases where the issue has been seen.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Team)*[-triage-]{.jbs-label}*(Rel)*]{#team-triage-rel}
    </td>
    <td class="dictionary">
      Used to indicate that *(Team)* has triaged this issue for release *(Rel)*. It's encouraged that all open bugs are triaged on a regular basis so that old bugs aren't forgotten. It's therefore common to see several triage labels on the same issue which helps keeping track of which bugs has been triaged for each release. E.g., [oracle-triage-13]{.jbs-label}

      There are many label variants that include the word triage in some form. The form described above is the only one recommended. Please refrain from using other forms.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[aot]{.jbs-label}]{#aot}
    </td>
    <td class="dictionary">
      Used to identify issues in Ahead of Time Compilation.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
     [[~~appcds~~]{.jbs-label}]{#appcds}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to identify issues in Application Class-Data Sharing. The [cds]{.jbs-label} label is now used instead.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[c1]{.jbs-label}]{#c1}
    </td>
    <td class="dictionary">
      Used to identify issues in the C1 JIT compiler.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[c2]{.jbs-label}]{#c2}<br />
      [c2-]{.jbs-label}`.*`
    </td>
    <td class="dictionary">
      Used to identify issues in the C2 JIT compiler.

      [c2-]{.jbs-label}`.*` labels are used to identify different c2 features. E.g., [c2-intrinsic]{.jbs-label}, [c2-loopopts]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[cds]{.jbs-label}]{#cds}
    </td>
    <td class="dictionary">
      Used to identify issues in Class Data Sharing.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[cleanup]{.jbs-label}]{#cleanup}
    </td>
    <td class="dictionary">
      The [cleanup]{.jbs-label} label is used to indicate enhancements which has no semantic changes, whose only purpose is to make the code more maintainable or better looking.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[docker]{.jbs-label}]{#docker}
    </td>
    <td class="dictionary">
      Used to identify issues in docker support.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[gc-]{.jbs-label}`.*`]{#gc}
    </td>
    <td class="dictionary">
      Used to identify issues in specific garbage collectors in the JVM. E.g., [gc-g1]{.jbs-label}, [gc-shenandoah]{.jbs-label}, [gc-serial]{.jbs-label}, [gc-epsilon]{.jbs-label}

      There are also labels in use to identify different GC features or areas rather than GC algorithms. E.g., [gc-g1-fullgc]{.jbs-label}, [gc-largeheap]{.jbs-label}, [gc-performance]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[graal]{.jbs-label}]{#graal}
    </td>
    <td class="dictionary">
      Used to indicate that this is a Graal issue. (Something that needs to be fixed in Graal rather than in OpenJDK.)
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[graal-integration]{.jbs-label}]{#graal-integration}
    </td>
    <td class="dictionary">
      Reserved for Graal integration umbrella bugs. The automated integration script will break if this label is used for other bugs.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[hgupdate-sync]{.jbs-label}]{#hgupdate-sync}
    </td>
    <td class="dictionary">
      Used to identify backport issues automatically created by HG Updater (a script that monitors the hg repositories for changes).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[~~hs-nightly~~]{.jbs-label}]{#hs-nightly}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to tag bugs found in the HotSpot nightly testing. Since we are now running tiered testing there is no more nightly HotSpot testing. See [tier]{.jbs-label}`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[hs-sbr]{.jbs-label}]{#hs-sbr}
    </td>
    <td class="dictionary">
      Used to identify issues that are found in the "same binary runs", a stress testing method used to find intermittent failures.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [~~[hs-tier]{.jbs-label}`[1-8]`~~]{#hs-tier}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to identify which HotSpot tier a test failure was seen in. We don't separate HotSpot tiers from the JDK tiers anymore. See [tier]{.jbs-label}`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[i18n]{.jbs-label}]{#i18n}
    </td>
    <td class="dictionary">
      Used to identify issue in internationalization. i18n is short for internationalization meaning "i 18 letters and an n".
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[integration-blocker]{.jbs-label}]{#integration-blocker}
    </td>
    <td class="dictionary">
      Used to indicate that a bug is present in a downstream repository but not present in the upstream repository and is therefore blocking integration of downstream changes into upstream.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[intermittent]{.jbs-label}]{#intermittent}<br />
      [[intermittent-environment]{.jbs-label}]{#intermittent-environment}<br />
      [[intermittent-hardware]{.jbs-label}]{#intermittent-hardware}
    </td>
    <td class="dictionary">
      An intermittent issue is one that fails sometimes but not always. The exact reason for the intermittent failure is per definition unknown. Once the reason has been identified the issue is no more considered intermittent. An issue isn't intermittent if some characteristics has been found that triggers the failure consistently, even if the actual cause for the failure hasn't been found. For instance if a test fails every time it's executed on a specific host but not on other hosts it wouldn't be considered intermittent as it fails consistently on that specific host. In other cases it may be that we know that a test sometimes is unlucky in some respect and fails due to this. This test could still be considered intermittent even though we know what the reason is if the reason itself appears intermittently.

      Some issues may seem intermittent when looking at test results, even though the reason for failing is actually known. One example is where a test fails consistently on a specific host, or due to specific conditions in the environment. These failures shouldn't be considered intermittent but it may still be valuable to tag these in JBS with one of the labels [intermittent-hardware]{.jbs-label} or [intermittent-environment]{.jbs-label}. This will help to faster identify that the cause of the failure is known without having to read through the entire bug.

      A test that should be platform agnostic but is consistently failing on a specific OS would for instance be labeled with [intermittent-environment]{.jbs-label}, while a test that fails every time it's run on some specific hardware would be labeled with [intermittent-hardware]{.jbs-label}.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[maintainer-pain]{.jbs-label}]{#maintainer-pain}
    </td>
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
  <tr>
    <td class="dictionary">
      [[noreg-]{.jbs-label}`.*`]{#noreg}<br />
      [[nounit-]{.jbs-label}`.*`]{#nounit}
    </td>
    <td class="dictionary">
      The [noreg-]{.jbs-label}`.*` and [nounit-]{.jbs-label}`.*` labels are used to explain why a bugfix doesn't need/have a regression test or a unit test. The suffix of the label is described below.

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
:    Testing requires a very long running time (e.g., more than a few minutes).

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
  <tr>
    <td class="dictionary">
      [[performance]{.jbs-label}]{#performance}
    </td>
    <td class="dictionary">
      Used to identify an issue with noticeable performance impact. Either positive or negative.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[~~pit~~]{.jbs-label}]{#pit}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to indicate that a failure happened in product integration testing (PIT). Since we are now running tiered testing there is no more PIT. See [tier]{.jbs-label}`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[problemlist]{.jbs-label}]{#problemlist}
    </td>
    <td class="dictionary">
      One or more tests has been problemlisted due to this bug.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[regression]{.jbs-label}]{#regression}
    </td>
    <td class="dictionary">
      Used to identify regressions. A regression is a bug that didn't exist in the previous release. Ideally all regressions must be fixed in order to release the next major version.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[release-note]{.jbs-label}]{#release-note}
    </td>
    <td class="dictionary">
      Used to indicate that the issue is a release note. See [Release Notes](#release-notes).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[release-note=yes]{.jbs-label}]{#release-note-yes}<br />
      [[release-note=no]{.jbs-label}]{#release-note-no}<br />
      [[~~release-note=done~~]{.jbs-label}]{#release-note-done}
    </td>
    <td class="dictionary">
      Used to indicate whether a change requires a release note or not. The labels are always placed on the main JBS issue, never on the actual release note issue. See [Release Notes](#release-notes).

      [release-note=done]{.jbs-label} is deprecated and should no longer be used.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[RN-]{.jbs-label}`.*`]{#rn}
    </td>
    <td class="dictionary">
      Used to indicate what kind of change the release note is for. See [Release Notes](#release-notes).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[starter]{.jbs-label}]{#starter}
    </td>
    <td class="dictionary">
      A starter bug is a well contained, small issue that is suitable for someone new to the codebase.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[startup]{.jbs-label}]{#startup}
    </td>
    <td class="dictionary">
      Used to identify an issue as affecting Java SE startup performance.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[tck-red-]{.jbs-label}*(Rel)*]{#tck-red-rel}<br />
      [[~~tck-red~~]{.jbs-label}]{#tck-red}
    </td>
    <td class="dictionary">
      Used to identify TCK conformance stoppers (e.g. failure of a valid TCK test that exists in a shipped TCK). The release number indicates which release of the TCK that failed. E.g., [tck-red-11]{.jbs-label}

      There are [tck-red]{.jbs-label} labels without the release number out there as well. This usage is deprecated.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[~~test~~]{.jbs-label}]{#test}<br />
      [[~~test-only~~]{.jbs-label}]{#test-only}<br />
      [[~~testbug~~]{.jbs-label}]{#testbug}
    </td>
    <td class="dictionary">
      The labels [test]{.jbs-label}, [test-only]{.jbs-label}, and [testbug]{.jbs-label} are deprecated and should no longer be used. Use [[noreg-self]{.jbs-label}](#noreg) to indicate that an issue is a bug in test code.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[tier]{.jbs-label}`[1-8]`]{#tier}
    </td>
    <td class="dictionary">
      Used to indicate which tier in the `jdk/jdk` CI pipeline a test failure has been seen in. Lower tiers would in general mean higher urgency to fix the issue. E.g., [tier1]{.jbs-label}, [tier2]{.jbs-label}

      Please note that these labels are reserved for bugs seen in the `jdk/jdk` CI pipeline. Use *(Rel)*[-tier1] for other CI pipelines, where *(Rel)* is the name of the pipeline. E.g. [8u-tier1]{.jbs-label}
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[vthreads]{.jbs-label}]{#vthreads}
    </td>
    <td class="dictionary">
      Used to identify an issue in the virtual thread implementation.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[webbug]{.jbs-label}]{#webbug}
    </td>
    <td class="dictionary">
      Used to identify a bug as submitted on [bugs.java.com](https://bugs.java.com/bugdatabase/).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [[zgc]{.jbs-label}]{#zgc}
    </td>
    <td class="dictionary">
      Used to identify an issue in ZGC.
    </td>
  </tr>
</table>

::: {.box}
[To the top](#){.boxheader}
:::
