# HotSpot Development

## Logging

::: {.box}
[Quick Links]{.boxheader}

* [JEP 158: Unified JVM Logging](https://openjdk.java.net/jeps/158)
:::

While developing your fix, your might want your code to output some diagnostic information. You might even want to leave some logging in the code you check in, to facilitate future diagnostics.

The appropriate way to print logging output from HotSpot is through the [Unified Logging Framework (JEP 158)](https://openjdk.java.net/jeps/158). It gives you a lot of nice features and enables common command-line options for all logging. Messages can also be "decorated" with e.g. uptime, level, tags. The JEP contains a thorough description of the feature, but a quick example might look like:

~~~c++
log_info(gc, marking)("Mark Stack Usage: " SIZE_FORMAT "M", _mark_stack_usage / M);
~~~

Where 'gc' and 'marking' are tags, and 'info' is the log level. This would be visible if the JVM were run with any of the following flags:

~~~c++
-Xlog:gc+marking=info
-Xlog:gc+marking
-Xlog:gc*
~~~

The API should be similar to:

~~~c++
log_<level>(Tag1[,...])(fmtstr, ...)
~~~

At the time of writing, the different log levels can be found in [src/hotspot/share/logging/log.hpp](https://github.com/openjdk/jdk/blob/master/src/hotspot/share/logging/log.hpp).

::: {.box}
[To the top](#){.boxheader}
:::
