# Testing the JDK

::: {.box}
[Quick Links]{.boxheader}

* [Using the run-test Framework](https://github.com/openjdk/jdk/blob/master/doc/testing.md)
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
                throw new RuntimeException("X.y() gave " + result + ", expexted " + expected_result);
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
