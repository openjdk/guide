% Change Planning and Guidelines

::: {.NavBit}
[« Previous](codeConventions.html) • [TOC](index.html) • [Next »](reviewBodies.html)
:::

This section describes the development process of identifying a bug or
enhancement (formerly "Request for Enhancement" (RFE)) and providing a
solution. The instructions assume that the
[Contributor](/bylaws#contributor) already has a
working build environment and has some familiarity with an existing OpenJDK
[Project](bylaws#_6) and its repositories.

Three classes of changes are treated in separate sections:

* [Fixing a Bug](#fixing-a-bug) provides a step-by-step
workflow for fixing a simple bug. Of particular note is the list of
[noreg bug labels](#noreg) for changes which do not have regression tests.
* [Adding an API](#adding-an-api) is TBD.
* [Adding a Feature/JSR](#adding-a-featurejsr) is TBD.

## Fixing a Bug

This is the list of steps which should be performed when fixing a small bug.
Small bugs include typos in code or specification, algorithm improvements for
correctness or performance, and code changes required to correctly implement
the specification.

> ---
> Some steps refer to operations which can not be performed directly without the
> assistance of a [Project Committer](http://openjdk.java.net/bylaws#committer).
> For example, any changes to the
> [bug database](http://bugs.openjdk.java.net) fall into
> this category. Since these steps are required,
> [Contributors](http://openjdk.java.net/bylaws#contributor)
> are urged to work with their [Sponsors](/sponsor/)
> to complete these tasks.

> ---

For the purposes of brevity this document will use the term "bug" to refer to
both bugs and enhancements unless otherwise noted. Hence "fix for a bug" could
also imply "implementation for an enhancement".

#. **Discuss the intended change**

   Send an e-mail to the appropriate development mailing list for the Project that
   maintains the code. The e-mail should have a subject line of the form:

   >     6543210: My favorite bug

   where `6543210` is replaced with the actual bug id number or
   "[NEW BUG]" if the bug id is not known and `My favorite bug` is
   replaced with the bug's summary.  The message should describe the intended
   change, which components may be affected, and any other risks or
   concerns.

#. **Does a bug id exist for the work?**

   ---  -----------------------------------------------------------------------
    Y   Continue

    N   Create a bug in an appropriate component/sub-component.
   ---  -----------------------------------------------------------------------

#. **Set the bug status to "Open"**

   This communicates intent to fix the bug to other members of the Project. It
   also sets the expectation for downstream teams such as SQE and JCK that the bug
   will be fixed in an upcoming integration.

#. **Does the fix for the bug require a specification change,
   directly affect an external interface, or otherwise have a compatibility
   impact?**

   ---  -----------------------------------------------------------------------
    Y   Submission of a CSR request is required. The CSR must be [approved](glossary.html#approved) 
        before the bug fix is pushed to a feature release or update release
        repository. The work may begin concurrently with the CSR review, but may
        need to be update in response to CSR review. A summary of the CSR process
        may be found in [Review Bodies](reviewBodies.html).

    N   Continue
   ---  -----------------------------------------------------------------------

#. **Fix the bug**

   Assuming that the development team approves of the intended approach, begin
   working on the code using the latest source available from the appropriate
   OpenJDK Project [repository](http://hg.openjdk.java.net).

#. [**Is it possible to write a test to detect the bug?**]{#noreg}

   +:-:+:---------------------------------------------------------------------+
   | Y | For bugs, provide a [jtreg](../jtreg/) regression test               |
   |   | as part of the changeset. For enhancements that directly affect      |
   |   | one or more exported interfaces, add an adequate set of jtreg unit   |
   |   | tests as part of the changeset. By convention all regression and     |
   |   | unit tests should contain a                                          |
   |   | [\@bug tag](http://openjdk.java.net/jtreg/tag-spec.html#INFORMATIONAL_TAGS9) |
   |   | referencing at least one bugid.                                      |
   +---+----------------------------------------------------------------------+
   |   | An entirely new test (or tests) may not be required. For             |
   |   | example, if the bug is an existing regression test failure, then     |
   |   | when fixing the bug you should just add the new bug ID to the list   |
   |   | of space-delimited bugs in the                                       |
   |   | [\@bug tag](http://openjdk.java.net/jtreg/tag-spec.html#INFORMATIONAL_TAGS) |
   |   | of the failing regression test, even if the test did not need to     |
   |   | be updated.                                                          |
   +---+----------------------------------------------------------------------+
   | N | An explanation for why a test is unnecessary or infeasible is        |
   |   | required.  Such an explanation is recorded by adding a label, and    |
   |   | possibly a comment, to the bug report.  The label has the prefix     |
   |   | "noreg" for regression tests and "nounit" for unit tests.  The       |
   |   | suffixes and their meanings are as follows:                          |
   +---+----------------------------------------------------------------------+
   |   | [**-sqe**]{#noreg-sqe}                                               |
   |   | :    Change can be verified by running an existing SQE test suite;   |
   |   |      the bug should identify the suite and the specific test case(s).|
   |   |                                                                      |
   |   | [**-jck**]{#noreg-jck}                                               |
   |   | :    Change can be verified by running the JCK; the bug should       |
   |   |      identify the specific test case(s).                             |
   |   |                                                                      |
   |   | [**-external**]{#noreg-external}                                     |
   |   | :    Change can be verified by running an existing external test     |
   |   |      suite; the bug should identify the suite and the specific test  |
   |   |      case(s).                                                        |
   |   |                                                                      |
   |   | [**-doc**]{#noreg-doc}                                               |
   |   | :    Change only affects documentation.                              |
   |   |                                                                      |
   |   | [**-demo**]{#noreg-demo}                                             |
   |   | :    Change only affects demo code.                                  |
   |   |                                                                      |
   |   | [**-build**]{#noreg-build}                                           |
   |   | :    Change only affects build infrastructure (makefiles,            |
   |   |      copyrights, scripts, etc.).                                     |
   |   |                                                                      |
   |   | [**-self**]{#noreg-self}                                             |
   |   | :    Change is a fix to a regression or unit test itself.            |
   |   |                                                                      |
   |   | [**-perf**]{#noreg-perf}                                             |
   |   | :    Change is for a performance bug for which writing a regression  |
   |   |      test is infeasible; the bug should describe how to verify the   |
   |   |      fix.                                                            |
   |   |                                                                      |
   |   | [**-hard**]{#noreg-hard}                                             |
   |   | :    It is too hard to write a regression or unit test for this bug  |
   |   |      (e.g., theoretical race condition, complex setup, reboot        |
   |   |      required, editing of installed files required, specific         |
   |   |      graphics card required); the bug should explain why.            |
   |   |                                                                      |
   |   | [**-long**]{#noreg-long}                                             |
   |   | :    Testing requires a very long running time (e.g., more than a    |
   |   |      few minutes).                                                   |
   |   |                                                                      |
   |   | [**-big**]{#noreg-big}                                               |
   |   | :    Testing requires an unreasonable quantity of resources (e.g.,   |
   |   |      tens of gigabytes of filesystem space).                         |
   |   |                                                                      |
   |   | [**-trivial**]{#noreg-trivial}                                       |
   |   | :    Change is so trivial that nothing could possibly go wrong with  |
   |   |      it.                                                             |
   |   |                                                                      |
   |   | [**-cleanup**]{#noreg-cleanup}                                       |
   |   | :    Change is a cleanup or refactoring of existing code that is     |
   |   |      covered by existing tests.                                      |
   |   |                                                                      |
   |   | [**-l10n**]{#noreg-l10n}                                             |
   |   | :    Change only affects localized text.                             |
   |   |                                                                      |
   |   | [**-undo**]{#noreg-undo}                                             |
   |   | :    Change is a reversion of a previous faulty change.              |
   |   |                                                                      |
   |   | [**-other**]{#noreg-other}                                           |
   |   | :    Regression or unit test is unnecessary or infeasible for some   |
   |   |      other reason; the bug report should explain why.                |
   |   |                                                                      |
   |   | Examples:  If a bug fix only corrects a change in the build system,  |
   |   | then add the "noreg-build" label to the corresponding bug. If the    |
   |   | change improves loop optimizations in HotSpot, then add              |
   |   | "nounit-perf" to the corresponding bug.                              |
   +---+----------------------------------------------------------------------+

#. **Is modification of shared Java code needed?**

   ---  -----------------------------------------------------------------------
    Y   It is often sufficient to build and test on a single platform,
        but sometimes it is not. Use discretion.

    N   Continue
   ---  -----------------------------------------------------------------------

#. **Is modification of shared C code needed?**

   ---  -----------------------------------------------------------------------
    Y   Build and test on at least one instance of all three of the
        supported operating systems (Solaris, Linux, and
        Windows).

    N   Continue
   ---  -----------------------------------------------------------------------

#. **Is modification of C or Java platform-specific code needed?**

   ---  -----------------------------------------------------------------------
    Y   Build and test on all relevant platforms.  Code under
        `src/solaris` builds on Solaris, Linux, and MacOS X
        despite its name.

    N   Continue
   ---  -----------------------------------------------------------------------

#. **Run relevant regression and unit tests on all relevant platforms**

   These include tests for external interfaces as well as other kinds of tests,
   e.g., HotSpot tests that use internal verification mechanisms. See
   [Testing Changes](testingChanges.html) for more details.

#. **Run relevant JCK tests on all relevant platforms**

   Running JCK tests is particularly important if the change may have unexpected
   side-effects. See [JCK Acquisition](jckAcquisition.html) for more details.

#. **Request a review of the changes by sending an e-mail to
the development alias**

   A patch can be submitted as described in [Contributing](../contribute/). Alternatively, a
   ["webrev"](webrevHelp.html) may be generated and
   uploaded to the [community code review](http://cr.openjdk.java.net/) server.
   The complete webrev generation and upload procedure is described at
   [http://cr.openjdk.java.net](http://cr.openjdk.java.net/).

   Changeset pushes before the
   [Feature Complete](/projects/jdk8/milestones#Feature_Complete)
   require at least one [Reviewer](/bylaws#reviewer); pushes after
   the Feature Complete require at least two Reviewers. In either case, the
   more the merrier. Some teams may require more Reviewers. Check with
   members of the Project.

   Reviewers should examine not only the code being added or
   changed but also the relevant unit or regression tests.

   A change may require multiple Reviewers because it affects
   multiple areas.  Reviewers should be aware that they take full
   responsibility for the appropriateness and correctness of any changes in
   their area of expertise.  If something goes wrong (e.g., the build breaks)
   and the change&apos;s author is unavailable, they may be asked to deal with
   the problem.  Potential Reviewers are encouraged to refuse to review code
   for which they are not qualified.

#. **Create a changeset**

   Follow the instructions in [Producing a Changeset](producingChangeset.html).

#. **Update the bug content**

   Bug descriptions and comments should be written
   in a professional manner.

#. **Push the changeset into the Project's forest**

   Follow the instructions in [Producing a Changeset](producingChangeset.html).
   If working with a Sponsor, send the changeset to the
   development mailing list so that they can handle the final push.

   The push will trigger a update to the bug which will make the
   following changes:
    
    * Set the bug's "Status" to "Resolved" and "Resolution to "Fixed".
    * Set the bug's "Fix Version/s" to an appropriate release.
    * Set the bug's "Resolved in Build" to "team".
    * Add a Comment containing a reference to the changeset.

_Congratulations!_ Your changeset will now make its
way towards a promoted build. When the changeset becomes part of a promoted
build, the bug's "Resolved in Build" will have a value of \"b\[1-9\]\[0-9\]&ast;\"
to indicate the build number.

## Adding an API

TBD

This section will cover additional considerations for changes that add new
public APIs. For instance, they need to be implementable on all platforms.

## Adding a Feature/JSR

TBD

This section will describe the process for adding new functionality which
requires more than just a few new APIs. In particular, this will cover how the
JSR process interacts with the OpenJDK development life cycle.

::: {.NavBit}
[« Previous](codeConventions.html) • [TOC](index.html) • [Next »](reviewBodies.html)
:::
