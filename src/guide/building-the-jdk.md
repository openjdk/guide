# Building the JDK

::: {.box}
[Quick Links]{.boxheader}

* [Official build instructions](https://openjdk.org/groups/build/doc/building.html)
* [openjdk/jdk GitHub project](https://github.com/openjdk/jdk)
* [JDK 16 General-Availability Release](https://jdk.java.net/16/)
:::

The JDK build system is a fairly complex machine that has the ability to build anything from a single module to a complete shippable JDK bundle with various levels of debug capabilities, run tests, install your newly built JDK on your system, or cross-compile for some other system. The build uses `make` and a few other tools that you will have to install on your system before starting.

The JDK supports incremental builds. This means that if you have a complete build and make changes in just a single part of the JDK (e.g. a module or part of the JVM), only that particular part needs to be rebuilt. So subsequent builds will be faster and you can always use a make target that results in a complete JDK image without having to worry about actually building the entire JDK every time. Please note that the incremental build do have limits in its understanding of what you change. For instance, if you change behaviors or conventions in one module there may be other parts of the JDK that implicitly depends on these without make's knowledge. For this reason you may have to rebuild several modules, or do a clean build if you change things that may have a wider impact.

The examples below show the steps taken to build the JDK source code. Please see [Cloning the JDK](#cloning-the-jdk) for information on how to download it. These examples were written in the JDK 17 development time frame which is why the boot JDK used here is JDK 16. Note that the download links used here point to JDK 16 bundles. To build JDK N, use JDK N-1 as the boot JDK.

The configure script will tell you what additional packages you need. In this first example several packages were needed since this build was performed on a clean Ubuntu installation. The configure script was run several times to get all the dependencies, but only the commands actually needed to get the JDK built are included in the log. This is just an example log, don't copy the `apt-get install` line. Instead run `sh ./configure` to see what packages you actually need on your system.

    $ wget https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_linux-x64_bin.tar.gz
    $ tar xzf openjdk-16_linux-x64_bin.tar.gz
    $ sudo apt-get install autoconf zip make gcc g++ libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev
    $ cd jdk
    $ sh ./configure --with-boot-jdk=$HOME/jdk-16/
    $ make images

The built JDK can be found in `build/linux-x86_64-server-release/jdk`. The exact path depends on your build platform and selected configuration.

The second example is from a clean (newly installed) Mac running MacOS Big Sur. Please note that in this case there are some steps taken outside of the terminal. First XCode and the XCode command line tools must be installed. It could be that the most recent version of XCode that you get from App Store is too new to have been properly tested with the JDK build. See [the JDK build instructions](https://github.com/openjdk/jdk/blob/master/doc/building.md#apple-xcode) for supported versions and more details in case you need to install an older version of XCode.
In this example [Mac Ports](https://www.macports.org) is used to install `autoconf`. `autoconf` can also be installed using [Homebrew](https://brew.sh) and surely through other sources as well.

    $ curl https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_osx-x64_bin.tar.gz --output openjdk-16.0.1_osx-x64_bin.tar.gz
    $ tar xzf openjdk-16.0.1_osx-x64_bin.tar.gz
    $ sudo port install autoconf
    $ sh ./configure --with-boot-jdk=$HOME/jdk-16.0.1.jdk/Contents/Home
    $ make images

In this case the built JDK can be found in `build/macosx-x86_64-server-release/jdk`.

## Configuration options

The JDK build is extremely configurable. This list only contains the most basic configure options needed to get you started. Use `configure --help` to see a complete list of options.

| Option | What it does   |
|:-------|:-------|
| `--with-boot-jdk` | Tell configure what boot JDK to use to build the Java libraries. |
| `--with-debug-level` | Set the debug level. Available levels are `release`, `fastdebug`, `slowdebug`, `optimized`. |

### Working with multiple configurations

Through the configure flags you will select what configuration of the JDK to build. The name of the output directory for the build depends on this configuration. In the example above the JDK ended up in `linux-x86_64-server-release`. This means that we made a release build of a 64 bit linux x86 version of the server JDK. If we change some of these options the output directory will be affected accordingly.

`--with-debug-level` is one example of a configure option that will change the output directory name. Sometimes it makes sense to have several different configurations in parallel. For example while debugging some code you might want to have both a debug build and a release build to be able to test it properly. The directory naming scheme makes this very easy. Simply configure and build the JDKs you need and they will end up next to each other in the build directory.

In the example above we built a `release` image. To build a debug image as well we can configure with `--with-debug-level=slowdebug`. This will give us a JDK where for instance asserts in the JDK source code are enabled. To select which JDK to work with in later calls to `make` add `CONF=<configuration>`.

    $ sh ./configure --with-boot-jdk=$HOME/jdk-16/ --with-debug-level=slowdebug
    $ make CONF=slowdebug images
    $ ls build/
    linux-x86_64-server-release
    linux-x86_64-server-slowdebug

## Make targets

`make images`, as used in the example above, will build a JDK image which is very close to what you'd get from any JDK provider. There are several other make targets you can use depending on what you're looking for. The table below contains some commonly used make targets.

| Target | What it does |
|:-------|:-------------|
| `exploded-image` | This is the default make target that you'll get if you simply invoke `make`. |
| `image` | Builds a complete JDK image. A good target to use if you want to build a JDK for general usage or if you want to test something closer to the shipping product. This can also be a good target to use if doing something which might have a build aspect to it. |
| `<name>-image` | Build just the image for any of jdk, test, docs, symbols, etc. |
| `reconfigure` | Re-runs the configure script with the same arguments as given the last time. |
| `demos` | Builds the demos which for instance make it easy to test something UI related. |
| `docs` | Builds the javadoc. Note that a number of classes in the javadoc API are generated during the build, so `make docs` might do more than simply invoke `javadoc`, depending on the state of your build. |
| `java.base` | Builds the base module. You can (re)build any module with `make <module>`. |
| `hotspot` | Builds the JVM. Note that the JVM depends on several other parts of the JDK, so `make hotspot` might build more than just the JVM, depending on the state of your build. |
| `clean` | Removes all files generated by make, but not those generated by configure. Useful when doing significant renaming or refactoring which may confuse the incremental build. To clean out a specific module only use `make clean-<module>`. |
| `dist-clean` | Removes all files, including configuration. |

There are many other targets available as well. Use `make help` to find out more.

::: {.box}
[To the top](#){.boxheader}
:::
