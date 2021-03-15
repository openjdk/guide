# Introduction

Welcome to the OpenJDK Developers' Guide!

The OpenJDK Community is the place to collaborate on open-source implementations of the Java Platform, Standard Edition, and related projects.  It was created in November 2006, when initial portions of the JDK source code were published under the GPLv2 license.

In order to work together efficiently, clear directions are sometimes needed to avoid misconceptions and to align developers' views of terminology and process. The OpenJDK Community is a fairly pragmatic place. "Do the right thing" is most often the right course of action. Still, if people do things in the same right way then everyone's work becomes more transparent and easier for others to follow. For this reason most parts of the development process have standard flows that are the recommended ways to do things.

The goal of this guide is to answer questions that developers of the JDK might have around development process, tooling, standards, and so forth. The formal rules and processes are described in other documents, such as [JEP 1](https://openjdk.java.net/jeps/1) for the JDK Enhancement-Proposal & Roadmap Process, and [JEP 3](https://openjdk.java.net/jeps/3) for the JDK Release Process. This guide is meant to be a complement to such documents, with tutorials and examples for how to follow these rules and how to work together with the rest of the OpenJDK Community.

There are many common use cases that aren't detailed in the formal process. This guide suggests how to work in such cases.

## I have a patch, what do I do?

::: {.box}
[Quick Links]{.boxheader}

* [Oracle Contributor Agreement (OCA)](https://www.oracle.com/technical-resources/oracle-contributor-agreement.html)
* [JDK Bug System (JBS)](https://bugs.openjdk.java.net/)
* [OpenJDK Project Roles](https://openjdk.java.net/bylaws#project-roles)
:::

In many GitHub projects the standard way to propose a change is to create a pull request (PR) and discuss the patch in the PR. For OpenJDK projects the situation is somewhat different. The JDK is used for mission critical applications and by millions of developers, the bar to contributing changes is high. Please follow the steps outlined below to make sure your change passes above the bar before creating a PR.

### 1. Sign the OCA

Oracle is the steward of the OpenJDK project. In order to make your patch available for review you must first sign the [Oracle Contributor Agreement](https://www.oracle.com/technical-resources/oracle-contributor-agreement.html) (OCA). This agreement gives Oracle and you as a contributor joint copyright interests in the code. You will retain your copyright while also granting those rights to Oracle.

When you sign the OCA, please make sure that you specify your GitHub user name in the `Username` field of the OCA. If you try to create a PR before you have signed the OCA, or if you didn't specify your GitHub user name, you'll get instructions telling you to do so, and the PR won't be published until this is done. OCA registration is a manual process. Please allow for up to several days to have your OCA application processed, even though it's normally processed swiftly.

### 2. Socialize your change

Once the OCA is signed, please restrain your urge to create a PR just a little while longer. In order to prepare the community for your patch, please socialize your idea on the relevant [mailing lists](#mailing-lists). Almost all changes, and in particular any API changes, must go this route and have a broad agreement in place before there is any point in presenting code. To understand the criteria by which your patch is going to be judged, please read [_Why is My Change Rejected?_](#why-is-my-change-rejected) below. In short, hidden constraints and assumptions, stability and quality, maintainability, compatibility, and conformance to specifications must be considered before your PR is ready to be submitted. If you don't understand the constraints for acceptance, you might be surprised when your PR is rejected.

### 3. Find a sponsor

Socializing your change on the mailing lists also prevents the surprise that would otherwise make the community choke on their morning coffee when they see a huge patch in a new, unknown PR. As a new developer in the community you'll need to make a few friends that agree with your change. There are many good reasons to make friends, but the one relevant here is that for your first changes you'll need a sponsor to facilitate the integration of your work. The sponsor will perform any number of administrative tasks like JBS updates, additional testing, etc. It's usual for a sponsor to also be a reviewer of a change and thus familiar with it, but it's not a requirement.

### 4. Create a tracking issue in JBS

Many OpenJDK projects require a tracking issue to be filed in the [JDK Bug System (JBS)](https://bugs.openjdk.java.net/) before a change can be pushed. This is the case for instance for the JDK and the JDK-Updates projects. In order to get write access to JBS you need to be an [Author](https://openjdk.java.net/bylaws#author) in an OpenJDK project. For your first changes, ask your sponsor to help you create the issue.

If you continue to contribute high-quality content you'll soon enough be eligible for OpenJDK roles in the project. First Author, and later Committer. The Committer role means you won't need a sponsor anymore. You can read more about [OpenJDK Project Roles](https://openjdk.java.net/bylaws#project-roles).

### 5. Get acquainted with local process

Even though we strive to unify how things are done within the OpenJDK, different areas and projects in the OpenJDK may have slight variations in how they work. Some of these differences are highlighted throughout this guide, some aren't. If you're new to an area, make sure you understand local differences before you proceed. Ask your sponsor who should be your main point of contact through your first developer experience in the OpenJDK.

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
