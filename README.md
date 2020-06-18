# OpenJDK Developers' Guide

This Project maintains the [OpenJDK Developers' Guide](https://openjdk.java.net/guide/).
The goal of this guide is to answer questions that developers of the JDK might have around
development process, tooling, standards, and so forth. The formal rules and processes are described in
other documents, such as [JEP 1](https://openjdk.java.net/jeps/1) for the JDK Enhancement-Proposal
& Roadmap Process, and [JEP 3](https://openjdk.java.net/jeps/3) for the JDK Release Process.
This guide is meant to be a complement to such documents, with tutorials and examples
for how to follow these rules and how to work together with the rest of the OpenJDK Community.

There are many common use cases that aren't detailed in the formal process. This guide suggests
how to work in such cases.

## Audience

The target audience for this document is anyone in the OpenJDK Community who aims to contribute
to the development of the JDK but is not yet
familiar with the process. People who are already regular contributors will already know much of
what this guide has to offer. Still, the Developers' Guide should work as a source of knowledge also
for experienced contributors. Any descriptions in the Guide should thus be self-contained
or have explicit references to any information thata the reader is expected to already know. The information
should also be structured in such a way that it's easy to find the details for any process, so that
a reader who already knows the big picture can quickly find a particular detail that was forgotten.

## Contributing

To engage in the development of the Developers' Guide itself, create a private fork and join
the dedicated [guide-dev mail list](https://mail.openjdk.java.net/mailman/listinfo/guide-dev).

## Building the Developers' Guide

The project comes with a `Makefile`. Simply type `make` to generate HTML files from the source
Markdown. The build requires the tools `pandoc`, `iconv`, and `perl` and assumes a POSIX environment.
The resulting HTML files in the `build` directory are exactly the files published on the
[OpenJDK web server](https://openjdk.java.net/guide/). There is, however, a larger framework
on the web server with fonts and CSS
that is not part of this project. This means that the HTML files as they are generated
will not look exactly the same as the final published version. Still they are hopefully good
enough to proof read changes and see the layout in a browser.
