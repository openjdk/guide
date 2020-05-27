# OpenJDK Developer's Guide

This Project maintains the [OpenJDK Developers' Guide](https://openjdk.java.net/guide/).
The goal of this guide is to answer questions that the developers of the JDK might have around
development process, tooling, standards, etc. The formal rules and processes are described in
other documents, like [JEP 1](https://openjdk.java.net/jeps/1) for the JDK Enhancement-Proposal
& Roadmap Process, or [JEP 3](https://openjdk.java.net/jeps/3) for the JDK Release Process.
This guide is meant to be a complement with tutorials and examples for how to follow these rules
and how to work together with the rest of the OpenJDK community.

There are many common use cases that aren't detailed in the formal process. This guide contains the
defacto standard for how to work in such cases.

## Audience

The target audience for this document is anyone in the OpenJDK community who aims to contribute
to the development of OpenJDK. The nature of such a document is to target those who are not
familiar with the process. People who are regular contributors would already know much of
what this guide has to offer. Still, the Developers' Guide should work as a source of knowledge also
for experienced contributors. This means that any descriptions in the Guide should be self-contained
or have explicit references to any information the reader is expected to already know. The information
should also be structured in such a way that it's easy to find details for any process, so that
one who already knows the big picture can quickly find that particular detail that was forgotten.

## Contributing

To engage in the development of the Developers' Guide itself, create a private fork and join
the dedicated [guide-dev mail list](https://mail.openjdk.java.net/mailman/listinfo/guide-dev).

## Building the Developers' Guide

The project comes with a makefile. Simply type `make` to generate html files from the source
markdown. The build requires the tools `pandoc`, `ìconv`, and `perl` and assumes a posix environment.
The resulting html files in the `build` directory are exactly the files published on the
OpenJDK web server. There is however a larger framework on the web server with fonts and CSS
that is not part of this project. This means that the html files as they are generated
will not look exactly the same as the final published version. Still they are hopefully good
enough to proof read changes and see the layout in a browser.
