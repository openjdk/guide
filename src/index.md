% OpenJDK Developers' Guide

# Introduction

Welcome to the OpenJDK Developers' Guide!

The OpenJDK Community is the place to collaborate on open-source implementations of the Java Platform, Standard Edition, and related projects. It was created in November 2006, when initial portions of the JDK source code were published under the GPLv2 license.

In order to work together efficiently, clear directions are sometimes needed to avoid misconceptions and to align developers' views of terminology and process. The OpenJDK Community is a fairly pragmatic place. "Do the right thing" is most often the right course of action. Still, if people do things in the same right way then everyone's work becomes more transparent and easier for others to follow. For this reason most parts of the development process have standard flows that are the recommended ways to do things.

The goal of this guide is to answer questions that developers of the JDK might have around development process, tooling, standards, and so forth. The formal rules and processes are described in other documents, such as [JEP 1](https://openjdk.java.net/jeps/1) for the JDK Enhancement-Proposal & Roadmap Process, and [JEP 3](https://openjdk.java.net/jeps/3) for the JDK Release Process. This guide is meant to be a complement to such documents, with tutorials and examples for how to follow these rules and how to work together with the rest of the OpenJDK Community.

There are many common use cases that aren't detailed in the formal process. This guide suggests how to work in such cases.

## OpenJDK

::: {.box}
[Quick Links]{.boxheader}

* [OpenJDK Groups](https://openjdk.java.net/groups/)
* [OpenJDK Projects](https://openjdk.java.net/projects/)
* [OpenJDK General Roles (Participant, Contributor, Member)](https://openjdk.java.net/bylaws#general-roles)
* [OpenJDK Project Roles (Author, Committer, Reviewer)](https://openjdk.java.net/bylaws#project-roles)
:::

OpenJDK consists of a number of [Groups](https://openjdk.java.net/groups/). Members of a group collaborate on an area of mutual interest. The right hand side bar on the [OpenJDK website](https://openjdk.java.net/) has a list of all groups in OpenJDK. If you're interested in a specific area, this is where you would start your OpenJDK experience. Look at the group's information and wiki pages, and see what projects they sponsor on the [Census page](https://openjdk.java.net/census).

[Projects](https://openjdk.java.net/projects/) are where the coding and much of the other work is done in OpenJDK. There are many different projects, some produce shippable artifacts, like the [JDK Project](https://openjdk.java.net/projects/jdk/), some produce tools to be used by developers of these artifacts, like the [Code Tools Project](https://openjdk.java.net/projects/code-tools/) or [Project Skara](https://openjdk.java.net/projects/skara/), and some produce documentation, like the [Developers' Guide Project](https://openjdk.java.net/projects/guide/). Many projects designs and develops new features for the Java language or the JVM, but there are also less code centric projects like the [Duke Project](https://openjdk.java.net/projects/duke/) which collects images of the Java mascot, Duke.

## Author, Committer, Reviewer

OpenJDK has a few different roles that determine who has the right to do what in the different projects. These roles are defined in the [OpenJDK Bylaws](https://openjdk.java.net/bylaws#project-roles). The roles are earned based on experience and knowledge within each project.

A Contributor can have different roles in different projects. When you're new to a project you don't yet have a formal role in that specific project, even though you might have earned roles in other OpenJDK projects or have been recognized as a [Contributor](https://openjdk.java.net/bylaws#contributor) or a [Member](https://openjdk.java.net/bylaws#openjdk-member) of OpenJDK. By contributing high-quality content you'll soon be eligible for [OpenJDK roles](https://openjdk.java.net/bylaws#project-roles) in the project. First [Author](https://openjdk.java.net/bylaws#author), then [Committer](https://openjdk.java.net/bylaws#committer), and finally [Reviewer](https://openjdk.java.net/bylaws#reviewer) if you stay active and earn the trust of the community. Trust is an important part of earning these roles. There's a [rough guideline](https://openjdk.java.net/projects/) saying that to become a [Committer](https://openjdk.java.net/bylaws#committer) you should have contributed 8 significant changes, and to become a [Reviewer](https://openjdk.java.net/bylaws#reviewer) you should have contributed 32 significant changes. In reality it's not as easy as "just" contributing code. You need to build a track record of good decisions and sound judgment and show that you know what differentiates a good change from a not so good one. It's not only correctness of the code that matters, it's also the appropriateness. In the end the trust you've earned is put to the test through a vote.

### Becoming an Author

Becoming an [Author](https://openjdk.java.net/bylaws#author) is the first step. To achieve this you need to contribute two changes to the project in which you wish to become an Author. Once your changes are pushed into the code base and has been vetted enough to determine that the changes were indeed good changes you can go ahead and send an email to the project lead of that particular project and ask to be added as an Author.

As an Author you have the formal right to produce changesets for inclusion into the projects code base, but you will need a sponsor to perform the actual push. You'll also have write access to [JBS](#jbs---jdk-bug-system) and the [OpenJDK wiki](https://wiki.openjdk.java.net) related to the project in question.

### Becoming a Committer

To become a [Committer](https://openjdk.java.net/bylaws#committer) you should show that you can produce non-trivial changes that are accepted for inclusion into the project code base. The number eight has been seen as a formal lower limit on the number of changes, but since the changes must be non-trivial, or "significant" as the [OpenJDK Project description](https://openjdk.java.net/projects/) says, and the definition of significant is subjective, the general recommendation is to wait with a Committer nomination until there's at least 10-12 changes pushed to have some margin for different interpretations of "significant". It's always a good idea to seek the advice of a sponsor who can guide you through the process to becoming a Committer - you will need one later to run the Committer vote anyway. They probably will have a better idea of what constitutes a "significant" change.

Once you have the required changes, a Committer in the project can start a vote by sending an email proposing that you should become a Committer. The email should follow the template found in the [OpenJDK Project description](https://openjdk.java.net/projects/).

A Committer is allowed to push changes without the aid of a sponsor. A Committer is also allowed to nominate other non-Committers to become Committers in the project.

### Becoming a Reviewer

To become a [Reviewer](https://openjdk.java.net/bylaws#reviewer) you must show a track record of sound and correct judgment calls as mentioned above. Being a good Committer doesn't necessarily make you a good Reviewer. As a Reviewer you have the power to approve changes for inclusion into the project source code. This means that a Reviewer needs to be able to judge the quality and appropriateness of any proposed change, not just the mechanics of the code.

The assumption is that after having produced 32 significant changes one should have become familiar with the process around reviews and the requirements around getting a change approved. This should really be seen as a minimum requirement though. A more practical consideration would be to look at whether the non-trivial commits of a potential Reviewer are accepted largely intact or whether they are always being refined by the review process. There may be cases where it will take significantly more than 32 changes for a Committer to be ready to become a Reviewer.

Once you are deemed ready, a Reviewer in the project can start a vote by sending an email proposing that you should become a Reviewer. The email should follow the template found in the [OpenJDK Project description](https://openjdk.java.net/projects/).

### Non-trivial/Significant changes

One key definition when advancing through the OpenJDK roles is the significant change. What exactly does it take for a change to be significant?

Instead of describing the significant change (because that's quite difficult to define) provided here is a few examples of changes that wouldn't be considered significant or for other reasons wouldn't count as significant contributions.

* Purely aesthetic changes like renaming or fixing indentation
* Repeated follow-up bugfixes from earlier changes
* Larger changes where only a non-significant portion of the work was done by the Contributor under vote
* Trivial backports of someone else's changes

# Contributing to an OpenJDK Project

Contributing to OpenJDK can take many forms. Writing code and providing patches is just one of them. A big part of developing a feature or a bugfix is testing and code review. Anything you can do to help out in these areas will be recognized as a contribution. Join the [mailing lists](#mailing-lists) to engage in design discussions and reviews, and download the latest EA builds or project repositories to try out new features and give feedback. If you see some misbehavior, or if you see somebody mention some misbehavior on some internet forum, try to track it down. Good bug reports with reproducible test cases are extremely valuable and make excellent contributions.

Anything you can do to spread the word about Java, new features, and your experiences using the JDK will be helpful for the community and to the OpenJDK developers. Trying out a new feature and reporting your experiences is also a contribution. Whether you find that the new feature improves your application, or if you find some area that needs to be improved, your feedback is valuable to the developers of that feature.

If you have a success story where Java solved your problem, or if you successfully upgraded to a more recent version of the JDK and noticed some improvements, spreading this story through a blog, news article, or some other channel is also a contribution.

If you're in a position to choose what programming language to use in a project, in a tutorial, or in a class, you have the power to enlarge the Java community in a very direct way, and your colleagues or students will get an opportunity to learn one of the most used programming languages in the world.

## I have a patch, what do I do?

::: {.box}
[Quick Links]{.boxheader}

* [Oracle Contributor Agreement (OCA)](https://www.oracle.com/technical-resources/oracle-contributor-agreement.html)
* [JDK Bug System (JBS)](https://bugs.openjdk.java.net/)
* [OpenJDK Project Roles](https://openjdk.java.net/bylaws#project-roles)
:::

In many GitHub projects the standard way to propose a change is to create a pull request (PR) and discuss the patch in the PR. For OpenJDK projects the situation is somewhat different. The JDK is used for mission critical applications and by millions of developers, the bar to contributing changes is high. Please follow the steps outlined below to make sure your change passes above the bar before creating a PR.

### 1. Sign the OCA

Oracle is the steward of OpenJDK. In order to make your patch available for review you must first sign the [Oracle Contributor Agreement](https://oca.opensource.oracle.com/) (OCA). This agreement gives Oracle and you as a contributor joint copyright interests in the code. You will retain your copyright while also granting those rights to Oracle.

When you sign the OCA, please make sure that you specify your GitHub user name in the `Username` field of the OCA. If you try to create a PR before you have signed the OCA, or if you didn't specify your GitHub user name, you'll get instructions telling you to do so, and the PR won't be published until this is done. OCA registration is a manual process. Please allow for up to several days to have your OCA application processed, even though it's normally processed swiftly.

### 2. Socialize your change

Once the OCA is signed, please restrain your urge to create a PR just a little while longer. In order to prepare the community for your patch, please socialize your idea on the relevant [mailing lists](#mailing-lists). Almost all changes, and in particular any API changes, must go this route and have a broad agreement in place before there is any point in presenting code. To understand the criteria by which your patch is going to be judged, please read [_Why is My Change Rejected?_](#why-is-my-change-rejected) below. In short, hidden constraints and assumptions, stability and quality, maintainability, compatibility, and conformance to specifications must be considered before your PR is ready to be submitted. If you don't understand the constraints for acceptance, you might be surprised when your PR is rejected.

### 3. Find a sponsor

Socializing your change on the mailing lists also prevents the surprise that would otherwise make the community choke on their morning coffee when they see a huge patch in a new, unknown PR. As a new developer in the community you'll need to make a few friends that agree with your change. There are many good reasons to make friends, but the one relevant here is that for your first changes you'll need a sponsor to facilitate the integration of your work. The sponsor will perform any number of administrative tasks like JBS updates, additional testing, etc. It's usual for a sponsor to also be a reviewer of a change and thus familiar with it, but it's not a requirement.

### 4. Create a tracking issue in JBS

Many OpenJDK projects require a tracking issue to be filed in the [JDK Bug System (JBS)](https://bugs.openjdk.java.net/) before a change can be pushed. This is the case for instance for the JDK and the JDK-Updates projects. In order to get write access to JBS you need to be an [Author](https://openjdk.java.net/bylaws#author) in an OpenJDK project (see [Becoming an Author](#becoming-an-author)). For your first changes, ask your sponsor to help you create the issue or file the bug through the [Bug Report Tool](https://bugreport.java.com/).

### 5. Get acquainted with local process

Even though we strive to unify how things are done within OpenJDK, different areas and projects in OpenJDK may have slight variations in how they work. Some of these differences are highlighted throughout this guide, some aren't. If you're new to an area, make sure you understand local differences before you proceed. Ask your sponsor who should be your main point of contact through your first developer experience in OpenJDK.

## Why is my change rejected?

::: {.box}
[Quick Links]{.boxheader}

* [Java Language and Virtual Machine Specifications](https://docs.oracle.com/javase/specs/)
* [Java API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html)
* [CSR Process](https://wiki.openjdk.java.net/display/csr/Main)
:::

Java and the JDK are very popular products, and just about every Java developer out there has an idea or two for how to enhance something. And (obviously not referring to you) believe it or not, not every idea is a good idea. Even though many ideas are indeed good, we must be quite restrictive on what we actually include into the JDK. There are many reasons for this.

* **Hidden constraints and assumptions**. Many sections of code have constraints and assumptions that aren't necessarily visible at first glance. This might preclude certain changes, even those that might seem obvious.

* **Stability and quality**. The JDK is used by millions of developers and as a widely deployed commercial product, it's held to a high standard of quality. Changes should include tests where practical, and core tests should pass at all times. The value of the change should outweigh the risk of introducing a bug or performance regression.

* **Maintainability**. Any new feature or code change will need to be maintained in the JDK essentially forever, thus imposing a maintenance burden on future maintainers. The code might still be in use long after you and the people who reviewed it have moved on. New maintainers must be able to understand how to fix bugs in this code.

* **Complexity**. Each new feature interacts with all the existing features, which can result in geometric growth of the interactions among features if features are added unchecked. Sometimes we avoid adding a new feature, even if it seems like an obvious thing to add, if that feature would make it difficult to add a more important feature in the future.

* **Adherence to specifications**. Much of the JDK is governed by a series of specifications, in particular the [Java Language Specification](https://docs.oracle.com/javase/specs/), the [Java Virtual Machine Specification](https://docs.oracle.com/javase/specs/), and the [Java API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html) ("javadocs"). All changes must be checked and tested carefully to ensure that they don't violate these specifications.

* **Javadoc comments are specifications**. The Java API Specification is authored in the form of javadoc comments, so even apparently innocuous changes to comments can be quite significant. It's not always easy to tell what comments are part of the specification and what parts are merely code comments. Briefly, documentation comments on public packages, classes, and class members of exported modules are specifications.

* **Specification changes**. It's possible to change the API specifications, and this is done regularly. However, these changes require even more scrutiny than code changes. This extra review is handled by the [CSR Process](https://wiki.openjdk.java.net/display/csr/Main). Specifications are written in stylized, somewhat formal language, and they don't simply describe what the code does. Writing specifications is a separate skill from coding.

* **Compatibility**. Changes should also adhere to high standards of binary, source, and behavioral compatibility. The compatibility impact of apparently innocuous changes is sometimes startling.

For reasons like these it’s quite possible that your change, even though it adds value to you, isn’t deemed to add enough value to the larger community.

# Mailing Lists

::: {.box}
[Quick Links]{.boxheader}

* [OpenJDK Mailing Lists Manager](https://mail.openjdk.java.net/mailman/listinfo)
:::

The mailing lists are the key communications mechanism for all OpenJDK work. All participation in an OpenJDK project starts with joining the relevant mailing list. A subscriber to an OpenJDK mailing list is referred to as a [Participant](https://openjdk.java.net/bylaws#participant) in the [Bylaws](https://openjdk.java.net/bylaws). As a general recommendation we suggest to subscribe to [announce](https://mail.openjdk.java.net/mailman/listinfo/announce), [discuss](https://mail.openjdk.java.net/mailman/listinfo/discuss), and the `-dev` lists covering your explicit area of interest. All OpenJDK mailing lists are found here:

> [`mail.openjdk.java.net`](https://mail.openjdk.java.net/mailman/listinfo)

The OpenJDK Community is a friendly place. To keep it that way it's important to keep a professional tone in emails and be aware that the community is global. Many different people with different backgrounds collaborate in these lists. Even though English is the required language for all lists, many Participants speak other languages as their native language. A high tolerance for non-perfect English is expected from anyone joining these lists. You're also strongly encouraged to use your real name on the mailing lists. This adds to the professional tone of your email. Postings from anonymized mailboxes risk being seen as spam. If you do work in OpenJDK on behalf of your employer, please also list this affiliation. If your GitHub username differs from your real name it's also a good idea to include that to identify yourself and your actions on GitHub.

You must be a member of a list to be able to post to that list. Some lists are moderated to keep the content on topic. Each list has its own archive where you can browse older conversations on the list.

There are a few different types of lists. The list name has two parts to explain what the list is intended for, `<name>-<suffix>`. The name often refers to the project that owns the list or a specific area of interest that the list focuses on. The suffix is explained below. Not all projects or areas have all types of lists described here.

> `-dev`
> :    Technical discussions around the implementation of the project artifacts. This is also where code reviews happen.

> `-use`
> :    Technical discussions around the usage of the project artifacts.

> `-discuss`
> :    General discussions around the project. The special case `discuss(at)openjdk.java.net` is used for general discussions around OpenJDK. Discussions around new project proposals usually happens here.

>  `-changes`
> :    Changeset notifications from the source code repositories maintained by the project.

> `-announce`
> :    General project announcements. These lists are tightly moderated and are expected to be low traffic. The special case `announce(at)openjdk.java.net` is used for announcements for OpenJDK.

> `-experts`
> :    Expert group discussions. The list is restricted; only members of the expert group can subscribe.

> `-observers`
> :    Open for anyone to subscribe to see what the experts are discussing and potentially to have some dialog with other non-experts. There is no guarantee that an expert is subscribed to the `-observers` list or will see any responses on that list.

> `-comments`
> :    Used by observers to directly provide feedback/comments to the experts (typically a lead will process the comments list and forward things on to the experts list).

## Changing your email address

If you need to change your registered email address, or if you have any other problems with the mailing lists, please contact [mailman@openjdk.java.net](mailto:mailman@openjdk.java.net).

# Repositories

This section describes the OpenJDK repository terminology and naming scheme. It also includes minimal instructions to acquire source from the OpenJDK repository, [`https://hg.openjdk.java.net/`](https://hg.openjdk.java.net/).

> ---
> Note that source may be available from other locations, for example `src.zip` from a full JDK distribution. However, OpenJDK contributions must use source from the [OpenJDK Mercurial repository](https://hg.openjdk.java.net/) since other source distributions may contain older code or code which differs due to licensing.

> ---

Operations which are performed repeatedly, such as creating changesets, merging, and pushing are described in [Producing a Changeset](#producing-a-changeset).

* [Terminology and Naming Scheme](#terminology-and-naming-scheme) defines the nomenclature used by OpenJDK.
* [Installing and Configuring Mercurial](#installing-and-configuring) enumerates the required software, provides links for download, and describes basic installation and configuration.
* [Cloning](#clone) covers the procedure for obtaining private copies of source repositories.

This document assumes familiarity with the first two chapters of the free on-line book [Mercurial: The Definitive Guide](http://hgbook.red-bean.com).

## Terminology and Naming Scheme

The OpenJDK code base for all [Projects](https://openjdk.java.net/bylaws#project) is stored in Mercurial repositories which contain the source files and their change history. Some Projects may choose to organize their code into multiple, possibly related, Mercurial repositories. For instance, [JDK 9](https://openjdk.java.net/projects/jdk9) uses a forest of multiple related repositories which contain components of the entire JDK. Projects which are based on the JDK, such as [IcedTea](https://openjdk.java.net/projects/icedtea) and [Jigsaw](https://openjdk.java.net/projects/jigsaw) also use this model. In contrast, [Code Tools](https://openjdk.java.net/projects/code-tools) uses an unrelated repository for each tool and [Graal](https://openjdk.java.net/projects/graal) uses only a single repository. Regardless of how a Project has chosen to store their code, each [Contributor](https://openjdk.java.net/bylaws#contributor) clones the repository associated with the code they are modifying.

> ---
> Consult the Project's documentation or [mailing list](https://mail.openjdk.java.net) to determine the appropriate repository, development conventions, and helpful tools.

> ---

This is the typical development model:

::: {style="text-align:center;"}
~~~{.mermaid caption="Diagram of server repos and user's clone" format=svg theme=neutral}
graph TD
    subgraph hg.openjdk.java.net
        origin(jdk9/dev)
    end
    origin --> |clone| local(9dev)
    local --> |push| origin
~~~
:::

A Contributor creates a _clone_ (a local copy called "9dev") of a read/write repository ("jdk9/dev") which resides on the OpenJDK Mercurial server. They work on their change in the clone and locally _commit_ a changeset. After the new changeset(s) are verified, they're either _pushed_ directly from the clone or _exported_ and delivered to a [Committer](https://openjdk.java.net/bylaws#committer) who can perform the push into the server repository for all to see.

> ---
> The use of _gate repositories_ was eliminated when the Mercurial servers were upgraded in March 2014.

> ---

The repositories use the following naming scheme:

> `<project>/<component_path>`

where

> ------------------  ----  ----------------------------------------------------
> _project_            ::   the short name of an OpenJDK [Project](https://openjdk.java.net/bylaws#project) such as "jdk9", "openjfx", or "sumatra"
> _component_path_     ::   the path to a repository containing the code base as designated by the [Project Lead](https://openjdk.java.net/bylaws#project-lead).
> ------------------  ----  ----------------------------------------------------

## Installing and Configuring Mercurial

Mercurial is a free, cross-platform, distributed source management tool. Source bundles and binary packages for Mercurial are available at [https://www.selenic.com/mercurial/wiki/index.cgi](https://www.selenic.com/mercurial/wiki/index.cgi/Mercurial). The OpenJDK repositories recommend installation of Mercurial 2.6.3 (or later). A Mercurial installation is sufficient to clone a repository. Contributors who wish to submit changes will need some additional configuration as described below.

Some Projects may recommend additional tools or scripts that help with repository manipulation and code development. For instance, in JDK 9, the utility script `common/bin/hgforest.sh` may be used to apply commands to all the repositories in the [forest](#forest). Popular extensions for OpenJDK developers include [jcheck](https://openjdk.java.net/projects/code-tools/jcheck/), [trees](https://openjdk.java.net/projects/code-tools/trees/), and [Mercurial Queues](http://hgbook.red-bean.com/read/managing-change-with-mercurial-queues.html) (mq). Note that `trees` is enabled on the OpenJDK Mercurial server.

Create and edit the `~/.hgrc` file to minimally contain the following entry:

    [ui]
    username = <openjdk_username>

_openjdk\_username_ is a plain lowercase, alphanumeric token (not an e-mail address) with twelve characters or less. The first character should be alphabetic. This username will be publicly visible in all Mercurial changeset logs. It will be used to verify that the changeset author is at least an [Author](https://openjdk.java.net/bylaws#author) for the Project and that the person pushing the changeset is at least a [Committer](https://openjdk.java.net/bylaws#committer). It's recommended that the _openjdk\_username_ be somehow related to the Author's full name, such as the first character of the Author's first name followed by the Author's last name. Refer to the [Becoming an Author](https://openjdk.java.net/projects/index.html#project-author) section of the [Project](https://openjdk.java.net/projects/index.html) page for additional information.

An alphabetical list of all of the assigned _openjdk\_usernames_ may be found on the [OpenJDK people](https://db.openjdk.java.net/people) list. The [Census](https://openjdk.java.net/census) shows the structure of the OpenJDK Community.

#### Verifying the Configuration

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

## Cloning

With Mercurial each developer works with a clone of the repository which is a snapshot of the files at the time the clone was taken. To update the clone, see [Producing a Changeset](#producing-a-changeset).

#### ... a Sandbox Repository {#cloneSandbox}

In addition to the Project repositories, there are some test repositories that may be used to run test commands against Mercurial without fear of causing damage to development source. Use them freely but with discretion; content in them may be deleted at any time.

    $ mkdir sandbox; cd sandbox
    $ hg clone http://hg.openjdk.java.net/sandbox/box
    destination directory: box
    requesting all changes
    adding changesets
    adding manifests
    adding file changes
    added 23 changesets with 24 changes to 5 files
    4 files updated, 0 files merged, 0 files removed, 0 files unresolved
    $ du -s box
    46      box

#### ... a Forest {#cloneForest}

If a Project uses a forest, It's strongly recommended for developers to clone an entire forest, rather than a single repository. This is the only means to ensure consistency in builds. The following examples illustrate two alternatives for cloning the entire _jdk9/dev_ forest into the directory `9dev`.

#. To clone the forest using the [trees](https://openjdk.java.net/projects/code-tools/trees/) extension just use `tclone`:

       $ hg tclone http://hg.openjdk.java.net/jdk9/dev 9dev

#. To clone the forest using `get_source.sh`, first clone the main tree:

       $ hg clone http://hg.openjdk.java.net/jdk9/dev 9dev
       requesting all changes
       adding changesets
       adding manifests
       adding file changes
       added 997 changesets with 1477 changes to 138 files
       updating to branch default
       82 files updated, 0 files merged, 0 files removed, 0 files unresolved

   Then clone the repositories in the forest:

       $ cd 9dev
       $ sh ./get_source.sh

Regardless of how the forest was cloned, this is the resulting populated forest.

    $ du -s
    934532  .
    $ ls
    ASSEMBLY_EXCEPTION  hotspot    LICENSE   README-builds.html
    common              jaxp       make      test
    configure           jaxws      Makefile  THIRD_PARTY_README
    corba               jdk        nashorn
    get_source.sh       langtools  README

#### ... a Single Repository {#cloneSingle}

If the source for the Project is contained within a single repository or reading a limited portion of the source is the only goal, it's possible to clone a single repository (even if it's part of a forest). For instance, this example shows how to clone the `langtools` repository from _jdk9/dev_ into the default destination directory.

    $ hg clone http://hg.openjdk.java.net/jdk9/dev/langtools
    destination directory: langtools
    requesting all changes
    adding changesets
    adding manifests
    adding file changes
    added 2289 changesets with 21194 changes to 7004 files
    updating to branch default
    6212 files updated, 0 files merged, 0 files removed, 0 files unresolved
    $ du -s langtools
    84396   langtools

# Code Conventions

::: {.box}
[Quick Links]{.boxheader}

* [Java Code Conventions](https://www.oracle.com/technetwork/java/codeconvtoc-136057.html)
* [HotSpot C++ Code Conventions](https://github.com/openjdk/jdk/blob/master/doc/hotspot-style.md)
:::

# JBS - JDK Bug System

::: {.box}
[Quick Links]{.boxheader}

* [Bug Report Tool](https://bugreport.java.com/)
* [JDK Bug System (JBS)](https://bugs.openjdk.java.net/)
:::

[JBS](https://bugs.openjdk.java.net/) is a public issue tracker used by many OpenJDK projects. It's open for anyone to read and search. In order to get write access you need to be registered in the [OpenJDK Census](https://openjdk.java.net/census), for instance by becoming an [Author](https://openjdk.java.net/bylaws#author) in an OpenJDK [Project](https://openjdk.java.net/bylaws#project).

## Filing a Bug

When a new failure is found in the JDK a bug should be filed to describe and track the issue. Depending on your role in OpenJDK you can either use the [Bug Report Tool](https://bugreport.java.com/) or, if you are registered in the [OpenJDK Census](https://openjdk.java.net/census), report the bug directly in [JBS](https://bugs.openjdk.java.net/). Try to make the bug report as complete as possible to make it easier to triage and investigate the bug.

A few things to keep in mind when filing a new bug:

* Before filing a bug, verify that there isn't already a bug filed for this issue.
  * Search [JBS](https://bugs.openjdk.java.net/) for things like the name of the failing test, assert messages, the name of the source code file where a crash occurred etc.
* If you suspect that the bug is a vulnerability, don't file a JBS issue. Instead send your bug report to [vuln-report@openjdk.java.net](mailto:vuln-report@openjdk.java.net).
  * Please do *not* report or discuss potential vulnerabilities on any open lists or other public channels.
  * See [OpenJDK Vulnerabilities](https://openjdk.java.net/groups/vulnerability/report) for more information.
* Make a reasonable attempt to narrow down which build or release the failure first appeared in.
* Add relevant labels like [`intermittent`](#intermittent), [`regression`](#regression), [`noreg-self`](#noreg-self), [`tier1`](#tier) etc.
  * To find relevant labels see the [JBS Label Dictionary](#jbs-label-dictionary)
* Set affects version to the JDK version(s) where the failure was seen.
  * If the failure is found in an update train of the JDK (e.g. 11.0.x), please make an effort to see if the bug is also present in [mainline](https://hg.openjdk.java.net/jdk/jdk/).
* Set priority
  * It's not the reporter's responsibility to set a correct priority, but a qualified guess is always better than a default value.
  * To help with setting the right priority consider things like how the bug impacts the product and our testing, how likely is it that the bug triggers, how difficult is it to work around the bug if it's not fixed soon, and whether it's a regression, since that may break existing applications. Regressions are often higher priority than long standing bugs and may block a release if not fixed.
* In the description, always include (if possible):
  * full name of the failing tests
  * error messages
  * assert messages
  * stack trace
  * command line information
  * relevant information from the logs
* If the failure isn't reproducible with an existing OpenJDK test, attach a reproducer if possible.
* Only set CPU and/or OS fields if the bug **ONLY** happens on that particular platform.
* Always file separate bugs for different issues.
  * If two crashes looks related but not similar enough to for sure be the same, it's easier to close a bug as a duplicate than it is to extract the relevant info from a bug to create a new one later.

To find out which component to use for different bugs, consult the [directory to area mapping](#directory-to-area-mapping).

## How to fix an incorrect backport creation

If a main bug is targeted to a release and the fix is pushed to a different release, then a backport bug is automatically created. Usually this is a "good thing", e.g., when you are backporting a fix to an earlier release, but not always... If the main bug is targeted to a later release (due to schedule planning), but someone finds the time to fix that bug in the current release, then the bug should be retargeted to the current release before pushing the fix. However, sometimes we forget to do that.

Here's how to fix that:

> ---
> In this example a fix was pushed to JDK N (a.k.a. the current release) while the JBS bug was targeted to JDK N+1 (a.k.a. a future release).

> ---

#. Reopen the _backport_ bug that was created automatically
   * Use a comment like the following (in the reopen dialog):
~~~
Fix was pushed while main bug was targeted to 'N+1'. Reset the main bug to fixed in 'N', reset this bug to fix in 'N+1' and closed as 'Not An Issue' since JDK N+1 will automatically get this fix from JDK N.
~~~
   * Change the 'Fix Version/s' from 'N' to 'N+1'.
   * Close the _backport_ bug as "Not an Issue".
#. Clean up the _main_ bug
   * Copy the push notification comment from the _backport_ bug to the _main_ bug, e.g.:
~~~
Changeset: 12345678
Author: Duke <duke@openjdk.org>
Date: 2020-10-23 15:37:46 +0000
URL: https://git.openjdk.java.net/jdk/commit/12345678
~~~
   * Add a comment like the following to the _main_ bug:
~~~
Fix was pushed while main bug was targeted to 'N+1'. Reset the main bug to fixed in 'N' and copied the Robo Duke entry here.
~~~
   * Reset the _main_ bug 'Fix Version/s' from 'N+1' to 'N'.
   * Resolve the _main_ bug as "Fixed" in build "team" or in build "master" depending on where the fix was pushed - or to an actual build number if the change has already made it to a promoted build (look in the _backport_ bug if you are unsure). Pushes to 'openjdk/jdk' are fixed in build "master" and pushes to project repositories are fixed in build "team".

## Resolved - Incomplete

To resolve an issue as `Incomplete` is JBS lingo for "Need More Information". An issue that is `Resolved - Incomplete` is *not* closed but more information is needed to be able to work on it. If no more information is obtained within reasonable time the issue should be closed (`Closed - Incomplete`). Closing a resolved issue is done using the `Verify` option.

## JBS Label Dictionary

This table contains some frequently used JBS labels and their meaning. Please help keeping this dictionary up to date by adding your favorite labels. This table doesn’t dictate how to use labels, but rather document how they are used. That said, obviously it will help everyone if we try to follow a common standard and use similar labels in the same way across all entities that use JBS.

Labels are an open namespace, which means that anyone can create new labels at any time. In order to avoid confusion, however, it's best to reuse existing labels where possible. This can be done by editing the "labels" field of a bug and entering the first few characters of the label you want to add. JIRA will pop up an autocomplete window with existing labels that match that prefix. Then choose one of the existing labels. Using the autocomplete window is preferable to typing the whole label name (even if you're a good typist) because it's easy for minor spelling errors to creep in, which can inadvertently introduce multiple labels with spurious spelling variations.

> ---
> ### Labels are case sensitive
> When using labels in Jira gadgets (like pie charts, heat maps, and statistics tables) Jira will be case sensitive and treat e.g. OpenJDK and openjdk as two different labels. Searching however is case insensitive. This means that if you group a set of issues in a gadget based on a label, and then click one of the groups to see the list of issues, that list will contain more results than the gadget if there are usages of the label with different casing. This can be very confusing and for this reason the recommendation is to stick with the commonly used case for all labels, regardless of your personal taste for upper or lower case letters. Most labels are lower case only, but there are examples where upper case letters are used in the most common version of a label. Use of the autocomplete popup window (described above) when adding labels will avoid inadvertent introduction of labels with differing case.

> ---

<table class="dictionary" summary="JBS Label Dictionary">
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
      Used to indicate that a bug would be suitable for backport to a release *(Rel)*. This isn't a decision to backport, just a suggestion / recommendation. E.g., **`11-bp`**
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-critical-request`**]{#rel-critical-request}<br />
      [*(Rel)***`-critical-approved`**]{#rel-critical-approved}<br />
      [*(Rel)***`-critical-watch`**]{#rel-critical-watch}
    </td>
    <td class="dictionary">
      Used in the rampdown phases of specific releases to request approval of changes that requires project lead approval (or similar) to be included. *(Rel)* is the release in question. E.g., **`jdk11-critical-request`**

      *(Rel)***`-critical-approved`** is used to signal that the change has been approved for inclusion. E.g., **`jdk11-critical-approved`**<br />
      *(Rel)***`-critical-watch`** is used for issues that must get into a specific release but risk running late. The label is used while the issue is still in progress and is replaced with *(Rel)***`-critical-request`** once the issue is resolved. E.g., **`jdk11-critical-watch`**

      These labels are always placed on the main JBS issue (the bug), never on backports or subtasks.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [*(Rel)***`-defer-request`**]{#rel-defer-request}<br />
      [*(Rel)***`-defer-yes`**]{#rel-defer-yes}<br />
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
      [*(Rel)***`-enhancement-request`**]{#rel-enhancement-request}<br />
      [*(Rel)***`-enhancement-yes`**]{#rel-enhancement-yes}<br />
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
      [*(Rel)***`-fix-request`**]{#rel-fix-request}<br />
      [*(Rel)***`-fix-SQE-ok`**]{#rel-fix-SQE-ok}<br />
      [*(Rel)***`-fix-yes`**]{#rel-fix-yes}<br />
      [*(Rel)***`-fix-no`**]{#rel-fix-no}
    </td>
    <td class="dictionary">
      Used in rampdown phase 2 to indicate that an issue would be of interest to get integrated into release *(Rel)*. E.g., **`jdk12u-fix-request`**

      *(Rel)***`-fix-SQE-ok`** is used to indicate that the issue will be covered by the test plan for *(Rel)*. E.g., **`jdk12u-fix-SQE-ok`**<br />
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
      Used to indicate that the issue doesn't affect release *(Rel)* or later. Could for instance be a bug in code that was removed in *(Rel)*.
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
      [**`c2`**]{#c2}<br />
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
      [**`intermittent`**]{#intermittent}<br />
      [**`intermittent-environment`**]{#intermittent-environment}<br />
      [**`intermittent-hardware`**]{#intermittent-hardware}
    </td>
    <td class="dictionary">
      An intermittent issue is one that fails sometimes but not always. The exact reason for the intermittent failure is per definition unknown. Once the reason has been identified the issue is no more considered intermittent. An issue isn't intermittent if some characteristics has been found that triggers the failure consistently, even if the actual cause for the failure hasn't been found. For instance if a test fails every time it's executed on a specific host but not on other hosts it wouldn't be considered intermittent as it fails consistently on that specific host. In other cases it may be that we know that a test sometimes is unlucky in some respect and fails due to this. This test could still be considered intermittent even though we know what the reason is if the reason itself appears intermittently.

      Some issues may seem intermittent when looking at test results, even though the reason for failing is actually known. One example is where a test fails consistently on a specific host, or due to specific conditions in the environment. These failures shouldn't be considered intermittent but it may still be valuable to tag these in JBS with one of the labels **`intermittent-hardware`** or **`intermittent-environment`**. This will help to faster identify that the cause of the failure is known without having to read through the entire bug.

      A test that should be platform agnostic but is consistently failing on a specific OS would for instance be labeled with **`intermittent-environment`**, while a test that fails every time it's run on some specific hardware would be labeled with **`intermittent-hardware`**.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`maintainer-pain`**]{#maintainer-pain}
    </td>
    <td class="dictionary">
Used to tag bugs that for some reason is wasting time or in other ways are causing pain for the OpenJDK maintainers. Examples of issues that could be considered a pain:

* A bug that occurs frequently in testing, maybe on a specific platform, maybe specific to one vendor's test infrastructure, and requires that many maintainers investigate the failure in different test runs just to realize it's the same issue as has been seen and reported before, or worse, don't realize it's a known issue and file a duplicate bug in JBS.

* Bugs that cause tests to fail without a proper explanation causing several maintainers to investigate the failures just to realize there is no information to be found.

* An underlying bug that causes several tests to fail intermittently.

* A bug that causes a test failure in a faraway place and the failure isn’t acted on quickly.

There are other cases as well and there is some flexibility in the definition. If you see a problem that is causing pain for a large number of maintainers, add an explanation in the JBS issue to why you think the issue is a pain and add the label.

If you have a **`maintainer-pain`** bug assigned to you please consider fixing it asap. If you chose not to work on the issue, you should at least be aware that you are choosing to waste others' time and people will be affected by this choice.

As with any issue the best way to deal with a **`maintainer-pain`** issue is to fix it. Another way to reduce the noise is to [exclude the failing test](#excluding-a-test). This is a viable option if there is a limited set of tests that are failing and the bug is actively investigated. When excluding a **`maintainer-pain`** issue, remember to move the **`maintainer-pain`** label to the JBS issue used to exclude. Leaving the label on the closed exclude-issue is helpful for tracking purposes.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`noreg-`**`.*`]{#noreg}<br />
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
:    It's too hard to write a regression or unit test for this bug (e.g., theoretical race condition, complex setup, reboot required, editing of installed files required, specific graphics card required); the bug should explain why.

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
      A regression is a bug that didn't exist in the previous release. Ideally all regressions must be fixed in order to release the next major version.
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
:   An issue that wasn't possible to fix by the time the release was GA'd.

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

<!-- Comment needed due to bug in Pandoc. -->
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [**`release-note=yes`**]{#release-note-yes}<br />
      [**`release-note=no`**]{#release-note-no}<br />
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
      [**`tck-red-`***(Rel)*]{#tck-red-rel}<br />
      [~~**`tck-red`**~~]{#tck-red}
    </td>
    <td class="dictionary">
      Used to identify TCK conformance stoppers (e.g. failure of a valid TCK test that exists in a shipped TCK). The release number indicates which release of the TCK that failed. E.g., **`tck-red-11`**

      There are **`tck-red`** labels without the release number out there as well. This usage is deprecated.
    </td>
  </tr>
  <tr>
    <td class="dictionary">
      [~~**`test`**~~]{#test}<br />
      [~~**`test-only`**~~]{#test-only}<br />
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

# Building the JDK

::: {.box}
[Quick Links]{.boxheader}

* [Official build instructions](https://openjdk.java.net/groups/build/doc/building.html)
* [openjdk/jdk GitHub project](https://github.com/openjdk/jdk)
* [JDK 16 General-Availability Release](https://jdk.java.net/16/)
:::

The JDK build system is a fairly complex machine that has the ability to build anything from a single module to a complete shippable JDK bundle with various levels of debug capabilities, run tests, install your newly built JDK on your system, or cross-compile for some other system. The build uses `make` and a few other tools that you will have to install on your system before starting.

The JDK supports incremental builds. This means that if you have a complete build and make changes in just a single part of the JDK (e.g. a module or part of the JVM), only that particular part needs to be rebuilt. So subsequent builds will be faster and you can always use a make target that results in a complete JDK image without having to worry about actually building the entire JDK every time. Please note that the incremental build do have limits in its understanding of what you change. For instance, if you change behaviors or conventions in one module there may be other parts of the JDK that implicitly depends on these without make's knowledge. For this reason you may have to rebuild several modules, or do a clean build if you change things that may have a wider impact.

The log below shows the steps taken to download and build the JDK source code from the mainline JDK development GIT repository. The configure script will tell you what additional packages you need. In this particular case several packages were needed since this build was performed on a clean Ubuntu installation. The configure script was run several times to get all the dependencies, but only the commands actually needed to get the JDK built are included in the log.

This example was written in the JDK 17 development time frame which is why the boot JDK used here is JDK 16. To build JDK N, use JDK N-1 as the boot JDK. Note that the download link used here points to a Linux x64 JDK 16.

This is just an example log, don't copy the `apt-get install` line. Instead run `sh ./configure` once you have the boot JDK installed to see what packages you actually need on your system.

    $ git clone https://github.com/openjdk/jdk.git
    $ wget https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_linux-x64_bin.tar.gz
    $ tar xzf openjdk-16_linux-x64_bin.tar.gz
    $ sudo apt-get install autoconf zip make gcc g++ libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev
    $ cd jdk
    $ sh ./configure --with-boot-jdk=$HOME/jdk-16/
    $ make images

In this case the built JDK can be found in `build/linux-x86_64-server-release/jdk`. The exact path depends on your build platform and selected configuration.

## Configuration options

The JDK build is extremely configurable. This list only contains the most basic configure options needed to get you started. Use `configure --help` to see a complete list of options.

| Option | What it does   |
|:-------|:-------|
| `--with-boot-jdk` | Tell configure what boot JDK to use to build the Java libraries. |
| `--with-debug-level` | Set the debug level. Available levels are `release`, `fastdebug`, `slowdebug`, `optimized`. |

### Working with multiple configurations

Through the configure flags you will select what configuration of the JDK to build. The name of the output directory for the build depends on this configuration. In the example above the JDK ended up in `linux-x86_64-server-release`. This means that we made a release build of a 64 bit linux x86 version of the server JDK. If we change some of these options the output directory will be affected accordingly.

`--with-debug-level` is one example of a configure option that will change the output directory name. Sometimes it makes sense to have several different configurations in parallel. For example while debugging some code you might want to have both a debug build and a release build to be able to test it properly. The directory naming scheme makes this very easy. Simply configure and build the JDKs you need and they will end up next to each other in the build directory.

In the example above we built a `relase` image. To build a debug image as well we can configure with `--with-debug-level=slowdebug`. This will give us a JDK where for instance asserts in the JDK source code are enabled. To select which JDK to work with in later calls to `make` add `CONF=<configuration>`.

    $ sh ./configure --with-boot-jdk=$HOME/jdk-16/ --with-debug-level=slowdebug
    $ make CONF=slowdebug images
    $ ls build/
    linux-x86_64-server-release
    linux-x86_64-server-slowdebug

## Make targets

`make images`, as used in the example above, will build a JDK image which is very close to what you'd get from any JDK provider. There are several other make targets you can use depending on what you're looking for. The table below contains some commonly used make targets.

| Target | What it does      |
|:-------|:----------|
| `exploded-image` | This is the default make target that you'll get if you simply invoke `make`. |
| `image` | Builds a complete JDK image. A good target to use if you want to build a JDK for general usage or if you want to test something closer to the shipping product. This can also be a good target to use if doing something which might have a build aspect to it. |
| `<name>-image` | Build just the image for any of jdk, test, docs, symbols, etc. |
| `reconfigure` | Re-runs the configure script with the same arguments as given the last time. |
| `demos` | Builds the demos which for instance make it easy to test something UI related. |
| `docs` | Builds the javadoc. Note that a number of classes in the javadoc API are generated during the build, so `make docs` might do more than simply invoke `javadoc`, depending on the state of your build. |
| `java.base` | Builds the base module. You can (re)build any module with `make <module>`. |
| `hotspot` | Builds the JVM. Note that the JVM depends on several other parts of the JDK, so `make hotspot` might build more than just the JVM, depending on the state of your build. |
| `clean` | Removes all files generated by make, but not those generated by configure. Useful when doing significant renaming or refactoring which may confuse the incremental build. To clean out a specific module only use `make clean-<module>`. |
| `dist-clean` | Removes all files, including configuration. |

There are many other targets available as well. Use `make help` to find out more.

# Testing the JDK

::: {.box}
[Quick Links]{.boxheader}

* [Using the run-test Framework](https://openjdk.java.net/groups/build/doc/testing.html)
* [JTReg Harness Documentation](https://openjdk.java.net/jtreg/)
* [Google Test Documentation](https://github.com/google/googletest/blob/master/googletest/docs/primer.md)
:::

In addition to your own Java applications, OpenJDK have support for two test frameworks, JTReg and GTest. JTReg is a Java regression test framework that is used for most of the tests that are included in the OpenJDK source repository. The Google Test (GTest) framework is intended for unit testing of the C++ native code. Currently only JVM testing is supported by the GTest framework. Other areas use JTReg for unit testing of C++ code.

This section provides a brief summary of how to get started with testing in OpenJDK. For more information on configuration and how to use the OpenJDK test framework, a.k.a. "run-test framework", see [`doc/testing.md`](https://github.com/openjdk/jdk/blob/master/doc/testing.md).

In general all changes should come with a regression test so if you're writing product code you should also be writing test code. There are a few examples where it doesn't make sence to write an explicit regression test. These should be tagged in JBS with one of the [noreg-labels](#noreg).

A few key items to think about when writing a regression test:

* A regression test should execute fast - a few seconds at most
* The test should only test the desired functionality - if you have several features to test, write more tests
* The test should pass reliably on all supported platforms - watch out for platform-specific differences such as path separators
* Binary files shouldn't be checked in, if your test needs to use one, the test should create it in some fashion
* Avoid shell scripts and relying on external commands as much as possible

The JTReg documentation has a section on [how to write good JTReg tests](https://openjdk.java.net/jtreg/writetests.html).

## JTReg

In-depth documentation about the JTReg framework is found here: [JTReg harness](https://openjdk.java.net/jtreg/). JTReg itself is available in the [Code Tools Project](https://openjdk.java.net/projects/code-tools/).

Below is a small example of a JTReg test. It’s a clean Java class with a main method that is called from the test harness. If the test fails we throw a RuntimeException. This is picked up by the harness and is reported as a test failure. Try to always write a meaningful message in the exception. One that actually helps with understanding what went wrong once the test fails.

    /*
     * @test
     * @summary Make sure feature X handles Y correctly
     * @run main TestXY
     */
    public class TestXY {
        public static void main(String[] args) throws Exception {
            var result = X.y();
            if (result != expected_result) {
                throw new RuntimeException("X.y() gave " + result + ", expected " + expected_result);
            }
        }
    }

This example only utilizes three JTReg specific tags, `@test`, `@summary`, and `@run`. `@test` simply tells JTReg that this class is a test, and `@summary` provides a description of the test. `@run` tells JTReg how to execute the test. In this case we simply tell JTReg to execute the main method of the class `TestXY`. `@run` isn't strictly necessary for JTReg to execute the test, an implicit `@run` tag will be added if none exists. However, for clarity and in order to avoid bugs it's recommended to always explicitly use the `@run` tag.

There are several other tags that can be used in JTReg tests. You can for instance associate the test with a specific bug that this test is a regression test for.

    @bug 7000001

Or you can specify a number of requirements that must be fulfilled for JTReg to execute the test.

    @requires docker.support
    @requires os.family != ”windows”
    @requires os.maxMemory > 3G
    @requires os.arch=="x86_64" | os.arch=="amd64"

You can also specify if the test requires specific modules, and you can specify command line flags and run the test in several different ways.

    @modules java.base/jdk.internal.misc
    @run main/othervm -Xmx128m TestXY

Note that you can have several `@run` tags in the same test with different command line options.

JTReg also have support for labeling tests with keys using the `@key` tag. These keywords can then be used to filter the test selection. For instance if you have a UI test which needs to display a window you'll want to make sure the test harness doesn't try to run this test on a system which doesn't support headful tests. You do this by specifying

    @key headful

Another example is `@key randomness` that should be used to indicate that a test is using randomness - i.e. is intentionally non-deterministic.

There are many other keywords in use and their usage may differ between areas in the JDK. Make sure you understand the conventions for the particular area you are testing since these are just examples.

The [JTReg documentation](https://openjdk.java.net/jtreg/) provides information on many more tags like these.

The [compiler group](https://openjdk.java.net/groups/compiler/) has a section in their wiki with [Guidelines for "langtools" tests](https://openjdk.java.net/groups/compiler/tests.html).

### Running OpenJDK JTReg Tests

When configuring the OpenJDK build you can tell it where your JTReg installation is located. When providing this information you can later run `make run-test` to execute JTReg tests.

    sh ./configure --with-jtreg=/path/to/jtreg
    make run-test TEST=tier1

In the OpenJDK source tree you can find a directory called `test`. There are a large number of tests in this directory that are written to be used with JTReg.

    make run-test TEST=test/jdk/java/lang/String/

You can also run JTReg without invoking make. In this case you’ll need to tell JTReg which JDK to test.

    jtreg -jdk:/path/to/jdk /path/to/test

## GTest

As mentioned the Google test framework is mainly used for C++ unit tests. There are several of these in the `test/hotspot` directory. Currently, only the C++ code in the JVM area is supported by the OpenJDK GTest framework. The tests can be run without starting the JVM, which enables testing of JVM data structures that would be fragile to play with in a running JVM.

    static int demo_comparator(int a, int b) {
      if (a == b) {
        return 0;
      }
      if (a < b) {
        return -1;
      }
      return 1;
    }

    TEST(Demo, quicksort) {
      int test_array[] = {7,1,5,3,6,9,8,2,4,0};
      int expected_array[] = {0,1,2,3,4,5,6,7,8,9};

      QuickSort::sort(test_array, 10, demo_comparator, false);
      for (int i = 0; i < 10; i++) {
        ASSERT_EQ(expected_array[i], test_array[i]);
      }
    }

`ASSERT_EQ` is one example of an assertion that can be used in the test. Below are a few other examples. A full list is found in the [Google Test Documentation](https://github.com/google/googletest/blob/master/googletest/docs/primer.md).

    ASSERT_TRUE(condition);
    ASSERT_FALSE(condition);
    EXPECT_EQ(expected, actual);
    EXPECT_LT(val1, val2);
    EXPECT_STREQ(expected_str, actual_str);

`ASSERT` is a fatal assertion and will interrupt execution of the current sub-routine. `EXPECT` is a nonfatal assertion and will report the error but continues to run the test. All assertions have both an `ASSERT` and an `EXPECT` variant.

For more information on how to write good GTests in HotSpot, see [`doc/hotspot-unit-tests.md`](https://github.com/openjdk/jdk/blob/master/doc/hotspot-unit-tests.md).

### Running OpenJDK GTests

When configuring the OpenJDK build you can tell it where your GTest installation is located. Once configured, use make to run GTests.

    sh ./configure --with-gtest=/path/to/gtest
    make test TEST=gtest

You can also use a regular expression to filter which tests to run:

    make test TEST=gtest:code.*:os.*
    make test TEST=gtest:$X/$variant

The second example above runs tests which match the regexp `$X.*` on a specific variant of the JVM. The variant is one of client, server, etc.

## Excluding a Test

Sometimes tests break. It could be e.g. due to bugs in the test itself, due to changed functionality in the code that the test is testing, or changes in the environment where the test is executed. While working on a fix, it can be useful to stop the test from being executed in everyone else's testing to reduce noise, especially if the test is expected to fail for more than a day. There are two ways to stop a test from being run in standard test runs: ProblemListing and using the `@ignore` keyword. Removing tests isn't the standard way to remove a failure. A failing test is often a regression and should ideally be handled with high urgency.

I'll say it right away so that it's not forgotten at the end: Remember to remove the JBS id from the ProblemList or the test when the bug is closed. This is especially easy to forget if a bug is closed as a duplicate or 'Will Not Fix'. jcheck will report an error and prohibit a push if a PR is created for an issue that is found in a ProblemList if the fix doesn't remove the bug ID from the ProblemList.

### ProblemListing jtreg tests

ProblemListing should be used for a short term exclusion while a test is being fixed, and for the exclusion of intermittently failing tests that cause too much noise, but can still be useful to run on an ad-hoc basis. ProblemListing is done in the file `ProblemList.txt`. There are actually several ProblemList files to choose from. Their location and name hint about what area or feature each file belongs to. Each file has sections for different components. All ProblemList files complement each other to build the total set of tests to exclude in JTReg runs.

~~~
test/hotspot/jtreg/ProblemList.txt
test/hotspot/jtreg/ProblemList-aot.txt
test/hotspot/jtreg/ProblemList-graal.txt
test/hotspot/jtreg/ProblemList-non-cds-mode.txt
test/hotspot/jtreg/ProblemList-Xcomp.txt
test/hotspot/jtreg/ProblemList-zgc.txt
test/jaxp/ProblemList.txt
test/jdk/ProblemList.txt
test/jdk/ProblemList-aot.txt
test/jdk/ProblemList-graal.txt
test/jdk/ProblemList-Xcomp.txt
test/langtools/ProblemList.txt
test/langtools/ProblemList-graal.txt
test/lib-test/ProblemList.txt
~~~

Use the suitable ProblemList and add a line like this in the proper section:

~~~
foo/bar/MyTest.java                        4711   windows-all
~~~

In this example, `MyTest.java` is ProblemListed on windows, tracked by bug `JDK-4711`.

Currently there's [no support for multiple lines for the same test](https://bugs.openjdk.java.net/browse/CODETOOLS-7902481). For this reason it's important to always make sure there's no existing entry for the test before adding a new one, as multiple entries might lead to unexpected results, e.g.

~~~
foo/bar/MyTest.java                        4710   generic-all
...
foo/bar/MyTest.java                        4711   windows-all
~~~

This would lead to `sun.tools.jcmd.MyTest.java` being ProblemListed only on `windows-all`. The proper way to write this is:

~~~
foo/bar/MyTest.java                        4710,4711   generic-all,windows-all
~~~

Although `windows-all` isn't strictly required in this example, it's preferable to specify platforms for each bugid (unless they are all `generic-all`), this makes it easier to remove one of the bugs from the list.

#### ProblemListing some, but not all, test cases in a file

Some tests contain several test cases and there may be a need to ProblemList only a few of them. To do this use the full test name, i.e. `<filename> + # + <test case id>`, where test case id can be specified in the test header. If no id is specified each test case can be referenced with `id` + ordinary number of the test case in the test file.

Let's assume we have four test cases in `foo/bar/MyTest.java`:

~~~
/* @test */
/* @test id=fancy_name */
/* @test */
/* @test */
~~~

A ProblemList entry that excludes the first, second, and third test case would look like this:

~~~
foo/bar/MyTest.java#id0          4720  generic-all
foo/bar/MyTest.java#fancy_name   4721  generic-all
foo/bar/MyTest.java#id2          4722  generic-all
~~~

Due to an issue described in [CODETOOLS-7902712](https://bugs.openjdk.java.net/browse/CODETOOLS-7902712) tests that contains more than one `@test` must actually use this way to specify all test cases if all of them should be ProblemListed. Specifying just the test name will not work.

#### Running ProblemListed tests

To run ad-hoc runs of ProblemListed tests use `RUN_PROBLEM_LISTS=true`.

~~~
make test TEST=... JTREG=RUN_PROBLEM_LISTS=true
~~~

### Exclude jtreg tests using `@ignore`

The `@ignore` keyword is used in the test source code. This is mainly used for tests that are so broken that they may be harmful or useless, and is less common than ProblemListing. Examples can be tests that don't compile because something changed in the platform; or a test which might remove your `/etc/shadow`. Use `@ignore` with a bug reference in the test case to prevent the test from being run.

~~~java
/**
 *  @test
 *  @ignore 4711
 *
~~~

In this example, `MyTest.java` is excluded, tracked by bug `JDK-4711`. `@ignore` should always be placed directly before the first `@run` line in the test.

### Dealing with JBS bugs for test exclusion

ProblemListing and `@ignore`-ing are done in the JDK source tree, that means a check-in into the repository is needed. This in turn means that a unique JBS issue and a code review are needed. This is a good thing since it makes test problems visible.

* **Code review**: ProblemListing a test is considered a [trivial](#trivial) change.
* **JBS issue**: A JBS issue is obviously created for the bug that caused the failure, we call this the _main issue_. To exclude the test, create a subtask to the main issue. Also add the label [`problemlist`](#problemlist) to the main issue.

The fix for the main issue should remove the test from the ProblemList or remove the `@ignore` keyword from the test.

#### Triage excluded issues

After a failure is handled by excluding a test, the main JBS issue should be re-triaged and possibly given a new priority. This should be handled by the standard triage process. A test exclusion results in an outage in our testing. This outage should be taken into consideration when triaging, in addition to the impact of the bug itself.

# Producing a Changeset

This section is confined to the actual Mercurial mechanics required to produce a changeset:

* [Setting a JDK User Name](#setting-a-jdk-user-name) reminds the user to confirm proper configuration.
* [Creating](#creating) includes instructions for the required format of a changeset comment and describes how to commit files to a changeset.
* [Merging](#merging) describes how to pull changes from a parent forest or clone and incorporate the changes into the current working set of files.
* [Pushing](#pushing) covers configuring ssh, setting the `default-push` path, and pushing changesets.

## Setting a JDK User Name

Ensure that _ui.username_ has a value in the `~/.hgrc` file as described in [Verifying the Configuration](#verifying-the-configuration).

## Creating

The timing for creating a changeset is important. Creating the changeset long before it gets pushed into the parent repository may require complex merges. If a changeset is created before sufficient review or testing, a rollback may be required and a new changeset may be required to correct previous mistakes. The [mq extension](http://hgbook.red-bean.com/hgbookch12.html#x16-26500012) is recommended for managing changes before they become committed to a changeset.

In the examples below, the script `common/bin/hgforest.sh` can be used to apply the Mercurial command to all the repositories in the forest. So when you see _**`hg`**_, if you are dealing with one repository, just use "`hg`", if it's a forest, use "`sh common/bin/hgforest.sh`".


Each repository in the forest is managed independently. After editing files in the individual cloned repositories of the forest, the `hg status` command may be used to see the changes in a single repository.

    $ hg root
    /u/iris/sandbox/box
    $ hg status
    ? duke/images/DukeTubbingSmall.png
    $ hg add duke/images/DukeTubbingSmall.png
    $ hg status
    A duke/images/DukeTubbingSmall.png

To see changes made to the repositories use _**`hg`**_ `status`:

    $ hg status
    [.]
    A duke/images/DukeTubbingSmall.png

In this example, the repository was previously cloned as described in [Cloning a Sandbox Repository](#clone). A new file `DukeTubbingSmall.png` was added to a new subdirectory.

#### Formatting a Changeset Comment

A single change is described by a block of text of the following form:

    <bugid>: <synopsis-of-symptom>
    Summary: <summary-of-code-change>
    Reviewed-by: <reviewer>+
    Contributed-by: <contributor-email>

There may be more than one _bugid_ line, but there must be at least one.

The _summary_ line is optional, but authors are strongly encouraged to include one if the nature of the change isn't obvious from the synopsis. It's just one line, meant to give the reader a clue as to how the code changed. A more complete description of the change belongs in the bug report.

A _reviewed-by_ line is required. Reviewers must have the ability to deal with any adverse consequences of the change, and so must themselves be authors. They are therefore identified by their OpenJDK usernames rather than full e-mail addresses.

The _contributed-by_ line is optional. If present, it's a list of comma-separated email addresses. It should be included only when the author or authors of the change don't have commit rights to the target repository and thus would not otherwise receive acknowledgment.

There will be exceptions for merge changesets, tag changesets, etc.

Example:

    1234567: NPE thrown on FileInputStream("")
    Summary: Rewrite precondition-checking code in io.c
    Reviewed-by: mr
    Contributed-by: Ben Bitdiddle <ben at bits.org>

If a changeset contains multiple unrelated changes (this is frowned upon, but may happen from time to time) then its comment will contain multiple blocks of the above form, separated by blank lines.

The required format of the comments will be enforced whenever the changeset is pushed into the JDK master or team repository forests. Other Projects may copy these conventions, adopt some other conventions, or have no conventions, depending upon their goals.

#### Committing a Changeset

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

## Merging

It's often necessary to merge local changes with those made in the parent repositories. The first step in a merge process is to retrieve (or pull) the collection of changesets which have been pushed since the last merge or initial clone. If there if there are merge conflicts, then they must be resolved. [Chapter 3](http://hgbook.red-bean.com/hgbookch3.html#x7-530003) of the Mercurial book contains detailed information on the merging process.

There are two basic ways to update the working set files in the repositories:

Option 1: _**`hg`**_ `pull`

> One way to merge the parent repository with the working set of files is to use _**`hg`**_ `pull` all by itself. This option allows merging off-line or at a later time.
>
>     $ hg pull
>     [.]
>     pulling from http://hg.openjdk.java.net/sandbox/box
>     searching for changes
>     no changes found
>
> In Mercurial, pulling changesets will not update or merge into the working set of files. To update the clone, run _**`hg`**_ `update`. If the update reports conflicts, run _**`hg`**_ `merge` to resolve them.

Option 2: _**`hg`**_ `fetch`

> Alternatively, use _**`hg`**_ `fetch` to pull the changes, update the working set files, and create simple merge changesets as necessary. The fetch extension is distributed with Mercurial but needs to be enabled. Edit the `.hgrc` to include the following entries:
>
>     [extensions]
>     fetch=
>
> Once the fetch extension has been enabled, _**`hg`**_ `fetch` may be invoked as follows:
>
>     $ hg fetch
>     [.]
>     pulling from http://hg.openjdk.java.net/sandbox/box
>     searching for changes
>     no changes found

> ---
> Actual file merging will be done with the selected Mercurial merging tool see [MergeProgram](https://www.selenic.com/mercurial/wiki/index.cgi/MergeProgram) for the details on how to define the selected merge tool in ` ~/.hgrc`.

> ---

## Pushing

In order to push changesets into the parent repository, some additional configuration is required. The following sections describe the operations that will be performed by users with push access.

#### Generating an SSH Key

All pushes require an ssh key which must be installed on the Mercurial server. The `ssh-keygen` command generates an ssh key. The `-b` option overrides the default number of bits for the key. Allow a few minutes to generate a 4096 bit key; a key of at least 2048 bits is recommended. While it's possible to use ssh without a passphrase, this is **strongly** discouraged. Empty or insecure passphrases may be reset using `ssh-keygen -p`; this doesn't change the keys.

    $ ssh-keygen -t rsa -b 4096
    Enter file in which to save the key(/u/iris/.ssh/id_rsa):
    Generating public/private rsa key pair.
    Enter passphrase(empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /u/iris/.ssh/id_rsa.
    Your public key has been saved in /u/iris/.ssh/id_rsa.pub.
    The key fingerprint is:
    md5 4096 c2:b7:00:e6:4b:da:ea:ec:32:30:f5:bd:12:26:04:83 iris@duke
    The key's randomart image is:
    +--[ RSA 4096]----+
    |    E.=          |
    |     . *         |
    |      o .   .    |
    |         + o     |
    |        S + .    |
    |       .   + .   |
    |        + + +..  |
    |       * . oo+.  |
    |      o . .o..   |
    +-----------------+

The `~/.ssh/id_rsa.pub` is a text file containing the public ssh key. This file should be mailed as an attachment along with the JDK username to [keys(at)openjdk.java.net](mailto:keys-at-openjdk.java.net). An administrator will install your key on the server and notify you on completion. This process may take a couple of days.

> ---
> Users behind a SOCKS firewall can add a directive to the `~/.ssh/config` file to connect to the OpenJDK Mercurial server:
>
>     Host *.openjdk.java.net
>     ProxyCommand /usr/lib/ssh/ssh-socks5-proxy-connect -h [socks_proxy_address] %h %p
>
> See the `ssh-socks5-proxy-connect` man page and `ssh-config` man page for more information. Other systems may require proxy access via other programs. Some Linux distributions provide the `corkscrew` package which provides ssh access through HTTP proxies.
>
> **It's recommended that all users check with their network administrators before installing any kind of TCP forwarding tool on their network. Many corporations and institutions have strict security policies in this area.**

> ---

#### SSH Shortcuts

The following section provides some tips for improving the usability of ssh-related operations.

* _Using SSH in multiple shells_

  To avoid having to constantly type in the passphrase, use the ssh-agent on your local client to cache your pashphrase:

      $ eval `ssh-agent`
      Agent pid 17450
      $ ssh-add
      Enter passphrase for /u/iris/.ssh/id_rsa:
      Identity added: /u/iris/.ssh/id_rsa(/u/iris/.ssh/id_rsa)

  The same ssh-agent process can be shared with multiple shells. There are various ways to do this. Bash users can accomplish this with the following code in `.bashrc`:

      if [ "$PS1" -a -d $HOME/.ssh ]; then
        if [ "x$SSH_AUTH_SOCK" = x ]; then
          eval `ssh-agent | grep -v 'echo Agent pid'`
          ssh-add
          trap "echo Killing SSH agent $SSH_AGENT_PID; kill $SSH_AGENT_PID" 0
        fi
      fi

  For secure operation, only start an ssh-agent when needed and kill it off when the shell completes. Test this by running `ssh 'hostname' echo hello` multiple times.

* _Logging in without a password_

  To avoid needing to constantly type in the password, add the public key to the list of ssh authorized keys.

      $ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
      $ chmod 600 ~/.ssh/authorized_keys

#### Setting the `default-push` Path to the Server Repositories

<!--
#. Option 1: Add default-push path to every <code>.hg/hgrc</code>
-->

This is the typical development model:

::: {style="text-align:center;"}
~~~{.mermaid caption="Diagram of server repos and user's clone" format=svg theme=neutral}
graph TD
    subgraph hg.openjdk.java.net
        origin(jdk9/dev)
    end
    origin --> |clone| local(9dev)
    local --> |push| origin
~~~
:::

Changesets need to be _pushed_ via ssh to the read/write repository which resides on the OpenJDK Mercurial server. The easiest way to do this is to have each repository define the "default-push" path in every repository's `.hg/hgrc` file. The `.hg/hgrc` file in isn't a managed file - it's private to the repository. The following example defines the "default" and "default-push" paths for clones of the jdk9/dev team repository.

    [paths]
    default = http://hg.openjdk.java.net/jdk9/dev
    default-push = ssh://<JDK_username>@hg.openjdk.java.net/jdk9/dev

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

<!--
#. Option 2: Use the <code>defpath</code> ExtensionAnother way to setup the default-push path is to use the Mercurial defpath extension, which is available in /java/jdk/lib/hgext/defpath.py. To enable this extension add the following to the <code>~/hgrc</code> file:
<blockquote><pre>
[extensions]
defpath = /java/jdk/lib/hgext/defpath.py  # Or the pathname of a local copy
</pre></blockquote>
     The defpath extension actually adds two new Mercurial subcommands:
    defpath to operate upon a single repository and fdefpath for an entire
    forest. hg help defpath or hg help fdefpath will tell you more. For a
    freshly cloned open/closed forest the command you probably want is
<blockquote><pre>
$ hg fdefpath -dgv
</pre></blockquote>
     Be sure to try this with the -n flag first to see if it will do what
    you actually expect. If your OpenJDK username differs from your Oracle
    username then add -u name to the command line.
     The defpath extension defines the default-push path, which is the path
    that Mercurial uses by default in push operations.
-->

#### Pushing a Changeset

[Committers](https://openjdk.java.net/bylaws#committer) can use the _**hg**_ `push` command to propagate changesets into the repositories.

Most developers will only find a need to create changesets in one or two repositories. However, it's important that before any changesets are pushed, the corresponding forest pull and merge with the destination forest be performed; otherwise there is a risk of breaking the build.

    $ hg push

After the push has been accepted, an automatic e-mail notification will be sent to the [mailing list](https://mail.openjdk.java.net) associated with the repository. In most cases notifications are sent to the Project's _-dev_ mailing list. Some Projects with high traffic _-dev_ mailing lists use a dedicated _-changes_ list for notifications.

> ---
> Who has push access?
>
> All of a Project's [Committers](https://openjdk.java.net/bylaws#committer) can push to all of the the Project's repositories.
>
> Some Projects may chose to restrict the set of Committers with push to key repositories. For instance, JDK Release Projects restrict push access to MASTER repositories to Committers who are either integrators or members of the Release Engineering Team.
>
> Refer to the [Nominating a Contributor or Author to be a Committer](https://openjdk.java.net/projects/index.html#project-committer) section of the [Project](https://openjdk.java.net/projects/index.html) page for information about becoming a Project Committer.

> ---

## Backing Out a Change

If a change causes a regression that can't be fixed within reasonable time the best way to handle the regression can be to back out the change. Backing out means that the inverse (anti-delta) of the change is pushed to effectively undo the change in the repository. There are two parts to this task, how to do the bookkeeping in JBS, and how to do the actual backout in git or mercurial.

The backout is a regular change and will have to go through the standard code review process, but is considered a [trivial](#trivial) change. The rationale is that a backout is usually urgent in nature and the change itself is automatically generated. In areas where two reviewers are normally required, only one additional Reviewer is required for a backout since the person who is performing the backout also will review the change.

### How to work with JBS when a change is backed out

#. Close the original JBS issue **(O)**.
   * "Verify" the issue and choose "Fix Failed".
#. If the intention is to fix the change and submit it again, create a redo-issue **(R)** to track that the work still needs to be done.
   * Clone **(O)** and add the prefix `[REDO]` on the summary - the clone becomes the redo-issue **(R)**.
   * Make sure relevant information is brought to **(R)**.
   * Remember that comments aren't brought over when cloning.
#. Create a backout-issue **(B)**:
   * Alternative 1 - the regression is identified directly.
     * Create a sub-task to **(R)** with the same summary, prefix with `[BACKOUT]`.
   * Alternative 2 - an investigation issue is created **(I)**, and during the investigation backing out the change is identified as the best solution.
     * Use the investigation issue **(I)** for the backout.
     * Change summary of **(I)** to the same as **(O)** and prefix with `[BACKOUT]`.
     * Move and change type of **(I)** to become a sub-task of **(R)**.
   * Alternative 3 - no redo issue was created.
     * Create a backout-issue **(B)** with the same summary as **(O)**, prefix with `[BACKOUT]`.
     * Link **(B)** and **(O)**.

ProblemList entries and `@ignore` keywords will continue to point to the original bug (unless updated at back out). This is accepted since there is a clone link to follow.

### How to work with git when a change is backed out

To backout a change with git, use `git revert`. This will apply (commit) the anti-delta of the change.

~~~diff
$ git show aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5
commit aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5 (HEAD -> master)
Author: Jesper Wilhelmsson <jesper.wilhelmsson@oracle.com>
Date:   Wed Jun 23 20:31:32 2021 +0200

    My change

diff --git a/README.md b/README.md
index 399e7cc311f..4961acb2126 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,4 @@
-# Welcome to the JDK!
+# Welcome to my modified JDK!

 For build instructions please see the
 [online documentation](https://openjdk.java.net/groups/build/doc/building.html),

$ git revert aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5
[master d454489052d] Revert "My change"
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git show d454489052dc6ff69a21ad9c8f56b67fdeb435ee
commit d454489052dc6ff69a21ad9c8f56b67fdeb435ee (HEAD -> master)
Author: Jesper Wilhelmsson <jesper.wilhelmsson@oracle.com>
Date:   Wed Jun 23 20:32:08 2021 +0200

    Revert "My change"

    This reverts commit aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5.

diff --git a/README.md b/README.md
index 4961acb2126..399e7cc311f 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,4 @@
-# Welcome to my modified JDK!
+# Welcome to the JDK!

 For build instructions please see the
 [online documentation](https://openjdk.java.net/groups/build/doc/building.html),
~~~

### How to work with mercurial when a change is backed out

In order to backout a change, the `hg backout` command is recommended, which essentially applies the anti-delta of the change. Make sure you perform the backout in the most upstream repostiory the change has escaped to.

~~~
hg backout [OPTION]... [-r] REV

reverse effect of earlier changeset

    Prepare a new changeset with the effect of REV undone in the current
    working directory.

    If REV is the parent of the working directory, then this new changeset is
    committed automatically. Otherwise, hg needs to merge the changes and the
    merged result is left uncommitted.
~~~

# The JDK Release process

::: {.box}
[Quick Links]{.boxheader}

* [JEP 3: JDK Release Process](https://openjdk.java.net/jeps/3)
:::

The JDK project has a well defined release process. [JEP 3](https://openjdk.java.net/jeps/3) describes this process in detail. This section intends to clarify some topics that often cause questions.

## Release cycle

The release cycle starts when development of a new release begins, and ends when that release is delivered to the public. The current release cadence is six months. This means that every six months we start development of a new release, and every six months a new release is delivered. However, this doesn't mean that each release cycle is six months. As described below, the total development time for a release (the release cycle) is actually nine months. Obviously this in turn doesn't mean that all features are developed in nine months. Most features are developed for a much longer time than that, and goes through long time development in other project repositories, and through a series of preview and experimental stages. But any feature that is to be included in a specific release has a specific window of nine months to integrate the code into mainline and fix all the remaining bugs.

It may be tempting to integrate a new feature near the end of a release cycle, to get more time to fix all those last bugs before integration. Please don't. If you are getting close to the end of a release and you still just have one more bug to fix, please defer your feature to the next release. It's only six months out. Not only will this vouch for your new feature to be more stable on release, you will also help keeping the JDK as a whole more stable by allowing others to find and fix bugs in their new code that might come as a result of your changes.

Integrating early in a release is preferable, but all new features can't be integrated at the same time. If many large changes enters the repository at the same time it will be more difficult to determine which change that caused all the new bugs. If you're about to integrate a larger change you must therefore communicate this on the relevant [mailing lists](#mailing-lists) to synchronize with other projects that may also be planning to integrate something soon.

## Milestones and phases

Throughout the release there are a number of milestones and phases that define where in the release cycle we are.

[**The start of a release**]{#release-start}
:    Since development is always ongoing in the mainline repository ([openjdk/jdk](https://github.com/openjdk/jdk)), the start of a new release can be said to be when the former release is forked from the mainline. After the start of the release follows six months of development to implement and integrate all the cool stuff that will go into the next release. After these six months ramp down begins.

[**Ramp Down Phase 1 (RDP1)**]{#rdp1}
:    The ramp down of a release starts with a fork of the mainline repository. A clone of the entire code base is made and hosted in a separate ramp down repository (e.g. [openjdk/jdk17](https://github.com/openjdk/jdk17)). During the ramp down of a release we focus on bug fixing and stabilization in order to get the JDK ready for release. In RDP1 you may continue to fix P1-P3 product bugs (and some other issues) in the stabilization repo. For detailed information on what can be fixed when, see [JEP 3](https://openjdk.java.net/jeps/3). The start of RDP1 is essentially the deadline for integrating JEPs and enhancements into this particular release.

[**All Tests Run (ATR)**]{#atr}
:    ATR is not a milestone described in JEP 3, but it's still a concept that might be mentioned in discussions on this topic and is therefore good to know about. ATR (a.k.a. ATR Start) is the start of an approximately six week long test period where all tests in the test plan for the given release is ran. ATR usually starts at the same time as RDP1.

[**Ramp Down Phase 2 (RPD2)**]{#rdp2}
:    In RDP2 the bar is higher to get changes into the release. For product bugs, only P1:s and P2:s are supposed to be fixed here, and to do so an approval is needed. See the [Fix-Request Process](https://openjdk.java.net/jeps/3#Fix-Request-Process) for details on how to obtain one. All other product bugs should be deferred. Again, see [JEP 3](https://openjdk.java.net/jeps/3) for more details.

[**Release Candidate (RC)**]{#rc}
:    Towards the end of the release cycle, when there are no more open product bugs targeted to the release, a stable build is selected to be the release candidate. This build will go through additional testing and if no more issues are found it will be the build released. If new bugs are found these are investigated and hopefully fixed, and a new build becomes the release candidate. The RC phase has a few milestones with a deadline for finding a candidate build, and another for making sure the build is ready to go live.

[**General Availability (GA)**]{#ga}
:    This is the end of the release cycle. The last release candidate build is made available to the public.

### Deferring P1 and P2 bugs

Even though there's nothing explicitly written in the process about deferring P1 and P2 bugs during the initial development phase, the assumption is that these aren't deferred unless time runs out at the end of the release cycle.

Please note that the priority of a bug doesn't change just because you want to get your fix in late in the release, or if you want to be able to defer it. The priority is based on the severity of the bug and if it was deemed to be a P2 before, you better have a really good explanation to why that conveniently has changed by the end of the release. Being hard to fix is **not** a reason to lower the priority of a bug.

## Forward ports

During the rampdown of a release there are two repositories in play, the stabilization fork for the outgoing release, and the mainline repository where the next release is being developed. Any bugfix going into the stabilization fork is likely to be desired in mainline as well. As a developer you should push your fix to the stabilization fork **only**, even if you intend for it to go to both repositories. Your fix will be forward ported to mainline.

All fixes that are pushed to the stabilization fork are forward ported to mainline. If you have a fix that is only intended for the stabilization fork you will have to manually back it out from mainline once it has been forward ported. In order to remember to do this you should file a backout isue in JBS before pushing your change to the stabilization fork. E.g., To push JDK-xxx to the stabilization fork but not to the mainline, you need to file an issue, JDK-yyy, in JBS to back out the fix after it has been merged into the mainline. Make sure the two JBS issues (JDK-xxx and JDK-yyy) are related so that it's easy to find one from the other.

To clarify, as soon as you know that there is a fix that needs to go into the stabilization fork but not the mainline, you should do the following:

* File a bug, JDK-yyy, to cover the backout work
* Link JDK-yyy to JDK-xxx using a "relates to" link
* Set JDK-yyy's Fix Version to the next release
* Add a comment describing the situation
* Set the priority to be relatively high (e.g., P3)

Then, you have to wait until the JDK-xxx fix is forward ported to the mainline before actually fixing JDK-yyy. Making these settings in JDK-yyy will help ensure that it won't be missed.

There are also examples in JBS where JDK-yyy has been created as a sub-task of JDK-xxx. This works but is not recommended since JDK-yyy stands a higher risk of being missed when it's not of type *Bug* but rather a *sub-task* of an already closed issue. Also see [Backing out a change](#backing-out-a-change) for reference.

# Code Owners

This list is intended to make it easier to identify which email list to include in code reviews when making changes in different areas. The list may also help when assigning bugs based on which code they are found in. Please note that some directories may have been created or removed between releases. The intention here is to include directories that exists in mainline, LTS releases and other releases (post JDK 9) commonly being updated.

## Area mailing lists

* Build: [`build-dev@openjdk.java.net`](mailto:build-dev@openjdk.java.net)
* Client
  * AWT: [`awt-dev@openjdk.java.net`](mailto:awt-dev@openjdk.java.net)
  * Beans: [`beans-dev@openjdk.java.net`](mailto:beans-dev@openjdk.java.net)
  * Java 2D: [`2d-dev@openjdk.java.net`](mailto:2d-dev@openjdk.java.net)
  * Java FX: [`openjfx-dev@openjdk.java.net`](mailto:openjfx-dev@openjdk.java.net)
  * jpackage: [`core-libs-dev@openjdk.java.net`](mailto:core-libs-dev@openjdk.java.net)
  * Sound: [`sound-dev@openjdk.java.net`](mailto:sound-dev@openjdk.java.net)
  * Swing: [`swing-dev@openjdk.java.net`](mailto:swing-dev@openjdk.java.net)
* Core Libs: [`core-libs-dev@openjdk.java.net`](mailto:core-libs-dev@openjdk.java.net)
  * Net: [`net-dev@openjdk.java.net`](mailto:net-dev@openjdk.java.net)
  * NIO: [`nio-dev@openjdk.java.net`](mailto:nio-dev@openjdk.java.net)
* HotSpot: [`hotspot-dev@openjdk.java.net`](mailto:hotspot-dev@openjdk.java.net)
  * Compiler: [`hotspot-compiler-dev@openjdk.java.net`](mailto:hotspot-compiler-dev@openjdk.java.net)
  * GC: [`hotspot-gc-dev@openjdk.java.net`](mailto:hotspot-gc-dev@openjdk.java.net)
  * Runtime: [`hotspot-runtime-dev@openjdk.java.net`](mailto:hotspot-runtime-dev@openjdk.java.net)
  * JFR: [`hotspot-jfr-dev@openjdk.java.net`](mailto:hotspot-jfr-dev@openjdk.java.net)
  * Serviceability: [`serviceability-dev@openjdk.java.net`](mailto:serviceability-dev@openjdk.java.net)
* I18n: [`i18n-dev@openjdk.java.net`](mailto:i18n-dev@openjdk.java.net)
* LangTools
  * Amber Project: [`amber-dev@openjdk.java.net`](mailto:amber-dev@openjdk.java.net)
  * Javac: [`compiler-dev@openjdk.java.net`](mailto:compiler-dev@openjdk.java.net)
  * Javadoc: [`javadoc-dev@openjdk.java.net`](mailto:javadoc-dev@openjdk.java.net)
  * JShell: [`kulla-dev@openjdk.java.net`](mailto:kulla-dev@openjdk.java.net)
  * Panama Project: [`panama-dev@openjdk.java.net`](mailto:panama-dev@openjdk.java.net)
  * Valhalla Project: [`valhalla-dev@openjdk.java.net`](mailto:valhalla-dev@openjdk.java.net)
* Security: [`security-dev@openjdk.java.net`](mailto:security-dev@openjdk.java.net)

## Directory to area mapping

* `make` – Build team
* `hotspot` – HotSpot
  * `cpu` – Compiler, Runtime
  * `jdk.*` – Compiler
  * `os` – Runtime
  * `os_cpu` – Compiler
  * `share`
    * `adlc` – Compiler
    * `aot` – Compiler
    * `asm` – Runtime
    * `c1` – Compiler
    * `ci` – Compiler
    * `classfile` – Runtime
    * `code` – Compiler
    * `compiler` – Compiler
    * `gc` – GC
    * `include` – HotSpot
    * `interpreter` – Runtime
    * `jfr` – JFR
    * `jvmci` – Compiler
    * `libadt` – Compiler
    * `logging` – Runtime
    * `memory` – Runtime, GC
    * `metaprogramming` – Runtime
    * `oops` – Runtime
    * `opto` – Compiler
    * `precompiled` – Runtime
    * `prims` – Runtime, Serviceability
    * `runtime` – Runtime
    * `services` – Runtime
    * `shark` – Compiler
    * `trace` – Runtime
    * `utilities` – Runtime
* `java.base`
  * Core Libs should almost always be included but LangTools, HotSpot, Security and/or I18n may also be involved.
  * `classes`
    * `crypto` – Security
    * `internal` – HotSpot, Core Libs
    * `invoke` – Core Libs
    * `io` – NIO
    * `lang` – Core Libs
    * `launcher` – LangTools
    * `math` – Core Libs
    * `net` – Net
    * `nio` – NIO
    * `reflect` – Core Libs
    * `security` – Security
    * `text` – I18n
    * `time` – Core Libs
    * `util` – I18n, Core Libs
  * `conf`
    * `sdp` – Net
    * `security` – Security
  * `legal` –
  * `lib/security` – Security
  * `man`
    * `java.1` - LangTools
    * `jfr.1` - Runtime
    * `keytool.1` - Security
  * `native`
    * `common` –
    * `include` – Runtime, Core Libs
    * `jspawnhelper` – LangTools
    * `launcher` – LangTools
    * `libfdlibm` – Core Libs
    * `libjava` – Core Libs
    * `libjimage` – LangTools, Core Libs
    * `libjli` – LangTools
    * `libjsig` – HotSpot
    * `libnet` – Net
    * `libnio` – NIO
    * `libosxsecurity` – Security
    * `libverify` – LangTools
    * `libzip` – Core Libs
* `java.compiler` – LangTools
* `java.datatransfer` – AWT
* `java.desktop` – Client
  * Many files in the awt directories are shared between 2D and AWT
    * See [https://openjdk.java.net/groups/2d/2dawtfiles.html](https://openjdk.java.net/groups/2d/2dawtfiles.html)
    * And see [https://openjdk.java.net/groups/2d](https://openjdk.java.net/groups/2d)
  * `color`, `font`, `freetype`, `geom`, `imageio`, `java2d`, `jpeg`, `lcms`, `mlib`, `print`, graphics primitives – 2D
  * `splashscreen`, `dnd`, `eawt`, `lwawt` – AWT
  * `im`, input methods – I18n, AWT
  * `libjsound`, `sound` – Sound
  * `accessibility`, `laf` – Swing
* `java.instrument` – Serviceability
* `java.logging` – Core Libs
* `java.management` – Serviceability
* `java.management.rmi` – Serviceability
* `java.naming` – Core Libs
* `java.net.http` – Net
* `java.prefs` – Core Libs
* `java.rmi` – Core Libs
* `java.scripting` – LangTools
* `java.se` – Core Libs
* `java.security.jgss` – Security
* `java.security.sasl` – Security
* `java.smartcardio` – Security
* `java.sql` – Core Libs
* `java.sql.rowset` – Core Libs
* `java.transaction.xa` – Core Libs
* `java.xml` – Core Libs
* `java.xml.crypto` – Security
* `jdk.accessibility` – Swing
* `jdk.aot` – HotSpot Compiler
* `jdk.attach` – Serviceability
* `jdk.charsets` – I18n, Core Libs
* `jdk.compiler` – LangTools
* `jdk.crypto.cryptoki` – Security
* `jdk.crypto.ec` – Security
* `jdk.crypto.mscapi` – Security
* `jdk.crypto.ucrypto` – Security
* `jdk.dynalink` – LangTools
* `jdk.editpad` – LangTools
* `jdk.hotspot.agent` – Serviceability
* `jdk.httpserver` – Net
* `jdk.incubator.foreign` – LangTools
* `jdk.incubator.httpclient` – Net
* `jdk.incubator.jpackage` – Client
* `jdk.incubator.vector` – HotSpot Compiler
* `jdk.internal.ed` – LangTools
* `jdk.internal.jvmstat` – Serviceability
* `jdk.internal.le` – LangTools
* `jdk.internal.opt` – LangTools
* `jdk.internal.vm.ci` – HotSpot Compiler
* `jdk.internal.vm.compiler` – HotSpot Compiler
* `jdk.internal.vm.compiler.management` – HotSpot Compiler
* `jdk.jartool` – LangTools
* `jdk.javadoc` – LangTools
* `jdk.jcmd` – Serviceability
* `jdk.jconsole` – Serviceability
* `jdk.jdeps` – Core Libs
* `jdk.jdi` – Serviceability
* `jdk.jdwp.agent` – Serviceability
* `jdk.jfr` – JFR
* `jdk.jlink` – LangTools
* `jdk.jpackage` – Client
* `jdk.jshell` – LangTools
* `jdk.jsobject` – LangTools
* `jdk.jstatd` – Serviceability
* `jdk.localedata` – I18n
* `jdk.management` – Serviceability
* `jdk.management.agent` – Serviceability
* `jdk.management.jfr` – Runtime
* `jdk.naming.dns` – Core Libs
* `jdk.naming.rmi` – Core Libs
* `jdk.net` – Net
* `jdk.nio.mapmode` – NIO
* `jdk.pack` – LangTools
* `jdk.rmic` – Core Libs
* `jdk.scripting.nashorn` – LangTools
* `jdk.scripting.nashorn.shell` – LangTools
* `jdk.sctp` – Net
* `jdk.security.auth` – Security
* `jdk.security.jgss` – Security
* `jdk.unsupported` – Core Libs
* `jdk.unsupported.desktop` – Swing
* `jdk.xml.dom` – Core Libs
* `jdk.zipfs` – Core Libs
* `sample` –
* `utils` –

# About this Guide

This guide is being maintained through the [OpenJDK Developers' Guide Project](https://openjdk.java.net/census#guide). The [source repository](https://github.com/openjdk/guide) is available at GitHub. The revision hash at the bottom of each page refers to the latest change that modified that particular page.

Comments and questions may be sent to [guide-dev (at) openjdk.java.net](mailto:guide-dev-at-openjdk.java.net). Please let us know if there's anything in the guide that isn't clear.

# Glossary

[**provisional**]{#provisional} (int the CSR)
:   The stage of the CSR process after "DRAFT", and "PROPOSED". At this stage the primary goals are to ensure that the proposed changes are suitable for the release in a general sense.

[**approved**]{#approved} (by the CSR)
:   The stage of the CSR process after "FINALIZED". The CSR has approved the final version of the request which permits push into the project repository.

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
