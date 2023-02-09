# HotSpot Development

## Logging

::: {.box}
[Quick Links]{.boxheader}

* [JEP 158: Unified JVM Logging](https://openjdk.org/jeps/158)
:::

While developing your fix, you might want your code to output some diagnostic information. You might even want to leave some logging in the code you check in, to facilitate future diagnostics. The appropriate way to print logging output from HotSpot is through the [Unified Logging Framework (JEP 158)](https://openjdk.org/jeps/158). It gives you a lot of nice features and enables common command-line options for all logging.

A basic log message can be output like this:

~~~c++
log_info(gc, marking)("Mark Stack Usage: " SIZE_FORMAT "M", _mark_stack_usage / M);
~~~

Where 'gc' and 'marking' are tags, and 'info' is the log level. Tags associate log messages with certain subsystems or features and the log level determines the importance and verbosity of the message. The most verbose output is trace, and the least is error. The full list of tags is available [here](https://github.com/openjdk/jdk/blob/master/src/hotspot/share/logging/logTag.hpp) and the full list of levels [here](https://github.com/openjdk/jdk/blob/master/src/hotspot/share/logging/logLevel.hpp).

The basic log API looks as follows:

~~~c++
log_<level>(Tag1[,...])(fmtstr, ...)
~~~

Sometimes single line printf-style logging isn't enough. For example, it can be useful to group several log lines together or to use HotSpot's outputstream API. UL supports both of these use cases using `LogMessage` and `LogStream`, respectively.

~~~c++
LogMessage(gc, marking) lm;
if (lm.is_info()) {
  lm.info("We are guaranteed to be");
  lm.info(" grouped together");
}
~~~

`LogMessage` will submit its output when it goes out of scope.

`LogStream` is typically used when a single printf-style format string becomes unwieldy.

~~~c++
LogStream st(Log(gc, marking)::info());
if (st.is_enabled()) {
  // Print without newline
  st.print("I'm printing a lot of %s ", "arguments");
  st.print("With a lot of extra info %d ", 3);
  // Print with newline (cr stands for carriage return)
  st.print_cr("and so it's useful to use a stream");
}
~~~

If you need to print multiple lines grouped together with complex formatting requirements then `NonInterleavingLogStream` is probably what you want.

~~~c++
LogMessage(gc) lm;
NonInterleavingLogStream st{LogLevelType::Info, lm};
if (st.is_enabled()) {
  st.print_cr("Line one: %d %d %d ", 1, 2, 3);
  st.print("Line two: %d %d %d", 4, 5, 6);
  st.print_cr(" still line two: %d %d %d", 7, 8, 9);
}
~~~

### Enabling logging

You enable logging in the JVM by using the `-Xlog` command line option specified. For example, the messages from the examples would be visible if the JVM were run with any of the following options:

~~~
-Xlog:gc+marking=info
-Xlog:gc+marking
-Xlog:gc*
~~~

You can have multiple `-Xlog` options, these are applied in an additive manner. Consider this example:

~~~
-Xlog:gc+marking=info:stdout -Xlog:alloc=warning:stderr -Xlog:breakpoint=error:breakpoint.txt:level
~~~

This specifies that:

1. Log messages with info level and up, with tags gc and marking, to stdout.
2. Log messages with warning level and up, with tag alloc, to stderr.
3. Log messages with error level and up, with tag breakpoint, to file breakpoint.txt, with the decorator level.

UL automatically applies a default argument of `-Xlog:all=warning:stdout:uptime,level,tags` when logging is enabled. This can be disabled by prepending `-Xlog:disable` to your arguments.

~~~
-Xlog:disable -Xlog:gc+marking=info -Xlog:alloc=warning
~~~

Starting the JVM with the option `-Xlog:help` outputs more information and more examples.

A full description of the syntax of `-Xlog` is available in [JEP 158](https://openjdk.java.net/jeps/158).

::: {.box}
[To the top](#){.boxheader}
:::
