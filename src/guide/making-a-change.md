# Making a Change

In case you jumped directly here and skipped reading the earlier sections of this guide, please keep in mind that there's a lot more to it than just making a change in the code and submit a PR to GitHub. The graphics below shows all the steps required before a change can be accepted into OpenJDK.

::: {style="text-align:center;"}
~~~{.mermaid caption="Workflow for fixing an OpenJDK issue" format=svg theme=neutral}
flowchart TD

discuss(<b>Discuss the intended change</b><br><font size=-1><i>See <a href='https://www.openjdk.org/guide/index.html#contributing-to-an-openjdk-project'>Contributing to an OpenJDK Project</a></i></font>)
createIssue(<b>Make sure an issue id exists for the work</b><br><font size=-1><i>See Filing an issue</i></font>)
csr(<b>Initiate a CSR request if your fix have a compatibility impact</b><br><font size=-1><i>See Working with the CSR</i></font>)
fix(<b>Fix the issue</b><br><font size=-1><i>See Cloning the JDK<br>Working with git branches<br>Building the JDK</i></font>)
writeTest(<b>Write regression tests and run relevant regression and unit tests on all relevant platforms</b><br><font size=-1><i>See Testing the JDK</i></font>)
pr(<b>Create a changeset</b><br><font size=-1><i>See Working With Pull Requests</i></font>)
updateIssue(<b>Update the bug content</b>)
review(<b>Request a review of the changes</b>)
testAgain(<b>Merge with the latest changes and test again</b>)
integrate(<b>Push the changeset</b>)
releaseNote(<b>Write a release note if appropriate</b><br><font size=-1><i>See Release Notes</i></font>)

discuss --> createIssue
createIssue --> csr
csr --> fix
fix --> writeTest
writeTest --> pr
pr --> updateIssue
updateIssue --> review
review --> testAgain
testAgain --> integrate
integrate --> releaseNote

~~~
:::


#. **Does the fix have a compatibility impact?**
require a specification change, directly affect an external interface, or otherwise

   **Yes**
   :   Submission of a CSR request is required. The CSR must be [approved](#approved) before the bug fix is pushed to a feature release or update release repository. The work may begin concurrently with the CSR review, but may need to be modified in response to CSR feedback.

   **No**
   :   Continue

#. **Request a review of the changes by sending an e-mail to the development alias**

   A patch can be submitted as described in [Contributing](https://openjdk.org/contribute/). Alternatively, a ["webrev"](webrevHelp.html) may be generated and uploaded to the [community code review](https://cr.openjdk.java.net/) server. The complete webrev generation and upload procedure is described at [https://cr.openjdk.java.net](https://cr.openjdk.java.net/).

   Changeset pushes before the [Feature Complete](https://openjdk.org/projects/jdk8/milestones#Feature_Complete) require at least one [Reviewer](https://openjdk.org/bylaws#reviewer); pushes after the Feature Complete require at least two [Reviewers](https://openjdk.org/bylaws#reviewer). In either case, the more the merrier. Some teams may require more [Reviewers](https://openjdk.org/bylaws#reviewer). Check with members of the [Project](https://openjdk.org/bylaws#project).

   [Reviewers](https://openjdk.org/bylaws#reviewer) should examine not only the code being added or changed but also the relevant unit or regression tests.

   A change may require multiple [Reviewers](https://openjdk.org/bylaws#reviewer) because it affects multiple areas. [Reviewers](https://openjdk.org/bylaws#reviewer) should be aware that they take full responsibility for the appropriateness and correctness of any changes in their area of expertise. If something goes wrong (e.g., the build breaks) and the change&apos;s author is unavailable, they may be asked to deal with the problem. Potential [Reviewers](https://openjdk.org/bylaws#reviewer) are encouraged to refuse to review code for which they aren't qualified.

#. **Push the changeset into the Project's forest**

   Follow the instructions in [Working With Pull Requests]. If working with a Sponsor, send the changeset to the development mailing list so that they can handle the final push.

   The push will trigger a update to the bug which will make the following changes:

    * Set the bug's "Status" to "Resolved" and "Resolution to "Fixed".
    * Set the bug's "Fix Version/s" to an appropriate release.
    * Set the bug's "Resolved in Build" to "team".
    * Add a Comment containing a reference to the changeset.

## Copyright Headers

All source code files in OpenJDK has a header with copyright statements and a license. Since this is legal documentation it shall not be updated or modified without seeking guidance from your legal representative. For that reason this guide can't really give detailed information on what you can or should do. There are however a few generic things that can be clarified.

This is an example copyright/license header:

```
/*
 * Copyright (c) 2018, 2021, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2018, 2020 SAP SE. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */
```

This header has two copyright notices at the top (Oracle and SAP SE) and below them the license text.

As stated in the header, don't make changes to the copyright notices or the license text below them. If your affiliation has a copyright notice at the top of the header, consult your legal representative on how to update it. If your affiliation doesn't have a copyright notice, again consult your legal representative to see if you should add one. Do not update a copyright notice if you don't belong to that affiliation.

If you create a new file, copy the license text from a nearby file. Do not add copyright notices for affiliations to which you don't belong.

If you move code from an existing file to a new file, bring the entire copyright + license header over to the new file.

::: {.box}
[To the top](#){.boxheader}
:::
