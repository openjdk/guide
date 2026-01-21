# Reviewing and Sponsoring a Change

::: {.box}
[Quick Links]{.boxheader}

* [GitHub Docs on pull requests reviews](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews)
:::

Two of the most important contributions you can make in the OpenJDK community are to review and sponsor changes for other developers. All changes needs to be reviewed. Many changes even need to be reviewed by more than one person. This means that in order to enable a fast-pased development experience, all developers need to review more changes then they produce themself.

If you are new to an area, reviewing changes is also a great way to learn the code and see what general styles and types of changes are relevant in the area. Be mindful though, if you don't know the area well you should state this in your review comments.

New developers in the OpenJDK community don't have the permissions needed to integrate changes to the repositories. This is a feature that ensures that all developers get familiar with the code, processes, and community before being allowed to actually make changes. To get their first changes in, the new Contributor needs the help of a Sponsor. The Sponsor's role is to offer constructive advice and eventually integrate the sponsored contribution into the repository.

Sponsoring new contributions is an important activity - it's how the engineering culture of a project gets passed on from the core group to new Contributors, from one generation to the next. Take pride in the value you provide to Contributors. Their success reflects well on you.

There are many different reasons to sponsor a change and depending on the situation the exact steps involved may differ significantly. An experienced developer hired into a larger team of OpenJDK developers is likely to get much of the required information by osmosis and will likely need less help from a sponsor than the enthusiast sitting at home with no prior experience of large scale software development. This text aims to highlight the steps involved in sponsoring a change but can't cover all possible scenarios. As always, common sense takes precedence where the assumptions made here doesn't apply to your use case.

## Responsibilities of a Reviewer

