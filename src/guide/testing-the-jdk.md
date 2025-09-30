# Testing the JDK

::: {.box}
[Quick Links]{.boxheader}

* [Using the run-test Framework](https://openjdk.org/groups/build/doc/testing.html)
* [jtreg Harness Documentation](https://openjdk.org/jtreg/)
* [Google Test Documentation](https://github.com/google/googletest/blob/main/docs/index.md)
:::

In addition to your own Java applications, OpenJDK has support for two test frameworks to test the JDK, jtreg and GTest. jtreg is a Java regression test framework that is used for most of the tests that are included in the OpenJDK source repository. The Google Test (GTest) framework is intended for unit testing of the C++ native code. Currently only JVM testing is supported by the GTest framework. Other areas use jtreg for unit testing of C++ code.

This section provides a brief summary of how to get started with testing in OpenJDK. For more information on configuration and how to use the OpenJDK test framework, a.k.a. "run-test framework", see [`doc/testing.md`](https://github.com/openjdk/jdk/blob/master/doc/testing.md).

Please note that what's mentioned later in this section, like [GHA](#github-actions) and tier 1 testing, will only run a set of smoke-tests to ensure your change compiles and runs on a variety of platforms. They won't do any targeted testing on the particular code you have changed. You must always make sure your change works as expected before integrating, using targeted testing. In general all changes should come with a regression test, so if you're writing product code you should also be writing test code. Including the new tests (in the right places) in your change will ensure your tests will be run as part of your testing on all platforms and in the future.

A few key items to think about when writing a regression test:

* A regression test should execute fast - a few seconds at most
* The test should only test the desired functionality - if you have several features to test, write more tests
* The test should pass reliably on all supported platforms - watch out for platform-specific differences such as path separators
* Binary files shouldn't be checked in, if your test needs to use one, the test should create it in some fashion
* Avoid shell scripts and relying on external commands as much as possible

The jtreg documentation has a section on [how to write good jtreg tests](https://openjdk.org/jtreg/writetests.html).

There are a few cases where it doesn't make sense to write an explicit regression test. These should be tagged in JBS with one of the [noreg-labels](#noreg).

## jtreg

In-depth documentation about the jtreg framework is found here: [jtreg harness](https://openjdk.org/jtreg/). jtreg itself is available in the [Code Tools Project](https://openjdk.org/projects/code-tools/).

Below is a small example of a jtreg test. It’s a clean Java class with a main method that is called from the test harness. If the test fails we throw a RuntimeException. This is picked up by the harness and is reported as a test failure. Try to always write a meaningful message in the exception. One that actually helps with understanding what went wrong once the test fails.

~~~Java
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
~~~

This example only utilizes three jtreg specific tags, `@test`, `@summary`, and `@run`. `@test` simply tells jtreg that this class is a test, and `@summary` provides a description of the test. `@run` tells jtreg how to execute the test. In this case we simply tell jtreg to execute the main method of the class `TestXY`. `@run` isn't strictly necessary for jtreg to execute the test, an implicit `@run` tag will be added if none exists. However, for clarity and in order to avoid bugs it's recommended to always explicitly use the `@run` tag.

There are several other tags that can be used in jtreg tests. You can for instance associate the test with a specific bug that this test is a regression test for. The bug id is written without the `JDK-` prefix.

~~~
@bug 8272373
~~~

You can add several bug ids in the same `@bug` tag, separated by a single space. These bug ids refer to product bugs for which a fix is verified by this test. JBS issues that track changes to the test itself are not listed here.

You can also specify a number of requirements that must be fulfilled for jtreg to execute the test.

~~~
@requires docker.support
@requires os.family != "windows"
@requires os.maxMemory > 3G
@requires os.arch=="x86_64" | os.arch=="amd64"
~~~

And you can specify if the test requires specific modules, or command line flags to run the test in several different ways.

~~~
@modules java.base/jdk.internal.misc
@run main/othervm -Xmx128m TestXY
~~~

Note that you can have several `@run` tags in the same test with different command line options.

jtreg also have support for labeling tests with keys using the `@key` tag. These keywords can then be used to filter the test selection. For instance if you have a UI test which needs to display a window you'll want to make sure the test harness doesn't try to run this test on a system which doesn't support headful tests. You do this by specifying

~~~
@key headful
~~~

Another example is `@key randomness` that should be used to indicate that a test is using randomness - i.e. is intentionally non-deterministic.

There are many other keywords in use and their usage may differ between areas in the JDK. Make sure you understand the conventions for the particular area you are testing since these are just examples.

The [jtreg documentation](https://openjdk.org/jtreg/) provides information on many more tags like these.

The [compiler group](https://openjdk.org/groups/compiler/) has a section in their wiki with [Guidelines for "langtools" tests](https://openjdk.org/groups/compiler/tests.html).

### Running OpenJDK jtreg tests

When configuring the OpenJDK build you can tell it where your jtreg installation is located. When providing this information you can later run `make run-test` to execute jtreg tests.

~~~
sh ./configure --with-jtreg=/path/to/jtreg
make run-test TEST=tier1
~~~

In the OpenJDK source tree you can find a directory called `test`. There are a large number of tests in this directory that are written to be used with jtreg.

~~~
make run-test TEST=test/jdk/java/lang/String/
~~~

You can also run jtreg without invoking make. In this case you’ll need to tell jtreg which JDK to test.

~~~
jtreg -jdk:/path/to/jdk /path/to/test
~~~

## GTest

As mentioned the Google test framework is mainly used for C++ unit tests. There are several of these in the `test/hotspot` directory. Currently, only the C++ code in the JVM area is supported by the OpenJDK GTest framework. The tests can be run without starting the JVM, which enables testing of JVM data structures that would be fragile to play with in a running JVM.

~~~Java
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
~~~

`ASSERT_EQ` is one example of an assertion that can be used in the test. Below are a few other examples. A full list is found in the [Google Test Documentation](https://github.com/google/googletest/blob/main/docs/index.md).

~~~Java
ASSERT_TRUE(condition);
ASSERT_FALSE(condition);
EXPECT_EQ(expected, actual);
EXPECT_LT(val1, val2);
EXPECT_STREQ(expected_str, actual_str);
~~~

`ASSERT` is a fatal assertion and will interrupt execution of the current sub-routine. `EXPECT` is a nonfatal assertion and will report the error but continues to run the test. All assertions have both an `ASSERT` and an `EXPECT` variant.

For more information on how to write good GTests in HotSpot, see [`doc/hotspot-unit-tests.md`](https://github.com/openjdk/jdk/blob/master/doc/hotspot-unit-tests.md).

### Running OpenJDK GTests

When configuring the OpenJDK build you can tell it where your GTest installation is located. Once configured, use make to run GTests.

~~~
sh ./configure --with-gtest=/path/to/gtest
make test TEST=gtest
~~~

You can also use a regular expression to filter which tests to run:

~~~
make test TEST=gtest:code.*:os.*
make test TEST=gtest:$X/$variant
~~~

The second example above runs tests which match the regexp `$X.*` on a specific variant of the JVM. The variant is one of client, server, etc.

## GitHub actions

[GitHub](https://github.com) has a feature called **GitHub actions** (GHA) that can be used to automate testing. The GHA is executed whenever a push is made to a branch in your repository. The bots will show the results of the GHA in your PR when you create or update it. The GHA in the JDK Project is configured to run a set of tests that is commonly known as **tier 1**. This is a relatively fast, small set of tests that tries to verify that your change didn't break the JDK completely. In tier 1 the JDK is built on a small set of platforms including (but not necessarily limited to) Linux, Windows, and MacOS, and a few tests are executed using these builds. There's also a set of other platforms for which GHA does cross-complilation builds.

In addition to the testing you run manually before publishing your changes, it's recommended that you take advantage of this automated testing that the GHA offers. This will for instance allow you to run tests on platforms that you may not otherwise have access to. To enable this on your personal fork of the JDK on [GitHub](https://github.com) go to the "Actions" tab and click the big green button saying "I understand my workflows, go ahead and enable them". If you don't understand these workflows there's a link to the actual file that describes them right below the green button.

In case of failures in the GHA it's always a good start to try to reproduce the failure locally on a machine where you have better control and easier access to a debug environment. There have been cases where the GHA has failed due to issues unrelated to the change being tested, e.g. because the GHA environment was updated and changes were needed to the JDK GHA configuration. The configuration is in general updated fairly quickly, so in cases were you can't reproduce the failure locally, consider re-running the GHA later.

Please keep in mind that the tier 1 tests run by the GHA should only be seen as a smoke test that finds the most critical breakages, like build errors or if the JDK is DOA. These tests can never replace the targeted testing that you always must do on your changes. There are several areas of the JDK that aren't part of tier 1 at all. To see exactly what tier 1 includes, please see the various TEST.groups files that you will find in the subdirectories of [`jdk/test/`](https://github.com/openjdk/jdk/tree/master/test).

::: {.note}
In the past there used to be a sandbox repository that could be used for testing purposes. With the move to Git this has been replaced by GitHub Actions.
:::

## Excluding a test

Sometimes tests break. It could be e.g. due to bugs in the test itself, due to changed functionality in the code that the test is testing, or changes in the environment where the test is executed. While working on a fix, it can be useful to stop the test from being executed in everyone else's testing to reduce noise, especially if the test is expected to fail for more than a day. There are two ways to stop a test from being run in standard test runs: ProblemListing and using the `@ignore` keyword. Removing tests isn't the standard way to remove a failure. A failing test is often a regression and should ideally be handled with high urgency.

Remember to remove the JBS id from the ProblemList or the test when the bug is closed. This is especially easy to forget if a bug is closed as [Duplicate]{.jbs-value} or [Won't Fix]{.jbs-value}. jcheck will report an error and prohibit an integration if a PR is created for an issue that is found in a ProblemList if the fix doesn't remove the bug ID from the ProblemList.

### ProblemListing jtreg tests

ProblemListing should be used for a short term exclusion while a test is being fixed, and for the exclusion of intermittently failing tests that cause too much noise, but can still be useful to run on an ad-hoc basis. ProblemListing is done in the file `ProblemList.txt`. For more details about the `ProblemList.txt` file see the [jtreg FAQ](https://openjdk.org/jtreg/faq.html#what-is-a-problemlist.txt-file).

There are actually several ProblemList files to choose from in the JDK. Their location and name hint about what area or feature each file belongs to. Each file has sections for different components. All ProblemList files complement each other to build the total set of tests to exclude in jtreg runs.

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

Currently there's [no support for multiple lines for the same test](https://bugs.openjdk.org/browse/CODETOOLS-7902481). For this reason it's important to always make sure there's no existing entry for the test before adding a new one, as multiple entries might lead to unexpected results, e.g.

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

A common way to handle the JBS issue used to problemlist a test is to create a [Sub-task]{.jbs-value} of the bug that needs to be fixed to be able to remove the test from the problem list again.

Remember to always add a [problemlist]{.jbs-label} label in the JBS issue referenced in the ProblemList entry. When the issue is fixed, the [problemlist]{.jbs-label} label can be removed from the JBS issue.

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

Due to an issue described in [CODETOOLS-7902712](https://bugs.openjdk.org/browse/CODETOOLS-7902712) tests that contains more than one `@test` must actually use this way to specify all test cases if all of them should be ProblemListed. Specifying just the test name will not work.

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
 */
~~~

In this example, `MyTest.java` is excluded, tracked by bug `JDK-4711`. `@ignore` should generally be placed directly before the first "action" tag (e.g. `@compile`, `@run`) if any in the test.


### Dealing with JBS bugs for test exclusion

ProblemListing and `@ignore`-ing are done in the JDK source tree, that means a check-in into the repository is needed. This in turn means that a unique JBS issue and a code review are needed. This is a good thing since it makes test problems visible.

* **Code review**: ProblemListing a test is considered a [trivial change](#trivial-changes).
* **JBS issue**: A JBS issue is obviously created for the bug that caused the failure, we call this the _main issue_. To exclude the test, create a subtask to the main issue. Also add the label [[problemlist]{.jbs-label}](#problemlist) to the main issue.

The fix for the main issue should remove the test from the ProblemList or remove the `@ignore` keyword from the test.

#### Triage excluded issues

After a failure is handled by excluding a test, the main JBS issue should be re-triaged and possibly given a new priority. This should be handled by the standard triage process. A test exclusion results in an outage in our testing. This outage should be taken into consideration when triaging, in addition to the impact of the bug itself.

## Backing out a change

If a change causes a regression that can't be fixed within reasonable time, the best way to handle the regression can be to back out the change. Backing out means that the inverse (anti-delta) of the change is integrated to effectively undo the change in the repository. Whether to back out a change or not will always be a judgement call. How noisy and frequent are the failures caused by the broken change? How soon can the fix be expected? If you want to avoid having your change backed out, you should make sure to let the relevant developers know that you are working on the fix and give an estimated ETA of the fix.

It will happen of course when the build is broken or the JDK is DOA and similar situations that a change is immediately backed out without further investigation. Backing out a change is however seldom the first course of action if the change has been done in accordance with the guidance in [Working With Pull Requests]. If, when investigated, it is found that a change didn't go through relevant testing or there are other issues that should have been caught before integration if proper procedure had been followed, it's quite possible that a change is backed out even if the author is desperately working on a fix. The JDK source code is deliberately meant to have a high bar for acceptance of changes. If something crawls in underneath that bar it should most likely be backed out.

The backout is a regular change and will have to go through the standard code review process, but is considered a [trivial change](#trivial-changes). The rationale is that a backout is usually urgent in nature and the change itself is automatically generated. In areas where two reviewers are normally required, only one [Reviewer](https://openjdk.org/bylaws#reviewer) is required for a backout since the person who is performing the backout also should review the change.

There are two parts to this task, how to do the bookkeeping in JBS, and how to do the actual backout in git.

### How to work with JBS when a change is backed out

#. Close the original (failed) JBS issue **(O)**.
   * "Verify" the issue with verification [Fix Failed]{.jbs-value}.
#. If the intention is to fix the change and submit it again, create a redo-issue **(R)** to track that the work still needs to be done.
   * Clone **(O)** and add the prefix `[REDO]` on the summary - the clone becomes the redo-issue **(R)**.
   * Make sure relevant information is brought to **(R)**.
   * Remember that comments aren't automatically brought over when cloning.
#. Setup a backout-issue **(B)**.
   * Alternative 1 - the regression is identified directly.
     * Create a new issue of type [Bug]{.jbs-value}. This new issue will be the backout-issue **(B)**.
     * Use the same summary as **(R)** prefixed with `[BACKOUT]`.
     * Add a _relates to_ link between **(B)** and **(O)**.
   * Alternative 2 - an investigation issue was created **(I)**, and during the investigation backing out the change is identified as the best solution.
     * Use the investigation issue **(I)** for the backout. (Don't create a new **(B)**.)
     * Change summary of **(I)** to the same as **(O)** and prefix with `[BACKOUT]`.
     * Add a _relates to_ link between **(I)** and **(O)**.
#. If **(O)** had a CSR request, update the CSR issue as follows:
   * Add a _csr-for_ link from the CSR to **(R)**.
   * Add a note to the CSR that explains the reason for the redo and the impact on the CSR.
   * Move the CSR back into the [Finalized]{.jbs-value} state for re-review. (It's necessary to first move the CSR back to the [Draft]{.jbs-value} state before moving it to the [Finalized]{.jbs-value} state.)

ProblemList entries and `@ignore` keywords will continue to point to the original bug (unless updated at back out). This is accepted since there is a clone link to follow.

### How to work with git when a change is backed out

To backout a change with git, use `git revert`. This will apply (commit) the anti-delta of the change. Then proceed as usual with creating a PR and getting it reviewed.

~~~diff
$ git show aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5
commit aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5 (HEAD -> master)
Author: Jesper Wilhelmsson <jesper.wilhelmsson@oracle.com>
Date:   Wed Jun 23 20:31:32 2021 +0200

    8272373: Make the JDK mine
    Reviewed-by: duke

diff --git a/README.md b/README.md
index 399e7cc311f..4961acb2126 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,4 @@
-# Welcome to the JDK!
+# Welcome to my modified JDK!

 For build instructions please see the
 [online documentation](https://openjdk.org/groups/build/doc/building.html),

$ git revert aa371b4f02c2f809eb9cd3e52aa12b639bed1ef5
[master d454489052d] 8280996: [BACKOUT] Make the JDK mine Reviewed-by: duke
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git show d454489052dc6ff69a21ad9c8f56b67fdeb435ee
commit d454489052dc6ff69a21ad9c8f56b67fdeb435ee (HEAD -> master)
Author: Jesper Wilhelmsson <jesper.wilhelmsson@oracle.com>
Date:   Wed Jun 23 20:32:08 2021 +0200

    8280996: [BACKOUT] Make the JDK mine
    Reviewed-by: duke

diff --git a/README.md b/README.md
index 4961acb2126..399e7cc311f 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,4 @@
-# Welcome to my modified JDK!
+# Welcome to the JDK!

 For build instructions please see the
 [online documentation](https://openjdk.org/groups/build/doc/building.html),
~~~

## Backing out a backport

In rare cases it may be necessary to back out a backport from an update release without backing out the original fix in mainline. This will require a somewhat different procedure and will result in a small mess in JBS. It's extremely important to add comments in all relevant issues explaining exactly what's happened.

The steps to take in order to do this are described below. **(M)** used below refers to the main bug entry - the first fix that was later backported.

#. Close the original (failed) JBS backport issue **(O)**.
   * "Verify" the issue and choose "Fix Failed".
#. If the intention is to fix the backport and submit it again, create a redo-issue **(R)** to track that the work still needs to be done.
   * Clone **(M)** and add the prefix `[REDO BACKPORT]` on the summary - the clone becomes the redo-issue **(R)**.
   * Add a _relates to_ link between **(R)** and **(O)**.
   * Set Fix Version of **(R)** to the target release for the backport - either the exact release if known, or `<N>-pool` if it's not critical which release the fixed backport goes into.
#. Create a backout-issue **(B)**:
   * Alternative 1 - the broken backport is identified directly.
     * Create a sub-task to **(R)** with the same summary, but prefixed with `[BACKOUT BACKPORT]`.
   * Alternative 2 - an investigation issue was created **(I)**, and during the investigation backing out the backport is identified as the best solution.
     * Use the investigation issue **(I)** for the backout.
     * Change summary of **(I)** to the same as **(M)** and prefix with `[BACKOUT BACKPORT]`.
     * Move and change type of **(I)** to become a sub-task of **(R)**.
   * Alternative 3 - no redo issue was created.
     * Create a backout-issue **(B)** with the same summary as **(M)** and prefix with `[BACKOUT BACKPORT]`.
     * Add a _relates to_ link between **(B)** and **(M)**.
#. Add comments to **(M)**, **(R)** and **(O)** explaining the situation.

The end result in JBS should look like this:

::: {style="text-align:center;"}
~~~{.mermaid caption="JBS structure after backout and redo of a backport" format=svg theme=neutral}
flowchart TD
  main("Main issue <b>(M)</b><br>JDK-8272373: Example JBS Issue<br>Issue type: Bug<br>Fix version: 18")
  backport("Initial backport <b>(O)</b><br>JDK-8280986: Example JBS Issue<br>Issue type: Backport<br>Fix version: 15.0.2<br>Verification: Fix failed")
  backout("Backout of JDK-8280986 <b>(B)</b><br>JDK-8280996: [BACKOUT BACKPORT] Example JBS Issue<br>Issue type: Sub-task<br>Fix version: 15.0.2")
  redo("Redo of backport <b>(R)</b><br>JDK-8280989: [REDO BACKPORT] Example JBS Issue<br>Issue type: Bug<br>Fix version: 15.0.2")
  main --> |backported by| backport
  redo --> |clones| main
  backport <--> |relates to| redo
  redo --> |sub-task| backout
~~~
:::

For this example in JBS see the 15.0.2 backport of [JDK-8272373](https://bugs.openjdk.org/browse/JDK-8272373).

### Rationale for using this model

The approach described here has both advantages and disadvantages. The key invariants that lead to this model are:

* A _backported by_ link should only refer to issues of type Backport
* A bug id should never be reused for different patches in the same repository

Disadvantages of this model are that the list of backports in JBS will still list the old (failed) backport as the 15.0.2 backport, and the new backport will not be linked to using a _backported by_ link. It is assumed that the advantages above outweighs the disadvantages and that the capital letter prefixes for the backout and the redo will be visible enough in JBS to alert that something fishy is going on.

::: {.box}
[To the top](#){.boxheader}
:::
