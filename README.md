# OpenJDK Developers' Guide

This Project maintains the [OpenJDK Developers' Guide](https://openjdk.java.net/guide/). The goal of this guide is to answer questions that developers of the JDK might have around development process, tooling, standards, and so forth. The formal rules and processes are described in other documents, such as [JEP 1](https://openjdk.java.net/jeps/1) for the JDK Enhancement-Proposal & Roadmap Process, and [JEP 3](https://openjdk.java.net/jeps/3) for the JDK Release Process. This guide is meant to be a complement to such documents, with tutorials and examples for how to follow these rules and how to work together with the rest of the OpenJDK Community.

There are many common use cases that aren't detailed in the formal process. This guide suggests how to work in such cases.

## Audience

The target audience for this document is anyone in the OpenJDK Community who aims to contribute to the development of the JDK but is not yet familiar with the process. People who are already regular contributors will already know much of what this guide has to offer. Still, the Developers' Guide should work as a source of knowledge also for experienced contributors. Any descriptions in the Guide should thus be self-contained or have explicit references to any information that the reader is expected to already know. The information should also be structured in such a way that it's easy to find the details for any process, so that a reader who already knows the big picture can quickly find a particular detail that was forgotten.

## Contributing

To engage in the development of the Developers' Guide itself, create a private fork and join the dedicated [guide-dev mail list](https://mail.openjdk.java.net/mailman/listinfo/guide-dev).

### Language in the Developers' Guide

The OpenJDK Developers' Guide is written in American English. The Guide is meant to be an informal document. This is reflected in the language used. For instance, contractions are commonly used.

When choosing what words to use, keep in mind that a large portion of the audience isn't native English speakers. Always try to keep the language easy to understand and avoid niche words and local terminology if possible. That said, the language must also be precise to avoid mixing up different concepts. For instance the git term `push` is only used when talking about pushes to a private clone of a Project repository. When talking about the Project repositories themselves we use the Skara term `integrate` since developers can't push directly to these repositories.

### Keywords and links

All terms defined in the OpenJDK Bylaws are considered keywords, and should be capitalized. Company and organization names are also considered keywords and follow the same rules. A keyword should be linked to the definition of that term if the keyword is referring to the defined term. Additional words that build a noun phrase should be included in the link.

E.g. The word **Project** is defined in the Bylaws, therefore when writing about OpenJDK Projects there should be a link and a capital **P**. However when writing about other projects no link is required and the case of **p** follow normal grammar rules.

To clarify further, a few examples:

* A [Project](https://openjdk.org/bylaws#project) may produce code. --- The word "Project" refers to an OpenJDK Project as defined in the Bylaws.
* Y is an [OpenJDK Project](https://openjdk.org/bylaws#project). --- "OpenJDK Project" is a noun phrase and all of it should be included in the link.
* The Project repository contains code. --- Here "Project repository" refers to the code repository, not the Project, but the Project is still an OpenJDK Project, so it's capitalized but has no link.
* A [GitHub](https://github.com) project is a different thing. --- Not an OpenJDK Project, however GitHub is a keyword and is therefore correctly capitalized and has it's own link. If we were writing about a specific GitHub project then a link to that project would be appropriate.

Section headers do not contain links since this mess with our ability to link to said sections.

### CSS formats

There are styles defined in the file `src/guidestyle.css`. These styles should be used exactly for what they are intended for. No more, no less. Always use the correct style when writing words covered by these styles, never use the styles for anything else. The comments in `guidestyle.css` should be obvious enough to understand what the style should be used for.

## Building the Developers' Guide

The project comes with a `Makefile`. Simply type `make` to generate HTML files from the source Markdown. The build requires the tools `pandoc`, `iconv`, and `perl` and assumes a POSIX environment. We recommend using at least pandoc 2.0.

To generate the diagrams, you also need the `mermaid-filter` for pandoc. You can install this by running `npm install --global mermaid-filter --unsafe-perm=true`.

The resulting HTML files in the `build` directory are exactly the files published on the [OpenJDK web server](https://openjdk.java.net/guide/). There is, however, a larger framework on the web server with fonts and CSS that is not part of this project. This means that the HTML files as they are generated will not look exactly the same as the final published version. Still they are hopefully good enough to proof read changes and see the layout in a browser.
