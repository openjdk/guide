# Code Owners

This list is intended to make it easier to identify which email list to include in code reviews when making changes in different areas. The list may also help when assigning bugs based on which code they are found in. Please note that some directories may have been created or removed between releases. The intention here is to include directories that exists in mainline, LTS releases and other releases (post JDK 9) commonly being updated.

## Area mailing lists

* Generic JDK Development: [`jdk-dev`](https://mail.openjdk.org/mailman/listinfo/jdk-dev)

* Build: [`build-dev`](https://mail.openjdk.org/mailman/listinfo/build-dev)
* Client Libs: [`client-libs-dev`](https://mail.openjdk.org/mailman/listinfo/client-libs-dev)
* Core Libs: [`core-libs-dev`](https://mail.openjdk.org/mailman/listinfo/core-libs-dev)
  * Net: [`net-dev`](https://mail.openjdk.org/mailman/listinfo/net-dev)
  * NIO: [`nio-dev`](https://mail.openjdk.org/mailman/listinfo/nio-dev)
  * I18n: [`i18n-dev`](https://mail.openjdk.org/mailman/listinfo/i18n-dev)
* HotSpot: [`hotspot-dev`](https://mail.openjdk.org/mailman/listinfo/hotspot-dev)
  * Compiler: [`hotspot-compiler-dev`](https://mail.openjdk.org/mailman/listinfo/hotspot-compiler-dev)
  * GC: [`hotspot-gc-dev`](https://mail.openjdk.org/mailman/listinfo/hotspot-gc-dev)
  * Runtime: [`hotspot-runtime-dev`](https://mail.openjdk.org/mailman/listinfo/hotspot-runtime-dev)
  * JFR: [`hotspot-jfr-dev`](https://mail.openjdk.org/mailman/listinfo/hotspot-jfr-dev)
  * Serviceability: [`serviceability-dev`](https://mail.openjdk.org/mailman/listinfo/serviceability-dev)
* Javac: [`compiler-dev`](https://mail.openjdk.org/mailman/listinfo/compiler-dev)
* Security: [`security-dev`](https://mail.openjdk.org/mailman/listinfo/security-dev)
* Tools
  * Javadoc: [`javadoc-dev`](https://mail.openjdk.org/mailman/listinfo/javadoc-dev)
  * JShell: [`kulla-dev`](https://mail.openjdk.org/mailman/listinfo/kulla-dev)
  * Nashorn: [`nashorn-dev`](https://mail.openjdk.org/mailman/listinfo/nashorn-dev)

## Directory to area mapping

* `.jcheck` – Build
* `bin` – Build
* `doc` –
* `make` – Build
* `src`
  * `demo` – Client Libs
  * `hotspot`
    * `cpu` – Compiler, Runtime
    * `os` – Runtime
    * `os_cpu` – Compiler
    * `share`
      * `adlc` – Compiler
      * `asm` – Runtime
      * `c1` – Compiler
      * `cds` – Runtime
      * `ci` – Compiler
      * `classfile` – Runtime
      * `code` – Compiler
      * `compiler` – Compiler
      * `gc` – GC
      * `include` – HotSpot
      * `interpreter` – Runtime
      * `jfr` – JFR
      * `jvmci` – Compiler
      * `libadt` – Compiler
      * `logging` – Runtime
      * `memory` – Runtime, GC
      * `metaprogramming` – HotSpot
      * `oops` – GC, Runtime
      * `opto` – Compiler
      * `precompiled` – HotSpot
      * `prims` – Runtime, Serviceability
      * `runtime` – Runtime
      * `services` – Runtime
      * `utilities` – GC, Runtime
  * `java.base`
    * Core Libs should almost always be included but Java Language, HotSpot, Security and/or I18n may also be involved.
    * `*/classes`
      * `*/crypto` – Security
      * `*/foreign` – Core Libs
      * `*/invoke` – Core Libs
      * `*/io` – NIO
      * `*/jmod` – HotSpot
      * `*/lang` – Core Libs
      * `*/math` – Core Libs
      * `*/misc` – Core Libs, HotSpot
      * `*/module` – Core Libs
      * `*/net` – Net
      * `*/nio` – NIO
      * `*/ref` – Core Libs, GC
      * `*/reflect` – Core Libs
      * `*/security` – Security
      * `*/text` – I18n
      * `*/time` – Core Libs
      * `*/util` – I18n, Core Libs
      * `jdk/internal`
        * `access` – Core Libs, Security
        * `event` – JFR
        * `icu` – Core Libs
        * `javac` – Java Language
        * `jimage` – Client Libs
        * `jrtfs` – Core Libs
        * `loader` – Core Libs
        * `logger` – Core Libs
        * `org` – Core Libs
        * `perf` – Runtime
        * `platform` – HotSpot
        * `vm` – HotSpot
      * `sun/launcher` – Generic List
      * `META-INF` – Core Libs
    * `*/conf`
      * `sdp` – Net
      * `security` – Security
    * `*/legal` –
    * `*/lib/security` – Security
    * `*/native`
      * `common` –
      * `include` – Runtime, Core Libs
      * `jspawnhelper` – Generic List
      * `launcher` – Generic List
      * `libjava` – Core Libs
      * `libjimage` – Core Libs
      * `libjli` – Generic List
      * `libjsig` – HotSpot
      * `libnet` – Net
      * `libnio` – NIO
      * `libosxsecurity` – Security
      * `libsyslookup` – Core Libs
      * `libverify` – Runtime
      * `libzip` – Core Libs
    * `share/data`
      * `blockedcertsconverter` – Security
      * `cacerts` – Security
      * `currency` – I18n
      * `lsrdata` – I18n
      * `publicsuffixlist` – Client Libs
      * `tzdata` – I18n
      * `unicodedata` – I18n
    * `share/man`
      * `java.1` – Generic List
      * `keytool.1` – Security
  * `java.compiler` – Javac
  * `java.datatransfer` – Client Libs
  * `java.desktop` – Client Libs
  * `java.instrument` – Serviceability
  * `java.logging` – Core Libs
  * `java.management` – Serviceability
  * `java.management.rmi` – Serviceability
  * `java.naming` – Core Libs
  * `java.net.http` – Net
  * `java.prefs` – Core Libs
  * `java.rmi` – Core Libs
  * `java.scripting` – Generic List
  * `java.se` – Core Libs
  * `java.security.jgss` – Security
  * `java.security.sasl` – Security
  * `java.smartcardio` – Security
  * `java.sql` – Core Libs
  * `java.sql.rowset` – Core Libs
  * `java.transaction.xa` – Core Libs
  * `java.xml` – Core Libs
  * `java.xml.crypto` – Security
  * `jdk.accessibility` – Client Libs
  * `jdk.attach` – Serviceability
  * `jdk.charsets` – I18n, Core Libs
  * `jdk.compiler` – Javac
  * `jdk.crypto.cryptoki` – Security
  * `jdk.crypto.ec` – Security
  * `jdk.crypto.mscapi` – Security
  * `jdk.dynalink` – Nashorn
  * `jdk.editpad` – JShell
  * `jdk.hotspot.agent` – Serviceability
  * `jdk.httpserver` – Net
  * `jdk.incubator.concurrent` – Core Libs
  * `jdk.incubator.vector` – Compiler
  * `jdk.internal.ed` – JShell
  * `jdk.internal.jvmstat` – Serviceability
  * `jdk.internal.le` – JShell
  * `jdk.internal.opt` – Generic List
  * `jdk.internal.vm.ci` – Compiler
  * `jdk.internal.vm.compiler` – Compiler
  * `jdk.internal.vm.compiler.management` – Compiler
  * `jdk.jartool` – Generic List, Security
  * `jdk.javadoc` – Javadoc
  * `jdk.jcmd` – Serviceability
  * `jdk.jconsole` – Serviceability
  * `jdk.jdeps` – Core Libs
  * `jdk.jdi` – Serviceability
  * `jdk.jdwp.agent` – Serviceability
  * `jdk.jfr` – JFR
  * `jdk.jlink` – Generic List
  * `jdk.jpackage` – Core Libs
  * `jdk.jshell` – JShell
  * `jdk.jsobject` – Nashorn
  * `jdk.jstatd` – Serviceability
  * `jdk.localedata` – I18n
  * `jdk.management` – Serviceability
  * `jdk.management.agent` – Serviceability
  * `jdk.management.jfr` – Runtime
  * `jdk.naming.dns` – Core Libs
  * `jdk.naming.rmi` – Core Libs
  * `jdk.net` – Net
  * `jdk.nio.mapmode` – NIO
  * `jdk.random` – Core Libs
  * `jdk.sctp` – Net
  * `jdk.security.auth` – Security
  * `jdk.security.jgss` – Security
  * `jdk.unsupported` – Core Libs
  * `jdk.unsupported.desktop` – Client Libs
  * `jdk.xml.dom` – Core Libs
  * `jdk.zipfs` – Core Libs
  * `utils` –
* `test`
  * The test directories follow to a large part the same structure as the source code in `src`. The owners are the same for directories with the same names.

### Directories removed
* hotspot
  * `*.jdk` – Compiler (Removed in [10](https://bugs.openjdk.org/browse/JDK-8187443))
  * share
    * `aot` – Compiler (Removed in [17](https://bugs.openjdk.org/browse/JDK-8263327))
    * `shark` – Compiler (Removed in [10](https://bugs.openjdk.org/browse/JDK-8171853))
    * `trace` – Runtime (Removed in [11](https://bugs.openjdk.org/browse/JDK-8199712))
* java.base
  * man
    * `jfr.1` – Runtime (Removed in [16](https://bugs.openjdk.org/browse/JBS-8252113))
* `jdk.aot` – Compiler (Removed in [17](https://bugs.openjdk.org/browse/JDK-8263327))
* `jdk.crypto.ucrypto` – (Removed in [12](https://bugs.openjdk.org/browse/JDK-8241787))
  * only available on Solaris
* `jdk.pack` – Generic List (Removed in [14](https://bugs.openjdk.org/browse/JDK-8234596))
* `jdk.rmic` – Core Libs (Removed in [15](https://bugs.openjdk.org/browse/JDK-8225319))
* `jdk.scripting.nashorn` – Nashorn (Removed in [15](https://bugs.openjdk.org/browse/JDK-8236933))
* `jdk.scripting.nashorn.shell` – Nashorn (Removed in [15](https://bugs.openjdk.org/browse/JDK-8236933))

::: {.box}
[To the top](#){.boxheader}
:::
