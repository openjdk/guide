# Contributing to an OpenJDK Project

Contributing to OpenJDK can take many forms. Writing code and providing patches is just one of them. A big part of developing a feature or a bugfix is testing and code review. Anything you can do to help out in these areas will be recognized as a contribution. Join the [mailing lists] to engage in design discussions and reviews, and download the latest EA builds or Project repositories to try out new features and give feedback. If you see some misbehavior, or if you see somebody mention some misbehavior on some internet forum, try to track it down. Good bug reports with reproducible test cases are extremely valuable and make excellent contributions.

Anything you can do to spread the word about Java, new features, and your experiences using the JDK will be helpful for the community and to the OpenJDK developers. Trying out a new feature and reporting your experiences is also a contribution. Whether you find that the new feature improves your application, or if you find some area that needs to be improved, your feedback is valuable to the developers of that feature.

If you have a success story where Java solved your problem, or if you successfully upgraded to a more recent version of the JDK and noticed some improvements, spreading this story through a blog, news article, or some other channel is also a contribution.

If you're in a position to choose what programming language to use in a project, in a tutorial, or in a class, you have the power to enlarge the Java community in a very direct way, and your colleagues or students will get an opportunity to learn one of the most used programming languages in the world.

## Requesting a change

If you want to request a change to the JDK, but don't have the intention to implement/contribute to the change yourself, you should always report it at [bugreport.java.com](https://bugreport.java.com). This is also the case if you find a change that you would like to see backported to an earlier JDK release. **Never** reach out directly to any developer. Also, please note that the [OpenJDK mailing lists](#mailing-lists) are intended for developers and contributors. These lists are not support channels or channels for requesting changes.

