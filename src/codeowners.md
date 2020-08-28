% Code Owners

::: {.NavBit}
[TOC](index.html)
:::

This list is intended to make it easier to identify which email list to include in code reviews when making changes in different areas. The list may also help when assigning bugs based on which code they are found in. Please note that some directories may have been created or removed between releases. The intention here is to include directories that exists in mainline, LTS releases and other releases (post JDK 9) commonly being updated.

## Area mailing lists

* Build: [`build-dev@openjdk.java.net`](mailto:build-dev@openjdk.java.net)
* Client
  * AWT: [`awt-dev@openjdk.java.net`](mailto:awt-dev@openjdk.java.net)
  * Beans: [`beans-dev@openjdk.java.net`](mailto:beans-dev@openjdk.java.net)
  * Java 2D: [`2d-dev@openjdk.java.net`](mailto:2d-dev@openjdk.java.net)
  * Java FX: [`openjfx-dev@openjdk.java.net`](mailto:openjfx-dev@openjdk.java.net)
  * jpackage: [`core-libs-dev@openjdk.java.net`](mailto:core-libs-dev@openjdk.java.net)
  * Sound: [`sound-dev@openjdk.java.net`](mailto:sound-dev@openjdk.java.net)
  * Swing: [`swing-dev@openjdk.java.net`](mailto:swing-dev@openjdk.java.net)
* Core Libs: [`core-libs-dev@openjdk.java.net`](mailto:core-libs-dev@openjdk.java.net)
  * Net: [`net-dev@openjdk.java.net`](mailto:net-dev@openjdk.java.net)
  * NIO: [`nio-dev@openjdk.java.net`](mailto:nio-dev@openjdk.java.net)
* HotSpot: [`hotspot-dev@openjdk.java.net`](mailto:hotspot-dev@openjdk.java.net)
  * Compiler: [`hotspot-compiler-dev@openjdk.java.net`](mailto:hotspot-compiler-dev@openjdk.java.net)
  * GC: [`hotspot-gc-dev@openjdk.java.net`](mailto:hotspot-gc-dev@openjdk.java.net)
  * Runtime: [`hotspot-runtime-dev@openjdk.java.net`](mailto:hotspot-runtime-dev@openjdk.java.net)
  * Serviceability: [`serviceability-dev@openjdk.java.net`](mailto:serviceability-dev@openjdk.java.net)
* I18n: [`i18n-dev@openjdk.java.net`](mailto:i18n-dev@openjdk.java.net)
* Langtools
  * Amber Project: [`amber-dev@openjdk.java.net`](mailto:amber-dev@openjdk.java.net)
  * Javac: [`compiler-dev@openjdk.java.net`](mailto:compiler-dev@openjdk.java.net)
  * Javadoc: [`javadoc-dev@openjdk.java.net`](mailto:javadoc-dev@openjdk.java.net)
  * JShell: [`kulla-dev@openjdk.java.net`](mailto:kulla-dev@openjdk.java.net)
  * Panama Project: [`panama-dev@openjdk.java.net`](mailto:panama-dev@openjdk.java.net)
  * Valhalla Project: [`valhalla-dev@openjdk.java.net`](mailto:valhalla-dev@openjdk.java.net)
* Security: [`security-dev@openjdk.java.net`](mailto:security-dev@openjdk.java.net)

## Directory to area mapping

* `make` – Build team
* `hotspot` – HotSpot
  * `cpu` – Compiler, Runtime
  * `jdk.*` – Compiler
  * `os` – Runtime
  * `os_cpu` – Compiler
  * `share`
    * `adlc` – Compiler
    * `aot` – Compiler
    * `asm` – Runtime
    * `c1` – Compiler
    * `ci` – Compiler
    * `classfile` – Runtime
    * `code` – Compiler
    * `compiler` – Compiler
    * `gc` – GC
    * `include` – HotSpot
    * `interpreter` – Runtime
    * `jfr` – Runtime
    * `jvmci` – Compiler
    * `libadt` – Compiler
    * `logging` – Runtime
    * `memory` – Runtime, GC
    * `metaprogramming` – Runtime
    * `oops` – Runtime
    * `opto` – Compiler
    * `precompiled` – Runtime
    * `prims` – Runtime, Serviceability
    * `runtime` – Runtime
    * `services` – Runtime
    * `shark` – Compiler
    * `trace` – Runtime
    * `utilities` – Runtime
