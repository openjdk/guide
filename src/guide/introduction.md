# Introduction

Welcome to the OpenJDK Developers' Guide!

The OpenJDK Community is the place to collaborate on open-source implementations of the Java Platform, Standard Edition, and related projects. It was created in November 2006, when initial portions of the JDK source code were published under the GPLv2 license.

In order to work together efficiently, clear directions are sometimes needed to avoid misconceptions and to align developers' views of terminology and process. The OpenJDK Community is a fairly pragmatic place. "Do the right thing" is most often the right course of action. Still, if people do things in the same right way then everyone's work becomes more transparent and easier for others to follow. For this reason most parts of the development process have standard flows that are the recommended ways to do things.

The goal of this guide is to answer questions that developers of the JDK might have around development process, tooling, standards, and so forth. The formal rules and processes are described in other documents, such as [JEP 1](https://openjdk.org/jeps/1) for the JDK Enhancement-Proposal & Roadmap Process, and [JEP 3](https://openjdk.org/jeps/3) for the JDK Release Process. This guide is meant to be a complement to such documents, with tutorials and examples for how to follow these rules and how to work together with the rest of the OpenJDK Community.

There are many common use cases that aren't detailed in the formal process. This guide suggests how to work in such cases.

## OpenJDK

::: {.box}
[Quick Links]{.boxheader}

* [OpenJDK Groups](https://openjdk.org/groups/)
* [OpenJDK Projects](https://openjdk.org/projects/)
* [OpenJDK General Roles (Participant, Contributor, Member)](https://openjdk.org/bylaws#general-roles)
* [OpenJDK Project Roles (Author, Committer, Reviewer)](https://openjdk.org/bylaws#project-roles)
:::

OpenJDK consists of a number of [Groups](https://openjdk.org/groups/). Members of a group collaborate on an area of mutual interest. The right hand side bar on the [OpenJDK website](https://openjdk.org/) has a list of all groups in OpenJDK. If you're interested in a specific area, this is where you would start your OpenJDK experience. Look at the group's information and wiki pages, and see what projects they sponsor on the [Census page](https://openjdk.org/census). The [Census](https://openjdk.org/census) shows the structure of the OpenJDK Community.

[Projects](https://openjdk.org/projects/) are where the coding and much of the other work is done in OpenJDK. There are many different projects, some produce shippable artifacts, like the [JDK Project](https://openjdk.org/projects/jdk/), some produce tools to be used by developers of these artifacts, like the [Code Tools Project](https://openjdk.org/projects/code-tools/) or [Project Skara](https://openjdk.org/projects/skara/), and some produce documentation, like the [Developers' Guide Project](https://openjdk.org/projects/guide/). Many projects designs and develops new features for the Java language or the JVM, but there are also less code centric projects like the [Duke Project](https://openjdk.org/projects/duke/) which collects images of the Java mascot, Duke.

## Author, Committer, Reviewer

OpenJDK has a few different roles that determine who has the right to do what in the different projects. These roles are defined in the [OpenJDK Bylaws](https://openjdk.org/bylaws#project-roles). The roles are earned based on experience and knowledge within each project.

A Contributor can have different roles in different projects. When you're new to a project you don't yet have a formal role in that specific project, even though you might have earned roles in other OpenJDK projects or have been recognized as a [Contributor](https://openjdk.org/bylaws#contributor) or a [Member](https://openjdk.org/bylaws#openjdk-member) of OpenJDK. By contributing high-quality content you'll soon be eligible for [OpenJDK roles](https://openjdk.org/bylaws#project-roles) in the project. First [Author](https://openjdk.org/bylaws#author), then [Committer](https://openjdk.org/bylaws#committer), and finally [Reviewer](https://openjdk.org/bylaws#reviewer) if you stay active and earn the trust of the community. Trust is an important part of earning these roles. There's a [rough guideline](https://openjdk.org/projects/) saying that to become a [Committer](https://openjdk.org/bylaws#committer) you should have contributed 8 significant changes, and to become a [Reviewer](https://openjdk.org/bylaws#reviewer) you should have contributed 32 significant changes. In reality it's not as easy as "just" contributing code. You need to build a track record of good decisions and sound judgment and show that you know what differentiates a good change from a not so good one. It's not only correctness of the code that matters, it's also the appropriateness. In the end the trust you've earned is put to the test through a vote.

Note that when a new project is created an initial set of members can be brought in at different levels without a vote.

### Becoming an Author

Becoming an [Author](https://openjdk.org/bylaws#author) is the first step. To achieve this you need to contribute two changes to the project in which you wish to become an Author. Once your changes are pushed into the code base and has been vetted enough to determine that the changes were indeed good changes you can go ahead and send an email to the project lead of that particular project and ask to be added as an Author. Note that "the project" is not OpenJDK, but rather the specific development project where you did your contributions (e.g. "JDK", "JDK Updates", "Amber", etc). The [OpenJDK Project description](https://openjdk.org/projects/#project-author) has a template for such an email. In short the email should contain your name, the project name, your email address, and GitHub links to your changes. In response to your email you will get a time-limited invite which you should fill out.

To see who the project lead is for your project, see the [OpenJDK Census](https://openjdk.org/census). The Census unfortunately doesn't provide email addresses for people, but assuming you have been active on the project mailing list (since you are applying for Author after all), you should be able to find the lead's email address in your local email archive, or ask your sponsor.

As an Author you will get your OpenJDK user name. Once you have gotten the user name, this should be associated with your GitHub account in order for the bots to be able to identify you on GitHub. See the [Skara documentation](https://wiki.openjdk.org/display/SKARA#Skara-AssociatingyourGitHubaccountandyourOpenJDKusername) for more details on that. Once that's done you can create PRs and get them reviewed, but you will still need a sponsor to approve your change before it can be integrated. You'll also get write access to [JBS](#jbs---jdk-bug-system) and the [OpenJDK wiki](https://wiki.openjdk.org) related to the project in question, and to [cr.openjdk.org](https://cr.openjdk.org) via an SSH key provided at the time you accept your invitation.

The rules of any particular project may have different guidelines regarding requirements for Authorship at the discretion of the Lead.

### Becoming a Committer

To become a [Committer](https://openjdk.org/bylaws#committer) you should show that you intend to actively contribute to the project and that you can produce non-trivial changes that are accepted for inclusion into the project code base. The number eight has been seen as a formal lower limit on the number of changes, but since the changes must be non-trivial, or "significant" as the [OpenJDK Project description](https://openjdk.java.net/projects/) says, and the definition of significant is subjective, the general recommendation is to wait with a Committer nomination until there's at least 10-12 changes pushed to have some margin for different interpretations of "significant". In practice though, we have seen several examples where the number of significant changes hasn't been the dominating factor in a Committer vote. A contributor's work in another OpenJDK project may also be relevant for the vote. What the vote should ultimately test is the committer's commitment to the OpenJDK project for which the vote applies - is it believed that the person is dedicated and willing to spend time and effort on the project? Is the person believed to be a good citizen of the project? It's always a good idea to seek the advice of a sponsor who can guide you through the process to becoming a Committer - you will need one to run the Committer vote anyway. They will probably also have a better idea of what constitutes a "significant" change.

Once you have the required changes, a Committer in the project can start a vote by sending an email proposing that you should become a Committer. The email should follow the template found in the [OpenJDK Project description](https://openjdk.org/projects/#project-committer).

A Committer is allowed to push changes without the aid of a sponsor. A Committer is also allowed to nominate other non-Committers to become Committers in the project.

### Becoming a Reviewer

To become a [Reviewer](https://openjdk.org/bylaws#reviewer) you must show a track record of sound and correct judgment calls as mentioned above. Being a good Committer doesn't necessarily make you a good Reviewer. As a Reviewer you have the power to approve changes for inclusion into the project source code. This means that a Reviewer needs to be able to judge the quality and appropriateness of any proposed change, not just the mechanics of the code.

The assumption is that after having produced 32 significant changes one should have become familiar with the process around reviews and the requirements around getting a change approved. This should really be seen as a minimum requirement though. A more practical consideration would be to look at whether the non-trivial commits of a potential Reviewer are accepted largely intact or whether they are always being refined by the review process. There may be cases where it will take significantly more than 32 changes for a Committer to be ready to become a Reviewer.

Once you are deemed ready, a Reviewer in the project can start a vote by sending an email proposing that you should become a Reviewer. The email should follow the template found in the [OpenJDK Project description](https://openjdk.org/projects/#project-reviewer).

### Non-trivial/Significant changes

One key definition when advancing through the OpenJDK roles is the significant change. What exactly does it take for a change to be significant?

Instead of describing the significant change (because that's quite difficult to define) provided here is a few examples of changes that wouldn't be considered significant or for other reasons wouldn't count as significant contributions.

* Purely aesthetic changes like renaming or fixing indentation
* Repeated follow-up bugfixes from earlier changes
* Larger changes where only a non-significant portion of the work was done by the Contributor under vote
* Trivial backports of someone else's changes

::: {.box}
[To the top](#){.boxheader}
:::
