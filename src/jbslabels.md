% JBS Label Dictionary

::: {.NavBit}
[TOC](index.html)
:::

This table contains some frequently used JBS labels and their meaning. Please help keeping this dictionary up to date by adding your favorite labels. This table doesn’t dictate how to use labels, but rather document how they are used. That said, obviously it will help everyone if we try to follow a common standard and use similar labels in the same way across all entities that use JBS.

> ---
> ### Labels are case sensitive
> When using labels in Jira gadgets (like pie charts, heat maps, and statistics tables) Jira will be case sensitive and treat e.g. OpenJDK and openjdk as two different labels. Searching however is case insensitive. This means that if you group a set of issues in a gadget based on a label, and then click one of the groups to see the list of issues, that list will contain more results than the gadget if there are usages of the label with different casing. This can be very confusing and for this reason the recommendation is to stick with the commonly used case for all labels, regardless of your personal taste for upper or lower case letters. Most labels are lower case only, but there are examples where upper case letters are used in the most common version of a label.

> ---

<table class="dictionary">
  <tr style="text-align:left;"><th>Label</th><th>Description</th></tr>
  <tr>
    <td class="dictionary">
      [*(Area)***`-interest`**]{#area-interest}
    </td>
    <td class="dictionary">
      Used to indicate that an area (usually a team or project) is interested in the issue. This label doesn't indicate ownership of the issue. E.g., **`redhat-interest`**, **`azul-interest`**, **`coin-interest`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Area)***`-related`**]{#area-related}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to a specific area (usually a feature or project). This label doesn't indicate ownership of the issue. E.g., **`graal-related`**, **`testcolo-related`**, **`doc-related`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-bp`**]{#rel-bp}
    </td>
    <td class="dictionary">
      Used to indicate that a bug would be suitable for backport to a release *(Rel)*. This is not a decision to backport, just a suggestion / recommendation. E.g., **`11-bp`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-critical-request`**]{#rel-critical-request}<br>
      [*(Rel)***`-critical-approved`**]{#rel-critical-approved}<br>
      [*(Rel)***`-critical-watch`**]{#rel-critical-watch}
    </td>
    <td class="dictionary">
      Used in the rampdown phases of specific releases to request approval of changes that requires project lead approval (or similar) to be included. *(Rel)* is the release in question. E.g., **`jdk11-critical-request`**

      *(Rel)***`-critical-approved`** is used to signal that the change has been approved for inclusion. E.g., **`jdk11-critical-approved`**<br>
      *(Rel)***`-critical-watch`** is used for issues that must get into a specific release but risk running late. The label is used while the issue is still in progress and is replaced with *(Rel)***`-critical-request`** once the issue is resolved. E.g., **`jdk11-critical-watch`**

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-defer-request`**]{#rel-defer-request}<br>
      [*(Rel)***`-defer-yes`**]{#rel-defer-yes}<br>
      [*(Rel)***`-defer-no`**]{#rel-defer-no}
    </td>
    <td class="dictionary">
      Used to request deferral of changes that requires project lead approval (or similar) to defer. *(Rel)* is the release in question. E.g., **`jdk12-defer-request`**

      *(Rel)***`-defer-yes`** and *(Rel)***`-defer-no`** are used to indicate wether the deferral has been approved or not. E.g., **`jdk12-defer-yes`**

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](https://openjdk.java.net/jeps/3#Bug-Deferral-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-enhancement-request`**]{#rel-enhancement-request}<br>
      [*(Rel)***`-enhancement-yes`**]{#rel-enhancement-yes}<br>
      [*(Rel)***`-enhancement-no`**]{#rel-enhancement-no}
    </td>
    <td class="dictionary">
      Used in the rampdown phases to request the late inclusion of an enhancement. *(Rel)* is the release in question. E.g., **`jdk10-enhancement-request`**

      *(Rel)***`-enhancement-yes`** and *(Rel)***`-enhancement-no`** are used to indicate the response on the request. E.g., **`jdk10-enhancement-yes`**, **`jdk10-enhancement-no`**

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](http://openjdk.java.net/jeps/3#Late-Enhancement-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-fix-request`**]{#rel-fix-request}<br>
      [*(Rel)***`-fix-SQE-ok`**]{#rel-fix-SQE-ok}<br>
      [*(Rel)***`-fix-yes`**]{#rel-fix-yes}<br>
      [*(Rel)***`-fix-no`**]{#rel-fix-no}
    </td>
    <td class="dictionary">
      Used in rampdown phases 2 to indicate that an issue would be of interest to get integrated into release *(Rel)*. E.g., **`jdk12u-fix-request`**

      *(Rel)***`-fix-SQE-ok`** is used to indicate that the issue will be covered by the test plan for *(Rel)*. E.g., **`jdk12u-fix-SQE-ok`**<br>
      *(Rel)***`-fix-yes`** and *(Rel)***`-fix-no`** are used to indicate wether an issue has been approved for backport to *(Rel)*. E.g., **`jdk12u-fix-yes`**

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
      Further details are found in the [JDK Release Process](http://openjdk.java.net/jeps/3#Fix-Request-Process).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-na`**]{#rel-na}
    </td>
    <td class="dictionary">
      Used to indicate that the issue does not affect release *(Rel)* or later. Could for instance be a bug in code that was removed in *(Rel)*.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Team)***`-triage-`***(Rel)*]{#team-triage-rel}
    </td>
    <td class="dictionary">
      Used to indicate that *(Team)* has triaged this issue for release *(Rel)*. It's encouraged that all open bugs are triaged on a regular basis so that old bugs aren't forgotten. It's therefore common to see several triage labels on the same issue which helps keeping track of which bugs has been triaged for each release. E.g., **`oracle-triage-13`**

      There are many label variants that include the word triage in some form. The form described above is the only one recommended. Please refrain from using other forms.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`aot`**]{#aot}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to Ahead of Time Compilation.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
     [~~**`appcds`**~~]{#appcds}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to indicate that an issue was related to Application Class-Data Sharing. The **`cds`** label is now used instead.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`c1`**]{#c1}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to the C1 JIT compiler.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`c2`**]{#c2}<br>
      **`c2-`**`.*`
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to the C2 JIT compiler.

      **`c2-`**`.*` labels are used to identify different c2 features. E.g., **`c2-intrinsic`**, **`c2-loopopts`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`cds`**]{#cds}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to Class Data Sharing.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`cleanup`**]{#cleanup}
    </td>
    <td class="dictionary">
      The **`cleanup`** label is used to indicate enhancements which has no semantic changes, whose only purpose is to make the code more maintainable or better looking.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`docker`**]{#docker}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to docker support.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`gc-`**`.*`]{#gc}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to a specific garbage collector in the JVM. E.g., **`gc-g1`**, **`gc-shenandoah`**, **`gc-serial`**, **`gc-epsilon`**

      There are also labels in use to identify different GC features or areas rather than GC algorithms. E.g., **`gc-g1-fullgc`**, **`gc-largeheap`**, **`gc-performance`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`graal`**]{#graal}
    </td>
    <td class="dictionary">
      Used to indicate that this is a Graal issue. (Something that needs to be fixed in Graal rather than in OpenJDK.)
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`graal-integration`**]{#graal-integration}
    </td>
    <td class="dictionary">
      Reserved for Graal integration umbrella bugs. The automated integration script will break if this label is used for other bugs.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`hgupdate-sync`**]{#hgupdate-sync}
    </td>
    <td class="dictionary">
      Used to identify backport issues automatically created by HG Updater (a script that monitors the hg repositories for changes).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [~~**`hs-nightly`**~~]{#hs-nightly}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to tag bugs found in the HotSpot nightly testing. Since we are now running tiered testing there is no more nightly HotSpot testing. See **`tier`**`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`hs-sbr`**]{#hs-sbr}
    </td>
    <td class="dictionary">
      Used to tag bugs that are found in the "same binary runs", a stress testing method used to find intermittent failures.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [~~**`hs-tier`**~~~~`[1-8]`~~]{#hs-tier}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to identify which HotSpot tier a test failure was seen in. We don't separate HotSpot tiers from the JDK tiers anymore. See **`tier`**`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`i18n`**]{#i18n}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to internationalization.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`integration-blocker`**]{#integration-blocker}
    </td>
    <td class="dictionary">
      Used to indicate that a bug is present in a downstream repository but not present in the upstream repository and is therefore blocking integration of downstream changes into upstream.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`intermittent`**]{#intermittent}<br>
      [**`intermittent-environment`**]{#intermittent-environment}<br>
      [**`intermittent-hardware`**]{#intermittent-hardware}
    </td>
    <td class="dictionary">
      An intermittent issue is one that fails sometimes but not always. The exact reason for the intermittent failure is per definition unknown. Once the reason has been identified the issue is no more considered intermittent. An issue isn't intermittent if some characteristics has been found that triggers the failure consistently, even if the actual cause for the failure has not been found. For instance if a test fails every time it is executed on a specific host but not on other hosts it wouldn't be considered intermittent as it fails consistently on that specific host. In other cases it may be that we know that a test sometimes is unlucky in some respect and fails due to this. This test could still be considered intermittent even though we know what the reason is if the reason itself appears intermittently.

      Some issues may seem intermittent when looking at test results, even though the reason for failing is actually known. One example is where a test fails consistently on a specific host, or due to specific conditions in the environment. These failures should not be considered intermittent but it may still be valuable to tag these in JBS with one of the labels **`intermittent-hardware`** or **`intermittent-environment`**. This will help to faster identify that the cause of the failure is known without having to read through the entire bug.

      A test that should be platform agnostic but is consistently failing on a specific OS would for instance be labeled with **`intermittent-environment`**, while a test that fails every time it is run on some specific hardware would be labeled with **`intermittent-hardware`**.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`maintainer-pain`**]{#}
    </td>
    <td class="dictionary">
      Bugs that for some reason is wasting engineering time just by existing, or in other ways are causing pain for the maintainers of the JDK. Examples are bugs that occur frequently in testing or test failures that are time consuming to investigate before determining that it is a pre-existing bug.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`noreg-`**`.*`]{#noreg}<br>
      [**`nounit-`**`.*`]{#nounit}
    </td>
    <td class="dictionary">
      The **`noreg-`**`.*` and **`nounit-`**`.*` labels are used to explain why a bugfix doesn't need/have a regression test or a unit test. The suffix of the label is described below.

[**`-sqe`**]{#noreg-sqe}
:    Change can be verified by running an existing SQE test suite; the bug should identify the suite and the specific test case(s).

[**`-jck`**]{#noreg-jck}
:    Change can be verified by running the JCK; the bug should identify the specific test case(s).

[**`-external`**]{#noreg-external}
:    Change can be verified by running an existing external test suite; the bug should identify the suite and the specific test case(s).

[**`-doc`**]{#noreg-doc}
:    Change only affects documentation.

[**`-demo`**]{#noreg-demo}
:    Change only affects demo code.

[**`-build`**]{#noreg-build}
:    Change only affects build infrastructure (makefiles, copyrights, scripts, etc.).

[**`-self`**]{#noreg-self}
:    Change is a fix to a regression or unit test itself.

[**`-perf`**]{#noreg-perf}
:    Change is for a performance bug for which writing a regression test is infeasible; the bug should describe how to verify the fix.

[**`-hard`**]{#noreg-hard}
:    It is too hard to write a regression or unit test for this bug (e.g., theoretical race condition, complex setup, reboot required, editing of installed files required, specific graphics card required); the bug should explain why.

[**`-long`**]{#noreg-long}
:    Testing requires a very long running time (e.g., more than a few minutes).

[**`-big`**]{#noreg-big}
:    Testing requires an unreasonable quantity of resources (e.g., tens of gigabytes of filesystem space).

[**`-trivial`**]{#noreg-trivial}
:    Change is so trivial that nothing could possibly go wrong with it.

[**`-cleanup`**]{#noreg-cleanup}
:    Change is a cleanup or refactoring of existing code that is covered by existing tests.

[**`-l10n`**]{#noreg-l10n}
:    Change only affects localized text.

[**`-undo`**]{#noreg-undo}
:    Change is a reversion of a previous faulty change.

[**`-other`**]{#noreg-other}
:    Regression or unit test is unnecessary or infeasible for some other reason; the bug report should explain why.

Examples:  If a bug fix only corrects a change in the build system, then add the **`noreg-build`** label to the corresponding bug. If the change improves loop optimizations in HotSpot, then add **`nounit-perf`** to the corresponding bug.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`performance`**]{#performance}
    </td>
    <td class="dictionary">
      Used to identify a bug with noticeable performance impact. Either positive or negative.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [~~**`pit`**~~]{#pit}
    </td>
    <td class="dictionary">
      **Deprecated.** Was used to indicate that a failure happened in product integration testing (PIT). Since we are now running tiered testing there is no more PIT. See **`tier`**`[1-8]`.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`problemlist`**]{#problemlist}
    </td>
    <td class="dictionary">
      One or more tests has been problemlisted due to this bug.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`regression`**]{#regression}
    </td>
    <td class="dictionary">
      A regression is a bug that did not exist in the previous release. Ideally all regressions must be fixed in order to release the next major version.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`release-note`**]{#release-note}
    </td>
    <td class="dictionary">
      Used to indicate that the issue is a release note. The release-note issue is a sub-task to the main JBS issue containing the text to be used in the release note. The release note must also have one of the following labels:

[**`RN-NewFeature`**]{#RN-NewFeature}
:   New Feature or enhancement.

[**`RN-IssueFixed`**]{#RN-IssueFixed}
:   A significant issue which has been fixed, would normally be a regression or an issue which unknowingly released in a new feature.

[**`RN-KnownIssue`**]{#RN-KnownIssue}
:   An issue that was not possible to fix by the time the release was GA'd.

[**`RN-Removed`**]{#RN-Removed}
:   Covers an API, feature, tool etc. which has been removed from the JDK.

[**`RN-Deprecated`**]{#RN-Deprecated}
:   Covers an API that has been marked as deprecated in the release.

[**`RN-Important`**]{#RN-Important}
:   Used to indicate that the release note should be highlighted in some fashion, such as listing it at the beginning of the release notes.

[**`RN-`(distro)**]{#RN-distro}
:   Used to indicate that the release note is only relevant for a specific JDK distribution. E.g. RN-Oracle

[~~**`RN-Change`**~~]{#RN-Change}
:   Deprecated.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`release-note=yes`**]{#release-note-yes}<br>
      [**`release-note=no`**]{#release-note-no}<br>
      [~~**`release-note=done`**~~]{#release-note-done}
    </td>
    <td class="dictionary">
      Used to indicate wether a change requires a release note or not. The labels are always placed on the main JBS issue, never on the actual release note issue.

      **`release-note=done`** is deprecated and should no longer be used.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`starter`**]{#starter}
    </td>
    <td class="dictionary">
      A starter bug is a well contained, small issue that is suitable for someone new to the codebase.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`startup`**]{#startup}
    </td>
    <td class="dictionary">
      Used to identify a bug as affecting Java SE startup performance.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`tck-red-`***(Rel)*]{#tck-red-rel}<br>
      [~~**`tck-red`**~~]{#tck-red}
    </td>
    <td class="dictionary">
      Used to identify TCK conformance stoppers (e.g. failure of a valid TCK test that exists in a shipped TCK). The release number indicates which release of the TCK that failed. E.g., **`tck-red-11`**

      There are **`tck-red`** labels without the release number out there as well. This usage is deprecated.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [~~**`test`**~~]{#test}<br>
      [~~**`test-only`**~~]{#test-only}<br>
      [~~**`testbug`**~~]{#testbug}
    </td>
    <td class="dictionary">
      The labels **`test`**, **`test-only`**, and **`testbug`** are deprecated and should no longer be used. Use [**`noreg-self`**](#noreg) to indicate that an issue is a bug in test code.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`tier`**`[1-8]`]{#tier}
    </td>
    <td class="dictionary">
      Used to indicate which tier in the jdk/jdk CI pipeline a test failure has been seen in. Lower tiers would in general mean higher urgency to fix the issue. E.g., **`tier1`**, **`tier2`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`webbug`**]{#webbug}
    </td>
    <td class="dictionary">
      Used to identify a bug as submitted on [bugs.java.com](https://bugs.java.com/bugdatabase/).
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`zgc`**]{#zgc}
    </td>
    <td class="dictionary">
      Used to indicate that an issue is related to ZGC.
    </td>
  </tr>
</table>

::: {.NavBit}
[TOC](index.html)
:::
