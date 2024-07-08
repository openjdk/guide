# Making a Change

::: {.box}
[Quick Links]{.boxheader}

* [CSR Wiki](https://wiki.openjdk.org/display/csr/Main)
:::

In case you jumped directly here and skipped reading the earlier sections of this guide, please keep in mind that there's a lot more to it than just making a change in the code and submit a PR to GitHub. The list below shows the bare minimum required before a change can be accepted into OpenJDK.

#. **Discuss the intended change** -- See [Contributing to an OpenJDK Project]
#. **Make sure an issue id exists for the work** -- See [Filing an issue]
#. **Initiate a CSR request if your change have a compatibility impact** -- See [Working with the CSR]
#. **Fix the issue** -- See [Cloning the JDK], [Working with git branches], and [Building the JDK]
#. **Write regression tests and run relevant regression and unit tests on all relevant platforms** -- See [Testing the JDK]
#. **Create a changeset** -- See [Working With Pull Requests]
#. **Update the bug content** -- See [Updating an issue while fixing]
#. **Request a review of the changes** -- See [Life of a PR]
#. **Merge with the latest upstream changes and test again**
#. **Integrate the changeset** -- See [Working With Pull Requests]
#. **Write a release note if appropriate** -- See [Release Notes]

## Working with the CSR

Changes that have a compatibility impact will require a separate approval besides the code review. This is handled through a [Compatibility and Specification Review](https://wiki.openjdk.org/display/csr/Main), a.k.a. CSR. Compatibility impact can be things like requiring a specification change, directly affect an external interface, changing command line options, or otherwise alter the behavior of the JDK in ways that could cause issues for users when upgrading to the next JDK version.

See the [CSR wiki](https://wiki.openjdk.org/display/csr/Main) for information on how to work through the CSR process.

The CSR must be approved before the change is allowed to be integrated to a feature release or update release repository. Feature design and implementation work may begin concurrently with the CSR review, but may need to be modified in response to CSR feedback.

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
