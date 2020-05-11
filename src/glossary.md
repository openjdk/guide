% The OpenJDK Developers\' Guide: Glossary

::: {.version}
version 0.02
:::

::: {.NavBit}
[« Previous](faq.html) • [TOC](index.html)
:::

**accepted** (by the CCC)
:   The stage of the CCC process after "DRAFT", and "PROPOSED". At this stage the
    primary goals are to ensure that the proposed changes are suitable for the
    release in a general sense and that the requisite JCK and SQE resources will be
    available.

**approved** (by the CCC)
:   The stage of the CCC process after "FINAL". The CCC has approved the final
   version of the request which permits push into the project forest.

**changeset**
:   A collection of changes with respect to the current clone of a repository.

**development freeze**
:   The date by which all planned work should be complete for a particular line of
    development. After a line's development freeze, only exit-criteria bugs may be
    fixed in that line.

**forest**
:   A collection of Mercurial repositories which can be managed as a set of nested
    repositories. The name "Forest" originally came from the Mercurial "Forest
    Extension" which can be used with some versions of Mercurial, but in general is
    no longer recommended. The script
    `common/bin/hgforest.sh` can be used to apply a
    Mercurial `hg` command to all the repositories in
    a forest.

**Group**
:   A collection of [Participants](/bylaws#participant) who engage in
    open conversation about a common interest. That interest may be in the
    creation, enhancement, or maintenance of a specific body of code or it may lie
    in other areas, e.g., quality, documentation, or evangelism. See the
    [Group overview](../groups/).

**Mercurial**
:   A free, cross-platform, distributed source management tool. Source bundles and
    binary packages for Mercurial are available at
    [http://www.selenic.com/mercurial/wiki/index.cgi](http://www.selenic.com/mercurial/wiki/index.cgi/Mercurial).
    The main Mercurial documentation is available at
    [http://hgbook.red-bean.com](http://hgbook.red-bean.com/).

**Project**
:   A collaborative effort to produce a specific artifact, which may be a body of
    code, or documentation, or some other material. See the
    [Project overview](../projects/).

**repository**
:   A directory tree in the filesystem that Mercurial treats specially. This tree
   contains the source files and their revision history.

**webrev**
:   A tool and its output. In JDK release forests, the script,
    [`webrev.ksh`](http://hg.openjdk.java.net/code-tools/webrev/raw-file/tip/webrev.ksh),
    examines a forest or repository to generate a set of web-based views of
    differences.

::: {.version}
version 0.02
:::

::: {.NavBit}
[« Previous](faq.html) • [TOC](index.html)
:::
