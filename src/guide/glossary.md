# Glossary

[**provisional**]{#provisional} (in the CSR)
:   The stage of the CSR process after "DRAFT", and "PROPOSED". At this stage the primary goals are to ensure that the proposed changes are suitable for the release in a general sense.

[**approved**]{#approved} (by the CSR)
:   The stage of the CSR process after "FINALIZED". The CSR has approved the final version of the request which permits push into the project repository.

[**changeset**]{#changeset}
:   A collection of changes with respect to the current clone of a repository.

[**forest**]{#forest}
:   A collection of Mercurial repositories which can be managed as a set of nested repositories. The name "Forest" originally came from the Mercurial "Forest Extension" which can be used with some versions of Mercurial, but in general is no longer recommended. The script `common/bin/hgforest.sh` can be used to apply a Mercurial `hg` command to all the repositories in a forest.

[**repository**]{#repository}
:   A directory tree in the filesystem that Mercurial treats specially. This tree contains the source files and their revision history.

[**trivial**]{#trivial}
:   A change that is small, well contained, and that makes no semantic changes. Typical examples are fixing obvious typos or renaming a local identifier. A trivial change can also be pushing an already-reviewed change that was missed in an earlier push (e.g., forgot to add a file) or generated changes like a [`git revert`](#backing-out-a-change). It's up to the author of a change to claim that the change is trivial in the RFR, and it's up to the Reviewer whether to approve such a claim. A change is trivial only if the Reviewer agrees that it is. A trivial change doesn't need to wait 24 hours before being pushed, and it only needs one Reviewer, even in areas where stricter rules for pushing normally apply.

[**webrev**]{#webrev}
:   A tool and its output. In JDK release forests, the script, [`webrev.ksh`](https://hg.openjdk.java.net/code-tools/webrev/raw-file/tip/webrev.ksh), examines a forest or repository to generate a set of web-based views of differences.

::: {.box}
[To the top](#){.boxheader}
:::