* `java.base`
  * Core Libs should almost always be included but Langtools, HotSpot, and/or Security may also be involved.
  * `classes`
    * `crypto` – Security
    * `internal` – HotSpot, Core Libs
    * `invoke` – Core Libs
    * `io` – NIO
    * `lang` – Core Libs
    * `launcher` – Langtools
    * `math` – Core Libs
    * `net` – Net
    * `nio` – NIO
    * `reflect` – Core Libs
    * `security` – Security
    * `text` – Core Libs
    * `time` – Core Libs
    * `util` – I18n, Core Libs
  * `conf`
    * `sdp` – Net
    * `security` – Security
  * `legal` –
  * `lib/security` – Security
  * `man` –
  * `native`
    * `common` –
    * `include` – Runtime, Core Libs
    * `jspawnhelper` – LangTools
    * `launcher` – Langtools
    * `libfdlibm` –
    * `libjava` – Core Libs
    * `libjimage` – Langtools, Core Libs
    * `libjli` – LangTools
    * `libjsig` – HotSpot
    * `libnet` – Net
    * `libnio` – NIO
    * `libosxsecurity` – Security
    * `libverify` –
    * `libzip` –
* `java.compiler` – LangTools
* `java.datatransfer` – AWT
* `java.desktop` – Client
  * Many files in the awt directories are shared between 2D and AWT
    * See [https://openjdk.java.net/groups/2d/2dawtfiles.html](https://openjdk.java.net/groups/2d/2dawtfiles.html)
    * And see [https://openjdk.java.net/groups/2d](https://openjdk.java.net/groups/2d)
  * `color`, `font`, `freetype`, `geom`, `imageio`, `java2d`, `jpeg`, `lcms`, `mlib`, `print`, Graphics primitives – 2D
  * `splashscreen`, `dnd`, `eawt`, `lwawt` – AWT
  * `im`, InputMethods – I18n, AWT
  * `libjsound`, `sound` – Sound
  * `accessibility`, `laf` – Swing
* `java.instrument` – Serviceability
* `java.logging` – Core Libs
* `java.management` – Serviceability
* `java.management.rmi` – Serviceability
* `java.naming` – Core Libs
* `java.net.http` – Net
* `java.prefs` – Core Libs
* `java.rmi` – Core Libs
* `java.scripting` – LangTools
* `java.se` – Core Libs
* `java.security.jgss` – Security
* `java.security.sasl` – Security
* `java.smartcardio` – Security
* `java.sql` – Core Libs
* `java.sql.rowset` – Core Libs
* `java.transaction.xa` – Core Libs
* `java.xml` – Core Libs
* `java.xml.crypto` – Security
* `jdk.accessibility` – Swing
* `jdk.aot` – HotSpot Compiler
* `jdk.attach` – Serviceability
* `jdk.charsets` – I18n, Core Libs
* `jdk.compiler` – LangTools
* `jdk.crypto.cryptoki` – Security
* `jdk.crypto.ec` – Security
* `jdk.crypto.mscapi` – Security
* `jdk.crypto.ucrypto` – Security
* `jdk.dynalink` – LangTools
* `jdk.editpad` – LangTools
* `jdk.hotspot.agent` – Serviceability
* `jdk.httpserver` – Net
* `jdk.incubator.foreign` – LangTools
* `jdk.incubator.httpclient` – Net
* `jdk.incubator.jpackage` –
* `jdk.internal.ed` – LangTools
* `jdk.internal.jvmstat` – Serviceability
* `jdk.internal.le` – LangTools
* `jdk.internal.opt` – LangTools
* `jdk.internal.vm.ci` – HotSpot Compiler
* `jdk.internal.vm.compiler` – HotSpot Compiler
* `jdk.internal.vm.compiler.management` – HotSpot Compiler
* `jdk.jartool` – LangTools
* `jdk.javadoc` – LangTools
* `jdk.jcmd` – Serviceability
* `jdk.jconsole` – Serviceability
* `jdk.jdeps` – Core Libs
* `jdk.jdi` – Serviceability
* `jdk.jdwp.agent` – Serviceability
* `jdk.jfr` – Runtime
* `jdk.jlink` – LangTools
* `jdk.jshell` – LangTools
* `jdk.jsobject` – LangTools
* `jdk.jstatd` – Serviceability
* `jdk.localedata` – I18n
* `jdk.management` – Serviceability
* `jdk.management.agent` – Serviceability
* `jdk.management.jfr` – Runtime
* `jdk.naming.dns` – Core Libs
* `jdk.naming.rmi` – Core Libs
* `jdk.net` – Net
* `jdk.nio.mapmode` – NIO
* `jdk.pack` – LangTools
* `jdk.rmic` – Core Libs
* `jdk.scripting.nashorn` – LangTools
* `jdk.scripting.nashorn.shell` – LangTools
* `jdk.sctp` – Net
* `jdk.security.auth` – Security
* `jdk.security.jgss` – Security
* `jdk.unsupported` – Core Libs
* `jdk.unsupported.desktop` – Swing
* `jdk.xml.dom` – Core Libs
* `jdk.zipfs` – Core Libs
* `sample` –
* `utils` – 

::: {.NavBit}
[TOC](index.html)
:::
