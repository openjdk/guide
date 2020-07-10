% Webrev Help

So, what is webrev?

`webrev` refers to both the tool and its output. The script,
[`webrev.ksh`](https://hg.openjdk.java.net/code-tools/webrev/raw-file/tip/webrev.ksh),
is maintained in the [Code Tools](../projects/code-tools) Project.
The latest version of the tool may be downloaded from
[https://hg.openjdk.java.net/code-tools/webrev/raw-file/tip/webrev.ksh](https://hg.openjdk.java.net/code-tools/webrev/raw-file/tip/webrev.ksh).

`webrev.ksh` crawls over your changes to generate a
set of web-based views of the differences in your code. The different views
allow reviewers to easily look at your proposed changes, selecting the
appropriate difference format based on the type of file, the type of change,
and their own preferences.

## Examples

`ksh ./webrev.ksh -N -r <REV>`

>    Generate diffs between revision _`<REV>`_ and the `tip`. Output created under the
>    `./webrev/` directory.

`ksh ./webrev.ksh -m -N -c <BUGID>`

>    Force the use of Mercurial to generate diffs between all
>    modified files and the current `tip`. At the top of
>    the main page Include a clickable link to _`<BUGID>`_ in the
>    [OpenJDK Bug System](https://bugs.openjdk.java.net). Output to `./webrev/`.

`ksh WDIR=<OUTDIR> ./webrev.ksh <FILE>`

>    Useful when generating diffs across multiple repositories in
>    the forest, the _`<FILE>`_
>    contains a list of files to diff. Output to alternate location
>    _`<OUTDIR>`_.

`ksh ./webrev.ksh -help`

>    Complete list of options.

## Further information

* [Source repository](https://hg.openjdk.java.net/code-tools/webrev)
* [Mailing list](https://mail.openjdk.java.net/pipermail/webrev-dev/)
