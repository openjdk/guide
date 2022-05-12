# Working With the Legacy Mercurial Servers

::: {.box}
[Quick Links]{.boxheader}

* [Mercurial: The Definitive Guide](http://hgbook.red-bean.com/)
* [OpenJDK Mercurial Server](https://hg.openjdk.java.net/)
:::

After the initial release of the JDK source code into OpenJDK in 2007 the OpenJDK project moved from TeamWare to using Mercurial. Starting in 2019 the source revision control has been moved to Git and GitHub. Even though most large projects have moved to Git by now, some still use the Mercurial servers. To access these projects some additional setup is required.

> ---
>
>  There used to be a sandbox repository that could be used for testing purposes. With the move to Git this has been replaced by GitHub Actions.
>
> ---

This document assumes familiarity with the first two chapters of the free on-line book [Mercurial: The Definitive Guide](http://hgbook.red-bean.com).

## Installing and configuring Mercurial

Source bundles and binary packages for Mercurial are available at [https://www.selenic.com/mercurial/wiki/index.cgi](https://www.selenic.com/mercurial/wiki/index.cgi/Mercurial). The OpenJDK repositories recommend installation of Mercurial 2.6.3 (or later). A Mercurial installation is sufficient to clone a repository. Contributors who wish to submit changes will need some additional configuration as described below.

Once Mercurial is installed, create and edit the `~/.hgrc` file to minimally contain the following entry:

    [ui]
    username = <openjdk_username>

_openjdk\_username_ is in general the same as your GitHub user name. (See [Contributing to an OpenJDK Project] for more information.) If you don't have a GitHub user name, you choose your OpenJDK user name when you sign the OCA. The user name should be a plain lowercase, alphanumeric token (not an e-mail address) with twelve characters or less. The first character should be alphabetic. This username will be publicly visible in all Mercurial changeset logs. It will be used to verify that the changeset author is at least an [Author](https://openjdk.java.net/bylaws#author) for the Project and that the person pushing the changeset is at least a [Committer](https://openjdk.java.net/bylaws#committer). It's recommended that the _openjdk\_username_ be somehow related to the Author's full name, such as the first character of the Author's first name followed by the Author's last name.

Some Projects may recommend additional tools or scripts that help with repository manipulation and code development. For instance, in JDK 8u, the utility script `common/bin/hgforest.sh` may be used to apply commands to all the repositories in the [forest](#forest). Some useful Mercurial extensions for OpenJDK developers are [jcheck](https://openjdk.java.net/projects/code-tools/jcheck/), [trees](https://openjdk.java.net/projects/code-tools/trees/), and [Mercurial Queues](http://hgbook.red-bean.com/read/managing-change-with-mercurial-queues.html) (mq). Note that `trees` is enabled on the OpenJDK Mercurial server.

### Verifying the configuration

After installing and configuring Mercurial, validate the configuration using the following steps.

#. Verify that Mercurial is version 2.6.3 (or newer).

       $ hg version
       Mercurial Distributed SCM (version 2.9)
       (see http://mercurial.selenic.com for more information)

       Copyright (C) 2005-2014 Matt Mackall and others
       This is free software; see the source for copying conditions. There is NO
       warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

#. Verify that the list of enabled extensions includes fetch and mq.

       $ hg help

#. Verify that the `~/.hgrc` configuration looks correct. Minimally it should contain the following entries:

       $ hg showconfig
       ui.username=iris

At this point, it should be possible to start retrieving source from the repositories.

## Cloning a Mercurial repository

Some Projects organized their code into multiple Mercurial repositories. For instance, [JDK 8](https://openjdk.java.net/projects/jdk8) uses a forest of multiple related repositories which contain components of the entire JDK. If a Project uses a forest, It's strongly recommended for developers to clone an entire forest, rather than a single repository. This is the only means to ensure consistency in builds. The following examples illustrate two alternatives for cloning the entire `jdk8u/jdk8u-dev` forest into the directory `8u-dev`.

#. To clone the forest using the [trees](https://openjdk.java.net/projects/code-tools/trees/) extension just use `tclone`:

       $ hg tclone http://hg.openjdk.java.net/jdk8u/jdk8u-dev/ 8u-dev

#. To clone the forest using `get_source.sh`, first clone the main tree:

       $ hg clone http://hg.openjdk.java.net/jdk8u/jdk8u-dev/ 8u-dev
       requesting all changes
       adding changesets
       adding manifests
       adding file changes
       added 997 changesets with 1477 changes to 138 files
       updating to branch default
       82 files updated, 0 files merged, 0 files removed, 0 files unresolved

   Then clone the repositories in the forest:

       $ cd 8u-dev
       $ sh ./get_source.sh

Regardless of how the forest was cloned, this is the resulting populated forest.

    $ ls
    ASSEMBLY_EXCEPTION  hotspot    LICENSE   README-builds.html
    common              jaxp       make      test
    configure           jaxws      Makefile  THIRD_PARTY_README
    corba               jdk        nashorn
    get_source.sh       langtools  README

### Cloning a single repository {#cloneSingle}

If the source for the Project is contained within a single repository or reading a limited portion of the source is the only goal, it's possible to clone a single repository (even if it's part of a forest). For instance, this example shows how to clone the `langtools` repository from `jdk8u/jdk8u-dev` into the default destination directory.

    $ hg clone http://hg.openjdk.java.net/jdk8u/jdk8u-dev/langtools
    destination directory: langtools
    requesting all changes
    adding changesets
    adding manifests
    adding file changes
    added 2289 changesets with 21194 changes to 7004 files
    updating to branch default
    6212 files updated, 0 files merged, 0 files removed, 0 files unresolved

## Creating a Mercurial changeset

The timing for creating a changeset is important. Creating the changeset long before it gets pushed into the parent repository may require complex merges. If a changeset is created before sufficient review or testing, a rollback may be required and a new changeset may be required to correct previous mistakes. The [mq extension](http://hgbook.red-bean.com/hgbookch12.html#x16-26500012) is recommended for managing changes before they become committed to a changeset.

In the examples below, the script `common/bin/hgforest.sh` can be used to apply the Mercurial command to all the repositories in the forest. So when you see `hg`, if you are dealing with one repository, just use "`hg`", if it's a forest, use "`sh common/bin/hgforest.sh`".

Each repository in the forest is managed independently. After editing files in the individual cloned repositories of the forest, the `hg status` command may be used to see the changes in a single repository.

    $ hg root
    /u/iris/sandbox/box
    $ hg status
    ? duke/images/DukeTubbingSmall.png
    $ hg add duke/images/DukeTubbingSmall.png
    $ hg status
    A duke/images/DukeTubbingSmall.png

To see changes made to the repositories use `hg status`:

    $ hg status
    [.]
    A duke/images/DukeTubbingSmall.png

In this example, a new file `DukeTubbingSmall.png` was added to a new subdirectory.

### Formatting a changeset comment

A single change is described by a block of text of the following form:

    <bugid>: <synopsis-of-symptom>
    Summary: <summary-of-code-change>
    Reviewed-by: <reviewer>+
    Contributed-by: <contributor-email>

There may be more than one _bugid_ line, but there must be at least one.

The _summary_ line is optional, but authors are strongly encouraged to include one if the nature of the change isn't obvious from the synopsis. It's just one line, meant to give the reader a clue as to how the code changed. A more complete description of the change belongs in the bug report.

A _reviewed-by_ line is required. Reviewers must have the ability to deal with any adverse consequences of the change, and so must themselves be authors. They are therefore identified by their OpenJDK usernames rather than full e-mail addresses.

The _contributed-by_ line is optional. If present, it's a list of comma-separated email addresses. It should be included only when the author of the
change doesn't have commit rights to the target repository and thus would not otherwise receive acknowledgment, or when there are multiple authors.

There will be exceptions for merge changesets, tag changesets, etc.

Example:

    1234567: NPE thrown on FileInputStream("")
    Summary: Rewrite precondition-checking code in io.c
    Reviewed-by: mr
    Contributed-by: Ben Bitdiddle <ben at bits.org>

If a changeset contains multiple unrelated changes (this is frowned upon, but may happen from time to time) then its comment will contain multiple blocks of the above form, separated by blank lines.

The required format of the comments will be enforced whenever the changeset is pushed into the JDK forests. Other Projects may copy these conventions, adopt some other conventions, or have no conventions, depending upon their goals.

### Committing a changeset

The following commands commit all of the changes in a repository to a changeset.

    $ cat ../message
    1111111: Missing Duke gif
    Summary:  Add missing file
    Reviewed-by: iag
    $ hg commit -l ../message
    $ hg toutgoing
    [.]
    comparing with http://hg.openjdk.java.net/sandbox/box
    searching for changes
    changeset:   23:fb12953f3a35
    tag:         tip
    user:        iris
    date:        Wed Dec 12 21:05:59 2007 -0800
    summary:     1111111: Missing Duke gif

## Merging Mercurial changesets

It's often necessary to merge local changes with those made in the parent repositories. The first step in a merge process is to retrieve (or pull) the collection of changesets which have been pushed since the last merge or initial clone. If there if there are merge conflicts, then they must be resolved. [Chapter 3](http://hgbook.red-bean.com/hgbookch3.html#x7-530003) of the Mercurial book contains detailed information on the merging process.

There are two basic ways to update the working set files in the repositories:

Option 1: `hg pull`

> One way to merge the parent repository with the working set of files is to use `hg pull` all by itself. This option allows merging off-line or at a later time.
>
>     $ hg pull
>     [.]
>     pulling from http://hg.openjdk.java.net/jdk8u/jdk8u-dev
>     searching for changes
>     no changes found
>
> In Mercurial, pulling changesets will not update or merge into the working set of files. To update the clone, run `hg update`. If the update reports conflicts, run `hg merge` to resolve them.

Option 2: `hg fetch`

> Alternatively, use `hg fetch` to pull the changes, update the working set files, and create simple merge changesets as necessary. The fetch extension is distributed with Mercurial but needs to be enabled. Edit the `.hgrc` to include the following entries:
>
>     [extensions]
>     fetch=
>
> Once the fetch extension has been enabled, `hg fetch` may be invoked as follows:
>
>     $ hg fetch
>     [.]
>     pulling from http://hg.openjdk.java.net/jdk8u/jdk8u-dev
>     searching for changes
>     no changes found

> ---
>
> Actual file merging will be done with the selected Mercurial merging tool see [MergeProgram](https://www.selenic.com/mercurial/wiki/index.cgi/MergeProgram) for the details on how to define the selected merge tool in ` ~/.hgrc`.
>
> ---

## Pushing Mercurial changesets

In order to push changesets into the parent repository, some additional configuration is required. The following sections describe the operations that will be performed by users with push access.

### Get your SSH key installed

First you should create a new SSH key. See [Generating an SSH key] for guidance on how to do that. Your public key (`~/.ssh/id_rsa.pub`) should be mailed as an attachment along with your JDK username to [keys(at)openjdk.java.net](mailto:keys-at-openjdk.java.net). An administrator will install your key on the server and notify you on completion. This process may take a couple of days.

> ---
>
> Users behind a SOCKS firewall can add a directive to the `~/.ssh/config` file to connect to the OpenJDK Mercurial server:
>
>     Host *.openjdk.java.net
>     ProxyCommand /usr/lib/ssh/ssh-socks5-proxy-connect -h [socks_proxy_address] %h %p
>
> See the `ssh-socks5-proxy-connect` man page and `ssh-config` man page for more information. Other systems may require proxy access via other programs. Some Linux distributions provide the `corkscrew` package which provides ssh access through HTTP proxies.
>
> **It's recommended that all users check with their network administrators before installing any kind of TCP forwarding tool on their network. Many corporations and institutions have strict security policies in this area.**
>
> ---

### Setting the `default-push` path to the server repositories

This is the typical development model:

::: {style="text-align:center;"}
~~~{.mermaid caption="Diagram of server repos and user's clone" format=svg theme=neutral}
graph TD
    subgraph hg.openjdk.java.net
        origin(jdk8u/jdk8u-dev)
    end
    origin --> |clone| local(8u-dev)
    local --> |push| origin
~~~
:::

Changesets need to be _pushed_ via ssh to the read/write repository which resides on the OpenJDK Mercurial server. The easiest way to do this is to have each repository define the "default-push" path in every repository's `.hg/hgrc` file. The `.hg/hgrc` file isn't a managed file - it's private to the repository. The following example defines the "default" and "default-push" paths for clones of the `jdk8u/jdk8u-dev` repository.

    [paths]
    default = http://hg.openjdk.java.net/jdk8u/jdk8u-dev
    default-push = ssh://<JDK_username>@hg.openjdk.java.net/jdk8u/jdk8u-dev

Given a `JDK_username` this simple script will attempt to do this for all the repositories:

    #!/bin/sh
    username=$1
    hgdirs="`find . -type d -name .hg`"
    for i in ${hgdirs}; do
      d="`dirname ${i}`"
      defpush="`(cd ${d} && hg paths default-push 2> /dev/null)`"
      if [ "${defpush}" = "" ] ; then
        defpath="`(cd ${d} && hg paths default 2> /dev/null)`"
        if [ "${defpath}" != "" ] ; then
          defpush="`echo ${defpath} | sed -e 's@http://\([^/]*/[^/]*/[^/]*\)/\(.*\)@ssh://$username\@\1/\2@'`"
          cp ${i}/hgrc ${i}/hgrc.orig
          echo "default-push = ${defpush}" >> ${i}/hgrc
          echo "Added default-push: ${defpush}"
        fi
      fi
    done
    for i in ${hgdirs}; do
      d="`dirname ${i}`"
      echo "(cd ${d} && hg paths)"
      (cd ${d} && hg paths)
    done
    exit 0

### Performing the push

[Committers](https://openjdk.java.net/bylaws#committer) can use the `hg push` command to propagate changesets into the repositories.

Most developers will only find a need to create changesets in one or two repositories. However, it's important that before any changesets are pushed, the corresponding forest pull and merge with the destination forest be performed; otherwise there is a risk of breaking the build.

    $ hg push

After the push has been accepted, an automatic e-mail notification will be sent to the [mailing list](https://mail.openjdk.java.net) associated with the repository. In most cases notifications are sent to the Project's _-dev_ mailing list. Some Projects with high traffic _-dev_ mailing lists use a dedicated _-changes_ list for notifications.

> ---
>
> Who has push access?
>
> All of a Project's [Committers](https://openjdk.java.net/bylaws#committer) can push to all of the the Project's repositories.
>
> Some Projects may chose to restrict the set of Committers with push to key repositories. For instance, JDK Release Projects restrict push access to MASTER repositories to Committers who are either integrators or members of the Release Engineering Team.
>
> See [Becoming a Committer] for information about becoming a Project Committer.
>
> ---

::: {.box}
[To the top](#){.boxheader}
:::
