% What Happens Next

::: {.NavBit}
[« Previous](producingChangeset.html) • [TOC](index.html) • [Next »](bugDatabase.html)
:::

This section describes what might happen after a changeset gets into the build,
for example a bug might be filed or a backport could be requested.

* [Requesting a Backport](#requesting-a-backport)
* [Filing a Bug](#filing-a-bug)
* [ProblemListing or `@ignore`-ing a Test](#problemlisting-or-ignore-ing-a-test)
* [Backing Out a Change](#backing-out-a-change)

## Requesting a Backport

TBD

## Filing a Bug

When a new failure is found in the JDK a bug should be filed to describe and track the issue. Depending on your role in the OpenJDK you can either use the [Bug Report Tool](https://bugreport.java.com/) or, if you are Author in an OpenJDK Project, report the bug directly in the [JDK Bug System](https://bugs.openjdk.java.net/). Try to make the bug report as complete as possible to make it easier to triage and investigate the bug. It's not the reporter's responsibility to set a correct priority, but a qualified guess is always better than a default value. To help with setting the right priority consider things like how the bug impacts the product and our testing, how likely is it that the bug triggers, how difficult is it to work around the bug if it's not fixed soon, and whether it's a recent regression, since that may break existing applications. Regressions are often higher priority than long standing bugs and may block a release if not fixed.

A few things to keep in mind when filing a new bug:

* Before filing a bug, verify that there isn't already a bug filed for this issue.
* Add relevant labels like `intermittent`, `regression`, `noreg-self` etc.
* Set affects version to the JDK version(s) where the failure was seen.
* In the description, always include (if possible):
  * full name of the failing tests
  * error messages
  * assert messages
  * stack trace
  * command line information
  * relevant information from the logs
* Only set CPU and/or OS fields if the bug **ONLY** happens on that particular platform.
* Always file separate bugs for different issues.
  * If two crashes looks related but not similar enough to for sure be the same, it is easier to close a bug as a duplicate than it is to extract the relevant info from a bug to create a new one later.

## ProblemListing or `@ignore`-ing a Test

Sometimes tests break. It could be e.g. due to bugs in the test itself, due to changed functionality in the code that the test is testing, or changes in the environment where the test is executed. While working on a fix, it can be useful to stop the test from being executed in everyone else's testing to reduce noise, especially if the test is expected to fail for more than a day. There are two ways to stop a test from being run in standard test runs: ProblemListing and using the `@ignore` keyword. Removing tests isn't the standard way to remove a failure. A failing test is often a regression and should ideally be handled with high urgency.

I'll say it right away so that it's not forgotten at the end: Remember to remove the JBS id from the ProblemList or the test when the bug is closed. This is especially easy to forget if a bug is closed as a duplicate or 'Will Not Fix'.

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

The `@ignore` keyword is used in the test source code. This is mainly used for tests that are so broken that they may be harmful or useless. Examples can be tests that don't compile because something changed in the platform; or a test which might remove your `/etc/shadow`. Use `@ignore` with a bug reference in the test case to prevent the test from being run.

~~~java
/**
 *  @test
 *  @ignore 4711
 *
~~~

In this example, `MyTest.java` is excluded, tracked by bug `JDK-4711`. `@ignore` should always be placed directly before the first `@run` line in the test.

### Dealing with JBS bugs for test exclusion

ProblemListing and `@ignore`-ing are done in the JDK source tree, that means a check-in into the repository is needed. This in turn means that a unique JBS issue and a code review are needed. This is a good thing since it makes test problems visible.

* **Code review**: This is considered a [trivial](glossary.html#trivial) change.
* **JBS issue**: A JBS issue is obviously created for the bug that caused the failure, we call this the _main issue_. To exclude the test, create a subtask to the main issue. Also add the label `problemlist` to the main issue.

The fix for the main issue should remove the test from the ProblemList or remove the `@ignore` keyword from the test.

#### Triage excluded issues

After a failure is handled by excluding a test, the main JBS issue should be re-triaged and possibly given a new priority. This should be handled by the standard triage process. A test exclusion results in an outage in our testing. This outage should be taken into consideration when triaging, in addition to the impact of the bug itself.

## Backing Out a Change

If a change causes a regression that can't be fixed within reasonable time the best way to handle the regression can be to back out the change. Backing out means that the inverse (anti-delta) of the change is pushed to effectively undo the change in the repository. There are two parts to this task, how to do the bookkeeping in JBS, and how to do the actual backout in mercurial.

The backout is a regular change and will have to go through the standard code review process, but is considered a [trivial](glossary.html#trivial) change. The rationale is that a backout is usually urgent in nature and the change itself is automatically created by hg, and reviewed by the person who is performing the backout, so even though only one additional Reviewer is required the change will in practice get two reviews.

### How to work with JBS when a change is backed out

#. Close the original JBS issue **(O)**.
   * "Verify" the issue and choose "Fix Failed".
#. If the intention is to fix the change and submit it again, create a redo-issue **(R)** to track that the work still needs to be done.
   * Clone **(O)** and add the prefix `[REDO]` on the summary - the clone becomes the redo-issue **(R)**.
   * Make sure relevant information is brought to **(R)**.
   * Remember that comments are not brought over when cloning.
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

### How to work with mercurial when a change is backed out

In order to backout a change, the `hg backout` command is recommended, which essentially applies the anti delta of the change. Make sure you perform the backout in the most upstream repostiory the change has escaped to.

~~~
hg backout [OPTION]... [-r] REV

reverse effect of earlier changeset

    Prepare a new changeset with the effect of REV undone in the current
    working directory.

    If REV is the parent of the working directory, then this new changeset is
    committed automatically. Otherwise, hg needs to merge the changes and the
    merged result is left uncommitted.
~~~

::: {.NavBit}
[« Previous](producingChangeset.html) • [TOC](index.html) • [Next »](bugDatabase.html)
:::
