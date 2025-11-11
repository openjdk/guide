# Release Notes

::: {.box}
[Quick Links]{.boxheader}

* [JDK Release Notes](https://www.oracle.com/java/technologies/javase/jdk-relnotes-index.html)
* [release-note label description](#release-note)
* [CommonMark Spec](https://spec.commonmark.org/current/)
* [dingus](https://spec.commonmark.org/dingus/)
:::

Release notes for a product such as the JDK are part of the release deliverables providing a way to highlight information about a fix, such as when it may have changed behavior, or when it's decided not to fix something. While what should go into a release note isn't something that can be precisely defined, it should describe changes that are important for a user to take into account when they are upgrading to the specific version. While release notes should not duplicate information in other documents, they can serve to highlight that a change has been made.

Release notes are associated with a JBS issue that has been fixed (or in some cases not been fixed) in a release and are generated with each build of a release. Any note should be considered as an integral part of the fix process, rather than waiting until the end of the release to determine what to write. In OpenJDK, release notes are currently being generated for the JDK and JDK Updates Projects.

## Writing a release note

Writing the release note is the responsibility of the engineer who owns the issue. The note should be generated before the fix is reviewed, or in the case of known issues, when it's determined that a fix won't be possible in the release the issue was found in.

When writing a release note, be prepared for rather picky review comments about grammar, typos, and wording. This is for the sake of the Java community as a whole, as the language of the release note sets the tone for many blogs and news articles. For a widely used product like the JDK, the release notes are often copied verbatim (including typos) and published to highlight news in the release. This means that we need to take extra care to make sure the text in the release note is correct and follows a similar style.

The release note itself is written in a [JBS](#jbs---jdk-bug-system) sub-task of the issue that is used to integrate the change. There are a few steps to follow for the release note to find its way from JBS to the actual release note document.

#. Create a sub-task (More &rightarrow; Create Sub-Task) for the issue that requires a release note - the main issue, that is, the JBS issue that is used to integrate the original change, **not** for backports or the CSR (if there is one).

#. For the newly created sub-task, follow these steps:
   * While the [Priority]{.jbs-field} of the sub-task is set by default to be the same as the priority of the issue itself, it can be changed to adjust in what order the release note is listed compared to other release notes in the same build or release note section.
   * Set the [Assignee]{.jbs-field} to the same person who owns the main issue.
   * The [Summary]{.jbs-field} should be a one sentence synopsis that is informative (and concise) enough to attract the attention of users, developers, and maintainers who might be impacted by the change. It should succinctly describe what has actually changed, not be the original bug title, nor describe the problem that was being solved. It should read well as a sub-section heading in a document.
   * Prefix the [Summary]{.jbs-field} with "Release Note:".
   * Enter the text of the release note in the [Description]{.jbs-field} field using markdown formatting, following the [CommonMark specification](https://spec.commonmark.org/current/). While the markdown won't be rendered in JBS, you can use [dingus](https://spec.commonmark.org/dingus/) to see what the release note will look like. Note that [Github style ascii table formatting](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/organizing-information-with-tables) is supported but will not display correctly in the dingus page. For more information see [General Conventions for Release Notes] below.
   * Set [Component/s]{.jbs-field} and [Subcomponent]{.jbs-field} to the same values as the original bug.
   * Set [Affects Version/s]{.jbs-field} to the release versions for which the release note should be published.
   * Add the [release-note]{.jbs-label} label. This is required for the release note to be included in the release notes.
   * Add the proper [RN-]{.jbs-label}label if applicable to indicate what section of the release notes it should be included in (see [RN-labels] below).
   * Set the [Fix Version/s]{.jbs-field} to the same value that the main issue - in almost all cases this will be the version of mainline.

#. Have the release note ready to be reviewed at the same time as the code is reviewed. If it's later determined that a release note is necessary, then go back to the same engineers who reviewed the fix to review the release note.  Special care should be taken when writing a release note that will cover changes related to a vulnerability fix in order to avoid describing technical details of how it could have been exploited.

#. When you are done, _Resolve_ the release note sub-task as `Delivered`. Only release notes where the sub-task has been resolved as `Delivered` is considered to be part of the EA/GA release notes. To avoid mixing up the release notes with the code fixes that have gone into a particular release or build, we don't use `Resolved/Fixed`.

If you see an issue you feel should have a release note but you are not the assignee of the bug, then add the label [release-note=yes]{.jbs-label} to the main bug (not on a backport nor a sub-task). This acts as a flag to make sure that the release note is considered. This can be done even with fixes that have been shipped already if it's noticed that there is confusion around the change. If, after discussion, it's decided that a release note isn't required either remove the label, or change it to [release-note=no]{.jbs-label} if it makes sense to have a clear indication that a release note isn't required for the fix. The label [release-note=yes]{.jbs-label} can be removed once the release note sub-task has been created.

For examples of well written release note issues in JBS, see [JDK-8276929](https://bugs.openjdk.org/browse/JDK-8276929) or [JDK-8278458](https://bugs.openjdk.org/browse/JDK-8278458).

## General conventions for release notes

The following are general practices that should be followed when creating release notes.

* Release notes should be no longer than 2-3 paragraphs.
* Don't repeat information that will be included in updates to the docs, keep it to a high level summary or key changes.
* Note that where the changes are more fully documented in the JDK documentation, then refer to that document for details. When covering a change in behavior provide some idea to what can be done if a developer or user encounters problems from the change.
* Don't include graphics etc. Refer to the main docs if there are more details that need explaining.
* Don't include your name or affiliation, make sure however, you are the assignee of the release note sub-task.
* If you have a < in the [Summary]{.jbs-field} then use `&lt;`. For <'s in the [Description]{.jbs-field} surround them by back-ticks.

* Avoid using Latin and abbreviations in the release note.
  * Use "also known as" instead of "aka"
  * Use "that is" or "to be specific" instead of "i.e."
  * Use "for example" instead of "e.g."

* The [Summary]{.jbs-field} should be in title case instead of sentence case.
  * Example: Decode Error with Tomcat Version 7.x

* The [Description]{.jbs-field} should be standardized to follow this pattern:
  * Sentence stating the change that was made
  * Background info/context
  * Example: A new system property, `jdk.disableLastUsageTracking`, has been introduced to disable JRE last usage tracking for a running VM.

## Advanced options
  * JEP release notes
    * [Summary]{.jbs-field} - If the change is an actual JEP, use the JEP title.
    * [Description]{.jbs-field} - the JEP Summary text have already been heavily reviewed and also approved by the Project lead. It should be the first sentence in the release note description. That would be analogous to the "change that was made" sentence in other release note descriptions. The remaining text would be composed of the background info from the JEP.
    * [Description]{.jbs-field} - The JEP release note description should contain the link to the JEP.
    * [Labels]{.jbs-field} - The [release-note=yes]{.jbs-label} label should be placed on the JEP issue itself.
  * Single release note for multiple changes
    * A link to the parent issue that the note is a sub-task of, will be placed alongside the summary in the release notes. If note relates to additional changes, then add them as [Relates]{.jbs-field} links to the note and add the label [RN-MultipleLinks]{.jbs-label} - see [JDK-8284975](https://bugs.openjdk.org/browse/JDK-8284975) as an example.
  * Multiple release notes for the same change
      * If more than one release note is required for the same set of fixes, then open additional sub-tasks with the same affects version - see [JDK-8073861](https://bugs.openjdk.org/browse/JDK-8073861) as an example.
  * Release notes across backports
    * If an issue is backported to earlier releases the same note will be used - just add the new release version in the [Affects Version/s]{.jbs-field} field of the release note.
    * Where a different release note is required, then create a separate note with the affects version for the new release - see [JDK-8308194](https://bugs.openjdk.org/browse/JDK-8308194) and [JDK-8322473](https://bugs.openjdk.org/browse/JDK-8322473) for an example.
  * Adding or Updating Release Notes after GA
    * If a note needs to be added after the GA of a release, or an existing note needs updating then create the new note, or update the existing note, and then reach out to [ops@openjdk.org](mailto:ops@openjdk.org).
    * If an existing note should be extended to cover more releases (e.g. after the described change has been backported), update the [Affects Version/s]{.jbs-field} field of the existing note. Only create a new release note if the text differs from the existing one.

## RN-labels

Unless labeled otherwise it will be assumed that the release note documents a change in behavior (will have likely required a CSR) or other item which should be included in the release notes. If the note covers a more specific type of change, then one of the following labels can be included (notes of a similar type will be listed together).

[[RN-NewFeature]{.jbs-label}]{#RN-NewFeature}
:   A new feature or enhancement in the release.
    The [Summary]{.jbs-field} must be the item/API or new functionality.
    The [Description]{.jbs-field} must contain the name of the new feature, its intended function, and how a user can utilize it.
    Example: [JDK-8315443](https://bugs.openjdk.org/browse/JDK-8315443)

[[RN-IssueFixed]{.jbs-label}]{#RN-IssueFixed}
:   A significant issue which has been fixed. This would normally be a regression or an issue which was unknowingly released in a new feature.
    The [Summary]{.jbs-field} must be a summary of the error that was fixed.
    The [Description]{.jbs-field} must contain a statement about what was fixed, how the fix effects the user, and any special conditions that a user should be aware of regarding the fix.
    Example: [JDK-8184172](https://bugs.openjdk.org/browse/JDK-8184172)

[[RN-KnownIssue]{.jbs-label}]{#RN-KnownIssue}
:   An issue that wasn't possible to fix by the time the release was GA'd.
    The [Summary]{.jbs-field} must be a summary of the error that the user sees.
    The [Description]{.jbs-field} must contain details about the error, how it effects the user, and workarounds if any exist.
    Example: [JDK-8191040](https://bugs.openjdk.org/browse/JDK-8191040)

[[RN-Removed]{.jbs-label}]{#RN-Removed}
:   Only for major releases. The release note covers an API, feature, tool etc. which has been removed from the JDK.
    The [Summary]{.jbs-field} must be of the form "Removal of" Item/API.
    The [Description]{.jbs-field} must contain the list or name of the removed items/API with (optional) the reason for its removal. Include any special conditions that a user should be aware of regarding the removal.
    Example: [JDK-8185066](https://bugs.openjdk.org/browse/JDK-8185066)

[[RN-Deprecated]{.jbs-label}]{#RN-Deprecated}
:   Only for major releases. The release notes cover an API, feature, tool etc. that has been marked as deprecated in the release.
    The [Summary]{.jbs-field} must be of the form "Deprecated" Item/API.
    The [Description]{.jbs-field} must contain the name of the item that has been deprecated, the reason for its deprecation, and (optional) any special conditions that a user should be aware of regarding the possible future removal.
    Example: [JDK-8296385](https://bugs.openjdk.org/browse/JDK-8296385)

[[RN-Important]{.jbs-label}]{#RN-Important}
:   Used to indicate that the release note should be highlighted in some fashion, such as listing it at the beginning of the release notes.

[[RN-]{.jbs-label}_(distro)_]{#RN-distro}
:   Used to indicate that the release note is only relevant for a specific JDK distribution. E.g. [RN-Oracle]{.label}

[[RN-MultipleLinks]{.jbs-label}]{#RN-MultipleLinks}
:   Used to indicate that the release note should refer to multiple changes - see [Advanced options](#advanced-options) section.

[[~~RN-Change~~]{.jbs-label}]{#RN-Change}
:   Deprecated. This is the default and no label is needed to indicate this.

## Querying the release notes

The Release Notes for a particular release can be found using the JBS query

~~~
affectedversion = <version> and type = sub-task and labels = release-note
~~~

where `<version>` is the appropriate release value, e.g. 17.

::: {.box}
[To the top](#){.boxheader}
:::