Before you file an issue, make sure you have read [Things to consider before proposing changes to OpenJDK code](#things-to-consider-before-proposing-changes-to-openjdk-code) and [Why is my change rejected?](#why-is-my-change-rejected) below.

## Things to consider before proposing changes to OpenJDK code

Every change to JDK code carries a risk of changes in behavior which may adversely affect applications. Generally we're looking to improve the functionality and capability and sometimes performance of the platform without that negative consequence. So we need to ask ourselves whether each change is worthwhile - and some may not be no matter how well intentioned.

One question to ask yourself is: **What problem are you trying to solve?**

The important thing here is to understand the problem itself, independent of any solution (and independently of the solution that currently happens to be in your change). A number of other questions and lines of thought emanate from thinking about the problem. For example: is this the right problem to solve? Does solving this problem create worse problems elsewhere; that is, is there a net benefit? Does this problem need to be solved in the JDK, or can and should it be solved elsewhere (e.g., in tooling)?

The next question you need to answer before making any change is: **What is the main intention of your change?**

Depending on your answer to that question you will need to consider one or more of the following paragraphs.

* **Correctness** -- If your change improves program correctness, that's important. And to broaden this, fixing of all kinds of bugs that really make things better for applications in ways they can detect is important.

* **Robustness** -- Updating code to use a newer platform API can be a good change. Moving away from APIs that are being deprecated or that are no longer maintained is likely desired. Do note though that supposedly equivalent APIs may not be the drop in replacement you think they are. You'll need to prove that the code has the same behavior after the change through extensive testing.

* **Security** -- If you intend to increase the overall security of the platform, changes following secure coding practices and using appropriate platform APIs for that are usually welcome. The exception might be if it's a potentially destabilizing change in code where there's only a theoretical problem. **Please note**: If you think you found a real security bug that might compromise the platform you should follow the process [here](https://openjdk.org/groups/vulnerability/report).

* **Refactoring / Cleanup** -- Making code easier to understand or reducing code size may be a good change in areas that are under active development. Stable code however isn't a good candidate for refactoring regardless of what the code looks like. The OpenJDK has evolved over many years and some parts have been stable for decades. If there's no immediate need to work on the code for other reasons, then what will a cleanup actually achieve? One specific area where refactoring and cleanups are explicitly discouraged is in third-party code.

* **Performance** -- Can you demonstrate a user perceptible change? If you can't measure the change, or a user can't notice the change, or the change only improves code that is used infrequently, then maybe it isn't worth it. Do you have benchmarks to back up your claims? Do you understand the results? Performance testing is complex and often there are many factors unrelated to your change that affects the numbers. What's the tradeoff? The performance improvements that just make everything better do exist, but they are extremely rare. Most often the code gets more complex, or you speed up one case but slow down another. Are you making the right tradeoff?

* **Modernizing** -- Changing code purely for the sake of using a new language feature isn't usually a good change. Be a subject matter expert, not just a language expert. Writing code in "a better way" is not guaranteed to be safe. A change of behavior is always possible and unless you understand the code you are changing at more than the core language/API level, and have looked into appropriate tests and can speak to the risks, then you should first find a subject matter expert to discuss it with. Keep in mind that the OpenJDK code is developed by a large community. If a new language feature is introduced, all developers working in that code must learn this new feature and understand the implications of using it.

## I found an issue in JBS that I want to fix

Great! This is a good way to get started with OpenJDK development. There are a few things you should think about before getting started.

- As with any change, do bring it up for discussion on the [mailing lists](#mailing-lists) before spending time on the fix. Even though the issue has been filed in JBS there may be reasons not to fix that particular issue right now.
- Never work on an issue that is assigned to someone else. Duplicating work is pointless. If you think that an issue should be fixed and it has been assigned to someone for a long time without progress, reach out to that person and ask what the current status is. Many issues require a lot of thought, and there may be half-baked solutions that you can build on to avoid the traps the initial developer has already fallen into.

Once you are the assignee of an issue, continue reading [I have a patch, what do I do?](#i-have-a-patch-what-do-i-do) below. (Ideally before you have a patch.)

## I have a patch, what do I do?

::: {.box}
[Quick Links]{.boxheader}

* [Oracle Contributor Agreement (OCA)](https://www.oracle.com/technical-resources/oracle-contributor-agreement.html)
* [OCA Signatories List](https://oca.opensource.oracle.com/?ojr=contrib-list)
* [OpenJDK Legal Documents](https://openjdk.org/legal/)
* [JDK Bug System (JBS)](https://bugs.openjdk.org/)
* [OpenJDK Project Roles](https://openjdk.org/bylaws#project-roles)
:::

In many GitHub projects the standard way to propose a change is to create a pull request (PR) and discuss the patch in the PR. For [OpenJDK Projects](https://openjdk.org/bylaws#project) the situation is somewhat different. The JDK is used for mission critical applications and by millions of developers, the bar to contributing changes is high. Please follow the steps outlined below to make sure your change passes above the bar before creating a PR.

### 1. Sign the OCA

Like many other open-source communities, the OpenJDK Community requires Contributors to jointly assign their copyright on contributed code. [Oracle](https://www.oracle.com) is the steward of OpenJDK and if you haven't yet signed the [Oracle Contributor Agreement](https://oca.opensource.oracle.com/) (OCA), and are not covered by a company-level agreement, then please do so. This is required in order to make your patch available for review. The OCA gives [Oracle](https://www.oracle.com) and you as a Contributor joint copyright interests in the code. You will retain your copyright while also granting those rights to [Oracle](https://www.oracle.com). If you don't know if your organization has signed the OCA you can check the [OCA Signatories List](https://oca.opensource.oracle.com/?ojr=contrib-list), or ask your legal advisor.

When you sign the OCA, please make sure that you specify your GitHub user name in the `Username` field of the OCA. If you try to create a PR before you have signed the OCA, or if you didn't specify your GitHub user name, you'll get instructions telling you to do so, and the PR won't be published until this is done. OCA registration is a manual process. Please allow for up to several days to have your OCA application processed, even though it's normally processed swiftly. An alphabetical list of all of the assigned OpenJDK usernames can be found on the [OpenJDK people](https://db.openjdk.org/people) list.

You only need to sign the OCA once in order to cover all changes that you might contribute to any Oracle-sponsored open-source community. If you've already signed the OCA or the former SCA (Sun Contributor Agreement) for any Oracle-sponsored open-source community, then you do not need to sign it again in order to contribute to OpenJDK. Please note that you don't need to sign an OCA if you work at Oracle or a company which has negotiated an equivalent agreement.

### 2. Socialize your change

Once the OCA is signed, please restrain your urge to create a PR just a little while longer. In order to prepare the community for your patch, please socialize your idea on the relevant [mailing lists]. Almost all changes, and in particular any API changes, must go this route and have a broad agreement in place before there is any point in presenting code. To understand the criteria by which your patch is going to be judged, please read [Why is My Change Rejected?] below. In short, hidden constraints and assumptions, stability and quality, maintainability, compatibility, and conformance to specifications must be considered before your PR is ready to be submitted. If you don't understand the constraints for acceptance, you might be surprised when your PR is rejected.

Please note that lack of engagement should not be interpreted as supporting the proposal. Lack of engagement might be better interpreted as people are busy or maybe that the problem isn't compelling or high priority enough to spend time on right now. If you didn't get the desired attention and the required agreement in your mail thread, **do not** proceed to create a PR.

### 3. Find a Sponsor

Socializing your change on the mailing lists also prevents the surprise that would otherwise make the community choke on their morning coffee when they see a huge patch in a new, unknown PR. As a new developer in the community you'll need to make a few friends that agree with your change. There are many good reasons to make friends, but the one relevant here is that for your first changes you'll need a [sponsor](#reviewing-and-sponsoring-a-change) to facilitate the integration of your work. The [sponsor](#reviewing-and-sponsoring-a-change) will perform any number of administrative tasks like JBS updates, additional testing, etc. It's usual for a [sponsor](#reviewing-and-sponsoring-a-change) to also be a reviewer of a change and thus familiar with it, but it's not a requirement.

### 4. Create a tracking issue in JBS

Many [OpenJDK Projects](https://openjdk.org/bylaws#project) require a tracking issue to be filed in the [JDK Bug System (JBS)](https://bugs.openjdk.org/) before a change can be integrated. This is the case for instance for the JDK and the JDK Updates Projects. In order to obtain write access to JBS you need to be an [Author](https://openjdk.org/bylaws#author) in an [OpenJDK Project](https://openjdk.org/bylaws#project) (see [Becoming an Author]). For your first changes, ask your [sponsor](#reviewing-and-sponsoring-a-change) to help you create the issue or file the bug through the [Bug Report Tool](https://bugreport.java.com/).

### 5. Get acquainted with local process

Even though we strive to unify how things are done within OpenJDK, different areas and [Projects](https://openjdk.org/bylaws#project) in OpenJDK may have slight variations in how they work. Some of these differences are highlighted throughout this guide, some aren't. If you're new to an area, make sure you understand local differences before you proceed. Ask your [sponsor](#reviewing-and-sponsoring-a-change) who should be your main point of contact through your first developer experience in OpenJDK.

## Why is my change rejected?

::: {.box}
[Quick Links]{.boxheader}

* [Java Language and Virtual Machine Specifications](https://docs.oracle.com/javase/specs/)
* [Java API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html)
* [CSR Process](https://wiki.openjdk.org/display/csr/Main)
:::

Just about every Java developer out there has an idea or two for how to enhance something. And believe it or not, not every idea is a good idea. Even though many ideas are indeed good, we must be quite restrictive on what we actually include into the JDK. The goal is not to take in the maximum number of contributions possible, but rather to accept only the highest-quality contributions. The JDK is used daily by millions of people and thousands of businesses, often in mission-critical applications, and so every change must be scrutinized in detail. There are many reasons for this.

* **Hidden constraints and assumptions** -- Many sections of code have constraints and assumptions that aren't necessarily visible at first glance. This might preclude certain changes, even those that might seem obvious.

* **Stability and quality** -- The JDK is used by millions of developers and as a widely deployed commercial product, it's held to a high standard of quality. Changes should include tests where practical, and core tests should pass at all times. The value of the change should outweigh the risk of introducing a bug or performance regression.

* **Maintainability** -- Any new feature or code change will need to be maintained in the JDK essentially forever, thus imposing a maintenance burden on future maintainers. The code might still be in use long after you and the people who reviewed it have moved on. New maintainers must be able to understand how to fix bugs in this code.

* **Complexity** -- Each new feature interacts with all the existing features, which can result in geometric growth of the interactions among features if features are added unchecked. Sometimes we avoid adding a new feature, even if it seems like an obvious thing to add, if that feature would make it difficult to add a more important feature in the future.

* **Adherence to specifications** -- Much of the JDK is governed by a series of specifications, in particular the [Java Language Specification](https://docs.oracle.com/javase/specs/), the [Java Virtual Machine Specification](https://docs.oracle.com/javase/specs/), and the [Java API Specification](https://docs.oracle.com/en/java/javase/15/docs/api/index.html) ("javadocs"). All changes must be checked and tested carefully to ensure that they don't violate these specifications.

* **Javadoc comments are specifications** -- The Java API Specification is authored in the form of javadoc comments, so even apparently innocuous changes to comments can be quite significant. It's not always easy to tell what comments are part of the specification and what parts are merely code comments. Briefly, documentation comments on public packages, classes, and class members of exported modules are specifications.

* **Specification changes** -- It's possible to change the API specifications, and this is done regularly. However, these changes require even more scrutiny than code changes. This extra review is handled by the [CSR Process](https://wiki.openjdk.org/display/csr/Main). Specifications are written in stylized, somewhat formal language, and they don't simply describe what the code does. Writing specifications is a separate skill from coding.

* **Compatibility** -- Changes should also adhere to high standards of binary, source, and behavioral compatibility. The compatibility impact of apparently innocuous changes is sometimes startling.

For reasons like these it’s quite possible that your change, even though it adds value to you, isn’t deemed to add enough value to the larger community.

If you're relatively new to the Java platform then we recommend that you gain more experience writing Java applications before you attempt to work on the JDK itself. The purpose of the sponsored-contribution process is to bring developers who already have the skills required to work on the JDK into the existing development community. The members of this community have neither the time nor the patience required to teach basic Java programming skills or platform implementation techniques.

The feature releases currently under development are in the JDK Project. Most development work is focused on the newest release, so generally you should be working against the latest JDK sources rather than the JDK Updates sources.

::: {.box}
[To the top](#){.boxheader}
:::
