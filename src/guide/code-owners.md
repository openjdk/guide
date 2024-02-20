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
* Java Language (javac): [`compiler-dev`](https://mail.openjdk.org/mailman/listinfo/compiler-dev)
* Security: [`security-dev`](https://mail.openjdk.org/mailman/listinfo/security-dev)
* Tools
  * Javadoc: [`javadoc-dev`](https://mail.openjdk.org/mailman/listinfo/javadoc-dev)
  * JShell: [`kulla-dev`](https://mail.openjdk.org/mailman/listinfo/kulla-dev)
  * Nashorn: [`nashorn-dev`](https://mail.openjdk.org/mailman/listinfo/nashorn-dev)

## Directory to area mapping

* [.jcheck](https://github.com/openjdk/jdk/tree/master/src/.jcheck) – Build
* [bin](https://github.com/openjdk/jdk/tree/master/src/bin) – Build
* [demo](https://github.com/openjdk/jdk/tree/master/src/demo) – Client Libs
* [doc](https://github.com/openjdk/jdk/tree/master/src/doc) –
* [hotspot](https://github.com/openjdk/jdk/tree/master/src/hotspot)
  * [cpu](https://github.com/openjdk/jdk/tree/master/src/hotspot/cpu) – Compiler, Runtime
  * [os](https://github.com/openjdk/jdk/tree/master/src/hotspot/os) – Runtime
  * [os_cpu](https://github.com/openjdk/jdk/tree/master/src/hotspot/os_cpu) – Compiler
  * [share](https://github.com/openjdk/jdk/tree/master/src/hotspot/share)
    * [adlc](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/adlc) – Compiler
    * [asm](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/asm) – Runtime
    * [c1](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/c1) – Compiler
    * [cds](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/cds) – Runtime
    * [ci](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/ci) – Compiler
    * [classfile](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/classfile) – Runtime
    * [code](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/code) – Compiler
    * [compiler](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/compiler) – Compiler
    * [gc](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/gc) – GC
    * [include](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/include) – HotSpot
    * [interpreter](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/interpreter) – Runtime
    * [jfr](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/jfr) – JFR
    * [jvmci](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/jvmci) – Compiler
    * [libadt](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/libadt) – Compiler
    * [logging](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/logging) – Runtime
    * [memory](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/memory) – Runtime, GC
    * [metaprogramming](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/metaprogramming) – HotSpot
    * [oops](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/oops) – GC, Runtime
    * [opto](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/opto) – Compiler
    * [precompiled](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/precompiled) – HotSpot
    * [prims](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/prims) – Runtime, Serviceability
    * [runtime](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/runtime) – Runtime
    * [services](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/services) – Runtime
    * [utilities](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/utilities) – GC, Runtime
* [java.base](https://github.com/openjdk/jdk/tree/master/src/java.base)
  * Core Libs should almost always be included but Java Language, HotSpot, Security and/or I18n may also be involved.
  * [aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix)/[classes](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/classes) [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux)/[classes](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/classes) [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx)/[classes](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes) [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share)/[classes](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes) [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix)/[classes](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes) [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows)/[classes](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes)
    * [com](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com)/[sun](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun)/[crypto](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun/crypto)/[provider](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun/crypto/provider) – Security
    * [com](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com)/[sun](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun)/[security](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun/security)/[ntlm](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun/security/ntlm) – Security
    * [crypto](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/javax/crypto) – Security
    * [internal](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal,/java.base/share/classes/jdk/internal,/java.base/linux/classes/jdk/internal,/java.base/windows/classes/jdk/internal,/java.base/macosx/classes/jdk/internal)
      * [access](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/access) – Core Libs, Security
      * [event](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/event) – JFR
      * [foreign](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/foreign) – Core Libs
      * [icu](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/icu) – Core Libs
      * [io](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/io) – NIO
      * [javac](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/javac) – Java Language
      * [jimage](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/jimage) – Client Libs
      * [jmod](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/jmod) – HotSpot
      * [jrtfs](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/jrtfs) – Core Libs
      * [loader](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal/loader,/java.base/share/classes/jdk/internal/loader,/java.base/windows/classes/jdk/internal/loader,/java.base/macosx/classes/jdk/internal/loader) – Core Libs
      * [logger](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/logger) – Core Libs
      * [math](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/math) – Core Libs
      * [misc](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal/misc,/java.base/share/classes/jdk/internal/misc,/java.base/windows/classes/jdk/internal/misc) – Core Libs, HotSpot
      * [module](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/module) – Core Libs
      * [org/objectweb](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/org/objectweb) – Core Libs
      * [org/xml](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/org/xml) – Core Libs
      * [perf](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/perf) – Runtime
      * [platform](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal/platform,/java.base/share/classes/jdk/internal/platform,/java.base/linux/classes/jdk/internal/platform,/java.base/windows/classes/jdk/internal/platform) – HotSpot
      * [ref](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/ref) – Core Libs, GC
      * [reflect](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/reflect) – Core Libs
      * [util/random](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/util/random) – Core Libs
      * [util/regex](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/util/regex) – Core Libs
      * [util/xml](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/util/xml) – Core Libs
      * [vm](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/vm) – HotSpot
    * [invoke](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/invoke) – Core Libs
    * [io](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java/io,/java.base/share/classes/java/io,/java.base/windows/classes/java/io,/java.base/windows/classes/sun/io) – NIO
    * [java](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java,/java.base/share/classes/java,/java.base/windows/classes/java,/java.base/macosx/classes/java)
      * [lang](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java/lang,/java.base/share/classes/java/lang,/java.base/windows/classes/java/lang) – Core Libs
      * [math](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/math) Core Libs
      * [time](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/time) Core Libs
    * [launcher](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/launcher) Tools
    * [META-INF/services](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/META-INF/services) Core Libs
    * [net](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java/net,/java.base/unix/classes/sun/net,/java.base/share/classes/javax/net,/java.base/share/classes/java/net,/java.base/share/classes/sun/net,/java.base/windows/classes/java/net,/java.base/windows/classes/sun/net,/java.base/macosx/classes/java/net) Net
    * [nio](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/sun/nio,/java.base/aix/classes/sun/nio,/java.base/share/classes/java/nio,/java.base/share/classes/sun/nio,/java.base/linux/classes/sun/nio,/java.base/windows/classes/sun/nio,/java.base/macosx/classes/sun/nio) NIO
    * [reflect](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/reflect) Core Libs
    * [security](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/sun/security,/java.base/share/classes/javax/security,/java.base/share/classes/java/security,/java.base/share/classes/sun/security,/java.base/windows/classes/sun/security,/java.base/macosx/classes/apple/security) Security
    * [text](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/text,/java.base/share/classes/sun/text) I18n
    * [util](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/util,/java.base/share/classes/sun/util,/java.base/windows/classes/sun/util,/java.base/macosx/classes/sun/util) I18n, Core Libs
  * [conf](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/conf,/java.base/aix/conf,/java.base/share/conf,/java.base/windows/conf)
    * [sdp](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/conf/sdp) Net
    * [security](https://github.com/openjdk/jdk/tree/master/src/java.base/share/conf/security) Security
  * [legal](https://github.com/openjdk/jdk/tree/master/src/java.base/share/legal,/java.base/windows/legal)
  * [lib/security](https://github.com/openjdk/jdk/tree/master/src/java.base/share/lib/security,/java.base/windows/lib/security) Security
  * [man](https://github.com/openjdk/jdk/tree/master/src/java.base/share/man)
    * [java.1](https://github.com/openjdk/jdk/tree/master/src/src/java.base/share/man/java.1) Tools, HotSpot
    * [keytool.1](https://github.com/openjdk/jdk/tree/master/src/src/java.base/share/man/keytool.1) Security
  * [native](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native,/java.base/aix/native,/java.base/share/native,/java.base/linux/native,/java.base/windows/native,/java.base/macosx/native)
    * [common](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/common)
    * [include](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/include,/java.base/share/native/include,/java.base/windows/native/include) Runtime, Core Libs
    * [jspawnhelper](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/jspawnhelper) Tools
    * [launcher](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/launcher,/java.base/share/native/launcher,/java.base/windows/native/launcher) Tools
    * [libjava](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjava,/java.base/aix/native/libjava,/java.base/share/native/libjava,/java.base/linux/native/libjava,/java.base/windows/native/libjava,/java.base/macosx/native/libjava) Core Libs
    * [libjimage](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjimage,/java.base/share/native/libjimage,/java.base/windows/native/libjimage) Core Libs
    * [libjli](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjli,/java.base/aix/native/libjli,/java.base/share/native/libjli,/java.base/windows/native/libjli,/java.base/macosx/native/libjli) Tools
    * [libjsig](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjsig) HotSpot
    * [libnet](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libnet,/java.base/share/native/libnet,/java.base/windows/native/libnet,/java.base/macosx/native/libnet) Net
    * [libnio](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libnio,/java.base/aix/native/libnio,/java.base/share/native/libnio,/java.base/linux/native/libnio,/java.base/windows/native/libnio,/java.base/macosx/native/libnio) NIO
    * [libosxsecurity](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native/libosxsecurity) Security
    * [libsyslookup](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/native/libsyslookup,/java.base/share/native/libsyslookup,/java.base/windows/native/libsyslookup) Core Libs
    * [libverify](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libverify) Runtime
    * [libzip](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libzip) Core Libs
  * [share/data](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data)
    * [blockedcertsconverter](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/blockedcertsconverter) Security
    * [cacerts](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/cacerts) Security
    * [currency](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/currency) I18n
    * [lsrdata](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/lsrdata) I18n
    * [publicsuffixlist](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/publicsuffixlist) Client Libs
    * [tzdata](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/tzdata) I18n
    * [unicodedata](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/unicodedata) I18n
* [java.compiler](https://github.com/openjdk/jdk/tree/master/src/java.compiler) Javac
* [java.datatransfer](https://github.com/openjdk/jdk/tree/master/src/java.datatransfer) Client Libs
* [java.desktop](https://github.com/openjdk/jdk/tree/master/src/java.desktop) Client Libs
* [java.instrument](https://github.com/openjdk/jdk/tree/master/src/java.instrument) Serviceability
* [java.logging](https://github.com/openjdk/jdk/tree/master/src/java.logging) Core Libs
* [java.management](https://github.com/openjdk/jdk/tree/master/src/java.management) Serviceability
* [java.management.rmi](https://github.com/openjdk/jdk/tree/master/src/java.management.rmi) Serviceability
* [java.naming](https://github.com/openjdk/jdk/tree/master/src/java.naming) Core Libs
* [java.net.http](https://github.com/openjdk/jdk/tree/master/src/java.net.http) Net
* [java.prefs](https://github.com/openjdk/jdk/tree/master/src/java.prefs) Core Libs
* [java.rmi](https://github.com/openjdk/jdk/tree/master/src/java.rmi) Core Libs
* [java.scripting](https://github.com/openjdk/jdk/tree/master/src/java.scripting) Tools
* [java.se](https://github.com/openjdk/jdk/tree/master/src/java.se) Core Libs
* [java.security.jgss](https://github.com/openjdk/jdk/tree/master/src/java.security.jgss) Security
* [java.security.sasl](https://github.com/openjdk/jdk/tree/master/src/java.security.sasl) Security
* [java.smartcardio](https://github.com/openjdk/jdk/tree/master/src/java.smartcardio) Security
* [java.sql](https://github.com/openjdk/jdk/tree/master/src/java.sql) Core Libs
* [java.sql.rowset](https://github.com/openjdk/jdk/tree/master/src/java.sql.rowset) Core Libs
* [java.transaction.xa](https://github.com/openjdk/jdk/tree/master/src/java.transaction.xa) Core Libs
* [java.xml](https://github.com/openjdk/jdk/tree/master/src/java.xml) Core Libs
* [java.xml.crypto](https://github.com/openjdk/jdk/tree/master/src/java.xml.crypto) Security
* [jdk.accessibility](https://github.com/openjdk/jdk/tree/master/src/jdk.accessibility) Client Libs
* [jdk.attach](https://github.com/openjdk/jdk/tree/master/src/jdk.attach) Serviceability
* [jdk.charsets](https://github.com/openjdk/jdk/tree/master/src/jdk.charsets) I18n, Core Libs
* [jdk.compiler](https://github.com/openjdk/jdk/tree/master/src/jdk.compiler) Javac
* [jdk.crypto.cryptoki](https://github.com/openjdk/jdk/tree/master/src/jdk.crypto.cryptoki) Security
* [jdk.crypto.ec](https://github.com/openjdk/jdk/tree/master/src/jdk.crypto.ec) Security
* [jdk.crypto.mscapi](https://github.com/openjdk/jdk/tree/master/src/jdk.crypto.mscapi) Security
* [jdk.dynalink](https://github.com/openjdk/jdk/tree/master/src/jdk.dynalink) Tools
* [jdk.editpad](https://github.com/openjdk/jdk/tree/master/src/jdk.editpad) JShell
* [jdk.hotspot.agent](https://github.com/openjdk/jdk/tree/master/src/jdk.hotspot.agent) Serviceability
* [jdk.httpserver](https://github.com/openjdk/jdk/tree/master/src/jdk.httpserver) Net
* [jdk.incubator.vector](https://github.com/openjdk/jdk/tree/master/src/jdk.incubator.vector) Compiler
* [jdk.internal.ed](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.ed) JShell
* [jdk.internal.jvmstat](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.jvmstat) Serviceability
* [jdk.internal.le](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.le) JShell
* [jdk.internal.opt](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.opt) Tools
* [jdk.internal.vm.ci](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.vm.ci) Compiler
* [jdk.jartool](https://github.com/openjdk/jdk/tree/master/src/jdk.jartool) Tools
* [jdk.javadoc](https://github.com/openjdk/jdk/tree/master/src/jdk.javadoc) Javadoc
* [jdk.jcmd](https://github.com/openjdk/jdk/tree/master/src/jdk.jcmd) Serviceability
* [jdk.jconsole](https://github.com/openjdk/jdk/tree/master/src/jdk.jconsole) Serviceability
* [jdk.jdeps](https://github.com/openjdk/jdk/tree/master/src/jdk.jdeps) Core Libs
* [jdk.jdi](https://github.com/openjdk/jdk/tree/master/src/jdk.jdi) Serviceability
* [jdk.jdwp.agent](https://github.com/openjdk/jdk/tree/master/src/jdk.jdwp.agent) Serviceability
* [jdk.jfr](https://github.com/openjdk/jdk/tree/master/src/jdk.jfr) JFR
* [jdk.jlink](https://github.com/openjdk/jdk/tree/master/src/jdk.jlink) Tools
* [jdk.jpackage](https://github.com/openjdk/jdk/tree/master/src/jdk.jpackage) Core Libs
* [jdk.jshell](https://github.com/openjdk/jdk/tree/master/src/jdk.jshell) JShell
* [jdk.jsobject](https://github.com/openjdk/jdk/tree/master/src/jdk.jsobject) Tools
* [jdk.jstatd](https://github.com/openjdk/jdk/tree/master/src/jdk.jstatd) Serviceability
* [jdk.localedata](https://github.com/openjdk/jdk/tree/master/src/jdk.localedata) I18n
* [jdk.management](https://github.com/openjdk/jdk/tree/master/src/jdk.management) Serviceability
* [jdk.management.agent](https://github.com/openjdk/jdk/tree/master/src/jdk.management.agent) Serviceability
* [jdk.management.jfr](https://github.com/openjdk/jdk/tree/master/src/jdk.management.jfr) Runtime
* [jdk.naming.dns](https://github.com/openjdk/jdk/tree/master/src/jdk.naming.dns) Core Libs
* [jdk.naming.rmi](https://github.com/openjdk/jdk/tree/master/src/jdk.naming.rmi) Core Libs
* [jdk.net](https://github.com/openjdk/jdk/tree/master/src/jdk.net) Net
* [jdk.nio.mapmode](https://github.com/openjdk/jdk/tree/master/src/jdk.nio.mapmode) NIO
* [jdk.random](https://github.com/openjdk/jdk/tree/master/src/jdk.random) Core Libs
* [jdk.sctp](https://github.com/openjdk/jdk/tree/master/src/jdk.sctp) Net
* [jdk.security.auth](https://github.com/openjdk/jdk/tree/master/src/jdk.security.auth) Security
* [jdk.security.jgss](https://github.com/openjdk/jdk/tree/master/src/jdk.security.jgss) Security
* [jdk.unsupported](https://github.com/openjdk/jdk/tree/master/src/jdk.unsupported) Core Libs
* [jdk.unsupported.desktop](https://github.com/openjdk/jdk/tree/master/src/jdk.unsupported.desktop) Client Libs
* [jdk.xml.dom](https://github.com/openjdk/jdk/tree/master/src/jdk.xml.dom) Core Libs
* [jdk.zipfs](https://github.com/openjdk/jdk/tree/master/src/jdk.zipfs) Core Libs
* [make](https://github.com/openjdk/jdk/tree/master/src/make) Build
* [test](https://github.com/openjdk/jdk/tree/master/src/test)
  * The test directories follow to a large part the same structure as the source code in `src`. The owners are the same for directories with the same names.
* [utils](https://github.com/openjdk/jdk/tree/master/src/utils) –

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
* `jdk.crypto.ucrypto` – Security (Removed in [12](https://bugs.openjdk.org/browse/JDK-8241787))
  * only available on Solaris
* `jdk.incubator.concurrent` – Core Libs (Unknown when it was Removed)
* `jdk.internal.vm.compiler` – Compiler (Unknown when it was Removed)
* `jdk.internal.vm.compiler.management` – Compiler (Unknown when it was Removed)
* `jdk.pack` – Tools (Removed in [14](https://bugs.openjdk.org/browse/JDK-8234596))
* `jdk.rmic` – Core Libs (Removed in [15](https://bugs.openjdk.org/browse/JDK-8225319))
* `jdk.scripting.nashorn` – Tools (Removed in [15](https://bugs.openjdk.org/browse/JDK-8236933))
* `jdk.scripting.nashorn.shell` – Tools (Removed in [15](https://bugs.openjdk.org/browse/JDK-8236933))

::: {.box}
[To the top](#){.boxheader}
:::
