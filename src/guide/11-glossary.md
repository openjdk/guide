# Glossary

[**accepted**]{#accepted} (by the CCC)
:   The stage of the CCC process after "DRAFT", and "PROPOSED". At this stage the primary goals are to ensure that the proposed changes are suitable for the release in a general sense and that the requisite JCK and SQE resources will be available.

[**approved**]{#approved} (by the CCC)
:   The stage of the CCC process after "FINAL". The CCC has approved the final version of the request which permits push into the project forest.

[**changeset**]{#changeset}
:   A collection of changes with respect to the current clone of a repository.

[**development freeze**]{#developmentfreeze}
:   The date by which all planned work should be complete for a particular line of development. After a line's development freeze, only exit-criteria bugs may be fixed in that line.

[**forest**]{#forest}
:   A collection of Mercurial repositories which can be managed as a set of nested repositories. The name "Forest" originally came from the Mercurial "Forest Extension" which can be used with some versions of Mercurial, but in general is no longer recommended. The script `common/bin/hgforest.sh` can be used to apply a Mercurial `hg` command to all the repositories in a forest.

[**Group**]{#group}
:   A collection of [Participants](https://openjdk.java.net/bylaws#participant) who engage in open conversation about a common interest. That interest may be in the creation, enhancement, or maintenance of a specific body of code or it may lie in other areas, e.g., quality, documentation, or evangelism. See the [Group overview](https://openjdk.java.net/groups/).

[**Mercurial**]{#mercurial}
:   A free, cross-platform, distributed source management tool. Source bundles and binary packages for Mercurial are available at [https://www.selenic.com/mercurial/wiki/index.cgi](https://www.selenic.com/mercurial/wiki/index.cgi/Mercurial). The main Mercurial documentation is available at [http://hgbook.red-bean.com](https://hgbook.red-bean.com/).

[**Project**]{#project}
:   A collaborative effort to produce a specific artifact, which may be a body of code, or documentation, or some other material. See the [Project overview](https://openjdk.java.net/projects/).

[**repository**]{#repository}
:   A directory tree in the filesystem that Mercurial treats specially. This tree contains the source files and their revision history.

[**trivial**]{#trivial}
:   A change that is small, well contained, and that makes no semantic changes. Typical examples are fixing obvious typos or renaming a local identifier. A trivial change can also be pushing an already-reviewed change that was missed in an earlier push (e.g., forgot to add a file) or generated changes like a [`git revert`](#backing-out-a-change). It's up to the author of a change to claim that the change is trivial in the RFR, and it's up to the Reviewer whether to approve such a claim. A change is trivial only if the Reviewer agrees that it is. A trivial change doesn't need to wait 24 hours before being pushed, and it only needs one Reviewer, even in areas where stricter rules for pushing normally apply.

[**webrev**]{#webrev}
:   A tool and its output. In JDK release forests, the script, [`webrev.ksh`](https://hg.openjdk.java.net/code-tools/webrev/raw-file/tip/webrev.ksh), examines a forest or repository to generate a set of web-based views of differences.
