# Sponsoring a Change

New developers in the OpenJDK community doesn't have the permissions needed to push changes to the repositories. This is a feature that ensures that all developers get familiar with the code, processes, and community before being allowed to actually make changes. To get the first changes in, the new Contributor needs the help of a Sponsor. The Sponsor's role is to offer constructive advice and eventually push the sponsored contribution into the repository.

There are many different reasons to sponsor a change and depending on the situation the exact steps involved may differ significantly. A developer hired into a larger team of experienced OpenJDK developers is likely to get the required information in new hire training or similar and will likely need less help from a sponsor than the entusiast sitting at home with no prior experience of large scale software development. This text aims to highlight the steps involved in sponsoring a change but can't cover all possible scenarios. As always, common sense takes precedence where the assumptions made here doesn't apply to your use case.

## Subscribe to OpenJDK mailing lists

It should go without saying that as a Committer for a project, you should be subscribed to and actively participating in all appropriate mailing lists. This includes both project mailing lists and any group mailing lists where technical decisions may take place for the area.

As a Sponsor, Contributors will look up to you for guidance to get their contributions into the project - your actions will determine whether Contributors will feel welcome and want to engage further with the project beyond their initial attempt, or not. Let's not lose enthusiastic, engaged and technically competent Contributors due to a lack of communication. If there is a request in your area of expertise and you can't address it, at least acknowledge receipt of the request and provide an estimate for when you'll be able to give it your attention. A frank explanation of your time constraints or commitments will be appreciated and respected.

## Volunteer to sponsor a contribution

Opportunities to sponsor contributions can occur in the OpenJDK mail lists. Since Contributors are encouraged to discuss their intended changes before they submit a patch, the ideal time to declare your sponsorship is during that initial conversation. As a Sponsor you should offer advice and collaborate with the contributor as necessary to produce a high-quality patch. In addition to sponsoring changes to code you regularly maintain, there may be other areas where you can serve as a Sponsor.

After publicly committing to sponsoring a contribution, you need to "claim the sponsorship request" in [JBS](#jbs---jdk-bug-system) unless the Contributor already has a JBS account and can assign the bug to themself. To do that you need to perform three steps:

* first assign the bug to yourself,
* then add a comment providing the name of the Contributor and a summary of the approach to solving the problem,
* and finally set the bug's [Status]{.jbs-field} to `In Progress`.

If the contribution doesn't already have an associated OpenJDK bug then create one in [JBS](#jbs---jdk-bug-system).

## Review the contribution

You're now ready to review the proposed changes. As a sponsor, you aren't technically required to review the change, other Reviewers may already have looked at it or signed up to review. But it will be your name on the commit so you should do whatever you feel is needed to be comfortable with that. Some changes may be trivial, like spelling fixes. Others may require a more intensive review - including, for example, a review by the CSR.

As a Sponsor, you may need to work with the Contributor to make any necessary changes, until you and the Contributor are satisfied with the result, and you are satisfied that the proposed contribution will pass any relevant review processes and build-and-test processes. That may take more than one iteration in the worst case.

You may also need to help out with any process or practical questions around the OCA, GitHub PRs, and specific requirements in the area or project.

## Push the contribution

Once the contribution passes the review and build-and-test processes, you're ready to perform the integration. The Contributor should use the command `/integrate` on the PR as prompted by the bots. Once that is done, you as a sponsor enters the command `/sponsor` in a comment on the PR. That's it!

## Celebrate your contributions

Sponsoring new contributions is an important activity - it's how the engineering culture of a project gets passed on from the core group to new Contributors, from one generation to the next. It should be fun, so please celebrate the contributions you've sponsored by mentioning them on your blog or similar. Congratulate other Sponsors on their work. Take pride in the value you provide to Contributors. Their success reflects well on you.

::: {.box}
[To the top](#){.boxheader}
:::
