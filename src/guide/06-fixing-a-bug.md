# Fixing a Bug

This is the list of steps which should be performed when fixing a small bug. Small bugs include typos in code or specification, algorithm improvements for correctness or performance, and code changes required to correctly implement the specification.

> ---
> Some steps refer to operations which can't be performed directly without the assistance of a [Project Committer](https://openjdk.java.net/bylaws#committer). For example, any changes to the [bug database](https://bugs.openjdk.java.net) fall into this category. Since these steps are required, [Contributors](https://openjdk.java.net/bylaws#contributor) are urged to work with their [Sponsors](https://openjdk.java.net/sponsor/) to complete these tasks.

> ---

For the purposes of brevity this document will use the term "bug" to refer to both bugs and enhancements unless otherwise noted. Hence "fix for a bug" could also imply "implementation for an enhancement".

#. **Discuss the intended change**

   Send an e-mail to the appropriate development mailing list for the Project that maintains the code. The e-mail should have a subject line of the form:

       6543210: My favorite bug

   where `6543210` is replaced with the actual bug id number or "[NEW BUG]" if the bug id isn't known and `My favorite bug` is replaced with the bug's summary.  The message should describe the intended change, which components may be affected, and any other risks or concerns.

#. **Does a bug id exist for the work?**

   **Yes**
   :   Continue

   **No**
   :   Create a bug in an appropriate component/sub-component.

#. **Set the bug status to "Open"**

   This communicates intent to fix the bug to other members of the Project. It also sets the expectation for downstream teams such as SQE and JCK that the bug will be fixed in an upcoming integration.

#. **Does the fix for the bug require a specification change, directly affect an external interface, or otherwise have a compatibility impact?**

   **Yes**
   :   Submission of a CSR request is required. The CSR must be [approved](#approved) before the bug fix is pushed to a feature release or update release repository. The work may begin concurrently with the CSR review, but may need to be modified in response to CSR feedback.

   **No**
   :   Continue

#. **Fix the bug**

   Assuming that the development team approves of the intended approach, begin working on the code using the latest source available from the appropriate OpenJDK Project [repository](https://hg.openjdk.java.net).

#. [**Is it possible to write a test to detect the bug?**]

   **Yes**
   :   For bugs, provide a [jtreg](https://openjdk.java.net/jtreg/) regression test as part of the changeset. For enhancements that directly affect one or more exported interfaces, add an adequate set of jtreg unit tests as part of the changeset. By convention all regression and unit tests should contain a [\@bug tag](https://openjdk.java.net/jtreg/tag-spec.html#INFORMATIONAL_TAGS9) referencing at least one bugid.

   :   An entirely new test (or tests) may not be required. For example, if the bug is an existing regression test failure, then when fixing the bug you should just add the new bug ID to the list of space-delimited bugs in the [\@bug tag](https://openjdk.java.net/jtreg/tag-spec.html#INFORMATIONAL_TAGS) of the failing regression test, even if the test didn't need to be updated.

   **No**
   :   An explanation for why a test is unnecessary or infeasible is required. Such an explanation is recorded by adding a label, and possibly a comment, to the bug report. The label has the prefix **`noreg`** for regression tests and **`nounit`** for unit tests. The suffix of the label is described in detail in the [JBS Label Dictionary](#noreg)

#. **Is modification of shared Java code needed?**

   **Yes**
   :   It's often sufficient to build and test on a single platform, but sometimes it's not. Use discretion.

   **No**
   :   Continue

#. **Is modification of shared C code needed?**

   **Yes**
   :   Build and test on at least one instance of all three of the supported operating systems (Solaris, Linux, and Windows).

   **No**
   :   Continue

#. **Is modification of C or Java platform-specific code needed?**

   **Yes**
   :   Build and test on all relevant platforms.  Code under `src/solaris` builds on Solaris, Linux, and MacOS X despite its name.

   **No**
   :   Continue

#. **Run relevant regression and unit tests on all relevant platforms**

   These include tests for external interfaces as well as other kinds of tests, e.g., HotSpot tests that use internal verification mechanisms.

#. **Run relevant JCK tests on all relevant platforms**

   Running JCK tests is particularly important if the change may have unexpected side-effects.

#. **Request a review of the changes by sending an e-mail to the development alias**

   A patch can be submitted as described in [Contributing](https://openjdk.java.net/contribute/). Alternatively, a ["webrev"](webrevHelp.html) may be generated and uploaded to the [community code review](https://cr.openjdk.java.net/) server. The complete webrev generation and upload procedure is described at [https://cr.openjdk.java.net](https://cr.openjdk.java.net/).

   Changeset pushes before the [Feature Complete](https://openjdk.java.net/projects/jdk8/milestones#Feature_Complete) require at least one [Reviewer](https://openjdk.java.net/bylaws#reviewer); pushes after the Feature Complete require at least two Reviewers. In either case, the more the merrier. Some teams may require more Reviewers. Check with members of the Project.

   Reviewers should examine not only the code being added or changed but also the relevant unit or regression tests.

   A change may require multiple Reviewers because it affects multiple areas.  Reviewers should be aware that they take full responsibility for the appropriateness and correctness of any changes in their area of expertise.  If something goes wrong (e.g., the build breaks) and the change&apos;s author is unavailable, they may be asked to deal with the problem. Potential Reviewers are encouraged to refuse to review code for which they aren't qualified.

#. **Create a changeset**

   Follow the instructions in [Producing a Changeset](#producing-a-changeset).

#. **Update the bug content**

   Bug descriptions and comments should be written in a professional manner.

#. **Push the changeset into the Project's forest**

   Follow the instructions in [Producing a Changeset](#producing-a-changeset). If working with a Sponsor, send the changeset to the development mailing list so that they can handle the final push.

   The push will trigger a update to the bug which will make the following changes:

    * Set the bug's "Status" to "Resolved" and "Resolution to "Fixed".
    * Set the bug's "Fix Version/s" to an appropriate release.
    * Set the bug's "Resolved in Build" to "team".
    * Add a Comment containing a reference to the changeset.

_Congratulations!_ Your changeset will now make its way towards a promoted build. When the changeset becomes part of a promoted build, the bug's "Resolved in Build" will have a value of \"b\[1-9\]\[0-9\]&ast;\" to indicate the build number.