As a [Reviewer](https://openjdk.org/bylaws#reviewer) you have a responsibility to make sure changes are sound and align with the general direction of the area. If you, as a [Reviewer](https://openjdk.org/bylaws#reviewer), review a change in an area that you don't know well you probably shouldn't be the one to approve the change.

[Reviewers](https://openjdk.org/bylaws#reviewer) should be aware that they take full responsibility for the appropriateness and correctness of any changes in their area of expertise. If something goes wrong (e.g., the build breaks) and the change's author is unavailable, they may be asked to deal with the problem. Potential [Reviewers](https://openjdk.org/bylaws#reviewer) are encouraged to refuse to review code for which they aren't qualified.

[Reviewers](https://openjdk.org/bylaws#reviewer) should examine not only the code being added or changed but also the relevant unit or regression tests. If no tests are being added for a change that isn't already covered by existing tests and have the appropriate [noreg-]{.jbs-label} label, the [Reviewer](https://openjdk.org/bylaws#reviewer) should question this.

As a [Reviewer](https://openjdk.org/bylaws#reviewer), Contributors will look up to you for guidance to get their contributions into the project - your actions will determine whether Contributors will feel welcome and want to engage further with the project beyond their initial attempt, or not. Let's not lose enthusiastic, engaged and technically competent Contributors due to a lack of communication. If you see a request in your area of expertise and you can't address it, at least acknowledge receipt of the request and provide an estimate for when you'll be able to give it your attention. A frank explanation of your time constraints or commitments will be appreciated and respected.

## Reviewing a change on GitHub

Code reviews in OpenJDK happens on [GitHub](https://github.com/openjdk). This guide will hint at the most common steps to perform a review but it's not a complete documentation of all features. For official documentation see the [GitHub Docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews).

When you arrive at a pull request there are a few different sections that you can browse through, Conversation, Commits, Checks, and Files changed. We will look at the first and the last of these.

### Conversation

The Conversation section is where all discussion around the PR happens. Note that this section is intended for technical discussion around the actual implementation of a change. This is in general not the place to discuss the appropriateness of the change or have overarching design discussions, that should happen on the appropriate [mailing lists]. Yes, PR comments will be sent to the mailing lists as well, but it's unlikely that all the right people will see it. PR mails sent to the mailing lists will have a subject indicating that it's about the specific implementation in the PR. If the discussion is larger than just about the specific implementation, for instance around the design or future of the feature, then a much larger audience needs to be made aware of the discussion. A separate email thread with a proper subject is preferred in such cases.

You can either reply to existing comments by using the text field beneath each comment, or add a new comment by scrolling to the bottom of the page and use the larger text field where it says "Leave a comment".

Reviews take time for everyone involved. Your opinions are much appreciated as long as they are on-topic and of a constructive nature. A comment of the form "I don't like this" won't help anyone to improve the change. Instead express what it is that you don't like and give examples of how to do it differently. Always be polite and make sure you read through all previous comments before adding your own, the answer you are looking for may already have been given.

:::{.note}
Note that GitHub will collapse comments if there are many of them, and if an issue is marked as resolved. This means that you have to be observant and may have to dig around a bit to find all comments in the PR.
:::

Never ask the author of a change to fix unrelated issues in the code that you find during your review. Such issues should be handled through a separate JBS issue and PR.

### Files changed

The Files changed-section is where the actual change is presented. On the left hand side there's a list of all files changed. This is useful to get a quick overview and to see if the change touches an area that you need to review.

The diff view is pretty straight forward, red stuff has been removed, green stuff has been added. You can configure (among other things) if you want a unified diff or a split view, if you want to hide whitespace changes, what types of files you want to show, and if you want to show the entire change or just what's happened since your last review.

When you hover the text in the change a blue square with a plus sign pops up to the left of the line. Click it to add a comment about the change on the corresponding line. When you create your first comment you have the option to simply add a single comment or to start a review. In general you want to start a review so that all your comments are gathered in the same context when emails are sent out etc. You can also attach a comment to a file rather than to a specific line in the file by using the speech bubble icon at the top right.

When a complete file has been reviewed there's a "viewed" checkbox at the top right that can be used to hide the files that you are done with. This is useful for changes that involve many files.

Once you have looked through all the changes and added all your comments, the green button at the top right of the screen "Review changes" is used to finish your review. You can add a final comment to sum up your findings and then choose whether you just want to provide your comments, if you want to approve the changes, or request that changes are done before the change can be approved. Finally click "Submit review" to publish your thoughts.

### Trivial changes

A change that is small, well contained, and that makes no semantic changes can be called _trivial_. Typical examples are fixing obvious typos or renaming a local identifier. A trivial change can also be integrating an already-reviewed change that was missed in an earlier integration (e.g., forgot to add a file) or generated changes like a [`git revert`](#backing-out-a-change). It's up to the author of a change to claim that the change is trivial in the RFR, and it's up to the [Reviewer](https://openjdk.org/bylaws#reviewer) whether to approve such a claim. A change is trivial only if the [Reviewer](https://openjdk.org/bylaws#reviewer) agrees that it is. A trivial change doesn't need to wait 24 hours before being pushed, and it only needs one [Reviewer](https://openjdk.org/bylaws#reviewer), even in areas where stricter rules for integration normally apply.

## Volunteering to sponsor a contribution

In an ideal situation opportunities to sponsor contributions occur in the OpenJDK mail lists. Since Contributors are encouraged to discuss their intended changes before they submit a patch, the ideal time to declare your sponsorship is during that initial conversation. As a Sponsor you should offer advice and collaborate with the Contributor as necessary to produce a high-quality patch. In addition to sponsoring changes to code you regularly maintain, there may be other areas where you can serve as a Sponsor.

After publicly committing to sponsoring a contribution, you need to "claim the sponsorship request" in [JBS](#jbs---jdk-bug-system) unless the Contributor already has a JBS account and can assign the bug to themself. To do that you need to perform three steps:

* Assign the bug to yourself.
* Add a comment providing the name of the Contributor and a summary of the approach to solving the problem.
* Set the bug's [Status]{.jbs-field} to [In Progress]{.jbs-value}.

If the contribution doesn't already have an associated OpenJDK bug then create one in [JBS](#jbs---jdk-bug-system).

It should be noted that claiming the sponsorship can take many other forms. In cases where a change has been discussed, or a starter bug has been picked up and fixed even though a sponsor hasn't been identified yet it may be as simple as just showing up at the PR and sponsor the change once it's been reviewed.

## Responsibilities of a sponsor

As a sponsor, you aren't technically required to review the change, other Reviewers may already have looked at it or signed up to review. But it will be your name on the commit so you should do whatever you feel is needed to be comfortable with that. You may need to work with the Contributor to make any necessary changes, until you and the Contributor are satisfied with the result, and you are satisfied that the proposed contribution will pass any relevant review and testing. That may take more than one iteration in the worst case. You may also need to help out with any process or practical questions around the OCA, GitHub PRs, and specific requirements in the area or project.

To integrate the change the Contributor should use the command `/integrate` on the PR as prompted by the bots. Once that is done, you as a sponsor enter the command `/sponsor` in a comment on the PR.

Once the change has been integrated you may need to keep an eye out for any reported test failures and be prepared to investigate if such failures stem from the change you sponsored, and if so, work with the Contributor to resolve the issue.

::: {.box}
[To the top](#){.boxheader}
:::
