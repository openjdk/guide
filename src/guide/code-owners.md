# Code Owners

This list is intended to make it easier to identify which email list to include in code reviews when making changes in different areas. The list may also help when assigning bugs based on which code they are found in. Please note that some directories may have been created or removed between releases. The intention here is to include directories that exists in mainline, LTS releases and other releases (post JDK 9) commonly being updated.

## Area mailing lists

* Build: [`build-dev@openjdk.org`](mailto:build-dev@openjdk.org)
* Client
  * AWT: [`awt-dev@openjdk.org`](mailto:awt-dev@openjdk.org)
  * Beans: [`beans-dev@openjdk.org`](mailto:beans-dev@openjdk.org)
  * Java 2D: [`2d-dev@openjdk.org`](mailto:2d-dev@openjdk.org)
  * Java FX: [`openjfx-dev@openjdk.org`](mailto:openjfx-dev@openjdk.org)
  * jpackage: [`core-libs-dev@openjdk.org`](mailto:core-libs-dev@openjdk.org)
  * Sound: [`sound-dev@openjdk.org`](mailto:sound-dev@openjdk.org)
  * Swing: [`swing-dev@openjdk.org`](mailto:swing-dev@openjdk.org)
* Core Libs: [`core-libs-dev@openjdk.org`](mailto:core-libs-dev@openjdk.org)
  * Net: [`net-dev@openjdk.org`](mailto:net-dev@openjdk.org)
  * NIO: [`nio-dev@openjdk.org`](mailto:nio-dev@openjdk.org)
* HotSpot: [`hotspot-dev@openjdk.org`](mailto:hotspot-dev@openjdk.org)
  * Compiler: [`hotspot-compiler-dev@openjdk.org`](mailto:hotspot-compiler-dev@openjdk.org)
  * GC: [`hotspot-gc-dev@openjdk.org`](mailto:hotspot-gc-dev@openjdk.org)
  * Runtime: [`hotspot-runtime-dev@openjdk.org`](mailto:hotspot-runtime-dev@openjdk.org)
  * JFR: [`hotspot-jfr-dev@openjdk.org`](mailto:hotspot-jfr-dev@openjdk.org)
  * Serviceability: [`serviceability-dev@openjdk.org`](mailto:serviceability-dev@openjdk.org)
* I18n: [`i18n-dev@openjdk.org`](mailto:i18n-dev@openjdk.org)
* LangTools
  * Amber Project: [`amber-dev@openjdk.org`](mailto:amber-dev@openjdk.org)
  * Javac: [`compiler-dev@openjdk.org`](mailto:compiler-dev@openjdk.org)
  * Javadoc: [`javadoc-dev@openjdk.org`](mailto:javadoc-dev@openjdk.org)
  * JShell: [`kulla-dev@openjdk.org`](mailto:kulla-dev@openjdk.org)
  * Panama Project: [`panama-dev@openjdk.org`](mailto:panama-dev@openjdk.org)
  * Valhalla Project: [`valhalla-dev@openjdk.org`](mailto:valhalla-dev@openjdk.org)
* Security: [`security-dev@openjdk.org`](mailto:security-dev@openjdk.org)

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
    * `jfr` – JFR
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
  * Core Libs should almost always be included but LangTools, HotSpot, Security and/or I18n may also be involved.
  * `classes`
    * `crypto` – Security
    * `internal` – HotSpot, Core Libs
    * `invoke` – Core Libs
    * `io` – NIO
    * `lang` – Core Libs
    * `launcher` – LangTools
    * `math` – Core Libs
    * `net` – Net
    * `nio` – NIO
    * `reflect` – Core Libs
    * `security` – Security
    * `text` – I18n
    * `time` – Core Libs
    * `util` – I18n, Core Libs
  * `conf`
    * `sdp` – Net
    * `security` – Security
  * `legal` –
  * `lib/security` – Security
  * `man`
    * `java.1` - LangTools
    * `jfr.1` - Runtime
    * `keytool.1` - Security
  * `native`
    * `common` –
    * `include` – Runtime, Core Libs
    * `jspawnhelper` – LangTools
    * `launcher` – LangToolsopenjdk.org
    * `libfdlibm` – Core Libs
    * `libjava` – Core Libs
    * `libjimage` – LangTools, Core Libs
    * `libjli` – LangTools
    * `libjsig` – HotSpot
    * `libnet` – Net
    * `libnio` – NIO
    * `libosxsecurity` – Security
    * `libverify` – LangTools
    * `libzip` – Core Libs
* `java.compiler` – LangTools
* `java.datatransfer` – AWT
* `java.desktop` – Client
  * Many files in the awt directories are shared between 2D and AWT
    * See [https://openjdk.org/groups/2d/2dawtfiles.html](https://openjdk.org/groups/2d/2dawtfiles.html)
    * And see [https://openjdk.org/groups/2d](https://openjdk.org/groups/2d)
  * `color`, `font`, `freetype`, `geom`, `imageio`, `java2d`, `jpeg`, `lcms`, `mlib`, `print`, graphics primitives – 2D
  * `splashscreen`, `dnd`, `eawt`, `lwawt` – AWT
  * `im`, input methods – I18n, AWT
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
* `jdk.incubator.jpackage` – Client
* `jdk.incubator.vector` – HotSpot Compiler
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
* `jdk.jfr` – JFR
* `jdk.jlink` – LangTools
* `jdk.jpackage` – Client
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

::: {.box}
[To the top](#){.boxheader}
:::
