# Contributing to an OpenJDK Project

Contributing to OpenJDK can take many forms. Writing code and providing patches is just one of them. A big part of developing a feature or a bugfix is testing and code review. Anything you can do to help out in these areas will be recognized as a contribution. Join the [mailing lists](#mailing-lists) to engage in design discussions and reviews, and download the latest EA builds or project repositories to try out new features and give feedback. If you see some misbehavior, or if you see somebody mention some misbehavior on some internet forum, try to track it down. Good bug reports with reproducible test cases are extremely valuable and make excellent contributions.

Anything you can do to spread the word about Java, new features, and your experiences using the JDK will be helpful for the community and to the OpenJDK developers. Trying out a new feature and reporting your experiences is also a contribution. Whether you find that the new feature improves your application, or if you find some area that needs to be improved, your feedback is valuable to the developers of that feature.

If you have a success story where Java solved your problem, or if you successfully upgraded to a more recent version of the JDK and noticed some improvements, spreading this story through a blog, news article, or some other channel is also a contribution.

If you're in a position to choose what programming language to use in a project, in a tutorial, or in a class, you have the power to enlarge the Java community in a very direct way, and your colleagues or students will get an opportunity to learn one of the most used programming languages in the world.

## I have a patch, what do I do?

::: {.box}
[Quick Links]{.boxheader}

* [Oracle Contributor Agreement (OCA)](https://www.oracle.com/technical-resources/oracle-contributor-agreement.html)
* [JDK Bug System (JBS)](https://bugs.openjdk.org/)
* [OpenJDK Project Roles](https://openjdk.org/bylaws#project-roles)
:::

In many GitHub projects the standard way to propose a change is to create a pull request (PR) and discuss the patch in the PR. For OpenJDK projects the situation is somewhat different. The JDK is used for mission critical applications and by millions of developers, the bar to contributing changes is high. Please follow the steps outlined below to make sure your change passes above the bar before creating a PR.

### 1. Sign the OCA

Like many other open-source communities, the OpenJDK Community requires Contributors to jointly assign their copyright on contributed code. Oracle is the steward of OpenJDK and if you haven't yet signed the [Oracle Contributor Agreement](https://oca.opensource.oracle.com/) (OCA) then please do so. This is required in order to make your patch available for review. The OCA gives Oracle and you as a Contributor joint copyright interests in the code. You will retain your copyright while also granting those rights to Oracle.

When you sign the OCA, please make sure that you specify your GitHub user name in the `Username` field of the OCA. If you try to create a PR before you have signed the OCA, or if you didn't specify your GitHub user name, you'll get instructions telling you to do so, and the PR won't be published until this is done. OCA registration is a manual process. Please allow for up to several days to have your OCA application processed, even though it's normally processed swiftly. An alphabetical list of all of the assigned OpenJDK usernames may be found on the [OpenJDK people](https://db.openjdk.org/people) list.

You only need to sign the OCA once in order to cover all changes that you might contribute to any Oracle-sponsored open-source community. If you've already signed the OCA or the former SCA (Sun Contributor Agreement) for any Oracle-sponsored open-source community, then you do not need to sign it again in order to contribute to OpenJDK. Please note that you don't need to sign an OCA if you work at Oracle or a company which has negotiated an equivalent agreement.

### 2. Socialize your change

Once the OCA is signed, please restrain your urge to create a PR just a little while longer. In order to prepare the community for your patch, please socialize your idea on the relevant [mailing lists](#mailing-lists).

It's actually a good idea to discuss what you're trying to do with other engineers working on the same code already before you invest significant time working on a change. They're likely to be able to offer comments and suggestions that will result in a higher-quality change and a smoother submission process. Announcing that you're working on a particular item can also help to avoid wasted effort in case someone else is already working on it.

Almost all changes, and in particular any API changes, must go this route and have a broad agreement in place before there is any point in presenting code. To understand the criteria by which your patch is going to be judged, please read [_Why is My Change Rejected?_](#why-is-my-change-rejected) below. In short, hidden constraints and assumptions, stability and quality, maintainability, compatibility, and conformance to specifications must be considered before your PR is ready to be submitted. If you don't understand the constraints for acceptance, you might be surprised when your PR is rejected.

### 3. Find a sponsor

Socializing your change on the mailing lists also prevents the surprise that would otherwise make the community choke on their morning coffee when they see a huge patch in a new, unknown PR. As a new developer in the community you'll need to make a few friends that agree with your change. There are many good reasons to make friends, but the one relevant here is that for your first changes you'll need a sponsor to facilitate the integration of your work. The sponsor will perform any number of administrative tasks like JBS updates, additional testing, etc. It's usual for a sponsor to also be a reviewer of a change and thus familiar with it, but it's not a requirement.

### 4. Create a tracking issue in JBS

Many OpenJDK projects require a tracking issue to be filed in the [JDK Bug System (JBS)](https://bugs.openjdk.org/) before a change can be pushed. This is the case for instance for the JDK and the JDK-Updates projects. In order to get write access to JBS you need to be an [Author](https://openjdk.org/bylaws#author) in an OpenJDK project (see [Becoming an Author](#becoming-an-author)). For your first changes, ask your sponsor to help you create the issue or file the bug through the [Bug Report Tool](https://bugreport.java.com/).

### 5. Get acquainted with local process

Even though we strive to unify how things are done within OpenJDK, different areas and projects in OpenJDK may have slight variations in how they work. Some of these differences are highlighted throughout this guide, some aren't. If you're new to an area, make sure you understand local differences before you proceed. Ask your sponsor who should be your main point of contact through your first developer experience in OpenJDK.

## Why is my change rejected?

::: {.box}
[Quick Links]{.boxheader}

* [Java Language and Virtual Machine Specifications](https://docs.oracle.com/javase/specs/)
* [Java API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html)
* [CSR Process](https://wiki.openjdk.org/display/csr/Main)
:::

Only the best patches submitted will actually make it all the way into the JDK code base. The goal is not to take in the maximum number of contributions possible, but rather to accept only the highest-quality contributions. The JDK is used daily by millions of people and thousands of businesses, often in mission-critical applications, and so we can't afford to accept anything less than the very best.

Just about every Java developer out there has an idea or two for how to enhance something. And (obviously not referring to you) believe it or not, not every idea is a good idea. Even though many ideas are indeed good, we must be quite restrictive on what we actually include into the JDK. There are many reasons for this.

* **Hidden constraints and assumptions**. Many sections of code have constraints and assumptions that aren't necessarily visible at first glance. This might preclude certain changes, even those that might seem obvious.

* **Stability and quality**. The JDK is used by millions of developers and as a widely deployed commercial product, it's held to a high standard of quality. Changes should include tests where practical, and core tests should pass at all times. The value of the change should outweigh the risk of introducing a bug or performance regression.

* **Maintainability**. Any new feature or code change will need to be maintained in the JDK essentially forever, thus imposing a maintenance burden on future maintainers. The code might still be in use long after you and the people who reviewed it have moved on. New maintainers must be able to understand how to fix bugs in this code.

* **Complexity**. Each new feature interacts with all the existing features, which can result in geometric growth of the interactions among features if features are added unchecked. Sometimes we avoid adding a new feature, even if it seems like an obvious thing to add, if that feature would make it difficult to add a more important feature in the future.

* **Adherence to specifications**. Much of the JDK is governed by a series of specifications, in particular the [Java Language Specification](https://docs.oracle.com/javase/specs/), the [Java Virtual Machine Specification](https://docs.oracle.com/javase/specs/), and the [Java API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html) ("javadocs"). All changes must be checked and tested carefully to ensure that they don't violate these specifications.

* **Javadoc comments are specifications**. The Java API Specification is authored in the form of javadoc comments, so even apparently innocuous changes to comments can be quite significant. It's not always easy to tell what comments are part of the specification and what parts are merely code comments. Briefly, documentation comments on public packages, classes, and class members of exported modules are specifications.

* **Specification changes**. It's possible to change the API specifications, and this is done regularly. However, these changes require even more scrutiny than code changes. This extra review is handled by the [CSR Process](https://wiki.openjdk.org/display/csr/Main). Specifications are written in stylized, somewhat formal language, and they don't simply describe what the code does. Writing specifications is a separate skill from coding.

* **Compatibility**. Changes should also adhere to high standards of binary, source, and behavioral compatibility. The compatibility impact of apparently innocuous changes is sometimes startling.

For reasons like these it’s quite possible that your change, even though it adds value to you, isn’t deemed to add enough value to the larger community.

If you're relatively new to the Java platform then we recommend that you gain more experience writing Java applications before you attempt to work on the JDK itself. The purpose of the sponsored-contribution process is to bring developers who already have the skills required to work on the JDK into the existing development community. The members of that community have neither the time nor the patience required to teach basic Java programming skills or platform implementation techniques.

The feature releases currently under development are in the JDK Project. Most development work is focused on the newest release, so generally you should be working against the latest JDK sources rather than the JDK Updates sources.

::: {.box}
[To the top](#){.boxheader}
:::
