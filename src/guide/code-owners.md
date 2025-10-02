# Code Owners

This list is intended to make it easier to identify which email list to include in code reviews when making changes in different areas. The list may also help when assigning bugs based on which code they are found in. Please note that some directories may have been created or removed between releases. The intention is to include directories that exist in mainline and other commonly updated releases (post JDK 9).

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

* [.jcheck](https://github.com/openjdk/jdk/tree/master/.jcheck) - Build
* [bin](https://github.com/openjdk/jdk/tree/master/bin) - Build
* [demo](https://github.com/openjdk/jdk/tree/master/src/demo) - Client Libs
* [doc](https://github.com/openjdk/jdk/tree/master/doc)
* [hotspot](https://github.com/openjdk/jdk/tree/master/src/hotspot)
  * [cpu](https://github.com/openjdk/jdk/tree/master/src/hotspot/cpu) - Compiler, Runtime
  * [os](https://github.com/openjdk/jdk/tree/master/src/hotspot/os) - Runtime
  * [os_cpu](https://github.com/openjdk/jdk/tree/master/src/hotspot/os_cpu) - Compiler
  * [share](https://github.com/openjdk/jdk/tree/master/src/hotspot/share)
    * [adlc](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/adlc) - Compiler
    * [asm](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/asm) - Runtime
    * [c1](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/c1) - Compiler
    * [cds](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/cds) - Runtime
    * [ci](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/ci) - Compiler
    * [classfile](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/classfile) - Runtime
    * [code](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/code) - Compiler
    * [compiler](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/compiler) - Compiler
    * [gc](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/gc) - GC
    * [include](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/include) - HotSpot
    * [interpreter](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/interpreter) - Runtime
    * [jfr](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/jfr) - JFR
    * [jvmci](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/jvmci) - Compiler
    * [libadt](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/libadt) - Compiler
    * [logging](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/logging) - Runtime
    * [memory](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/memory) - GC, Runtime
    * [metaprogramming](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/metaprogramming) - HotSpot
    * [nmt](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/nmt) - Runtime
    * [oops](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/oops) - GC, Runtime
    * [opto](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/opto) - Compiler
    * [precompiled](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/precompiled) - HotSpot
    * [prims](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/prims) - Runtime, Serviceability
    * [runtime](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/runtime) - Runtime
    * [sanitizers](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/sanitizers) - Runtime
    * [services](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/services) - Runtime
    * [utilities](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/utilities) - GC, Runtime
* [java.base](https://github.com/openjdk/jdk/tree/master/src/java.base)
  * Core Libs should almost always be included but Java Language, HotSpot, Security and/or I18n may also be involved.
  * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/classes), [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/classes), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes)]/classes
    * [com/sun/crypto](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun/crypto) - Security
    * [com/sun/security](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/com/sun/security) - Security
    * [crypto](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/javax/crypto) - Security
    * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/classes/jdk/internal), [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/classes/jdk/internal), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/jdk/internal), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/jdk/internal)]/internal
      * [access](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/access) - Core Libs, Security
      * [classfile](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/classfile) - Core Libs
      * [constant](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/constant) - Core Libs
      * [event](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/event) - JFR
      * [foreign](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/foreign) - Core Libs
      * [icu](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/icu) - Core Libs
      * [invoke](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/invoke) - Core Libs
      * [io](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/io) - Core Libs
      * [javac](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/javac) - Java Language (javac)
      * [jimage](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/jimage) - Core Libs
      * [jmod](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/jmod) - Core Libs
      * [jrtfs](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/jrtfs) - Core Libs
      * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/classes/jdk/internal/loader), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/jdk/internal/loader), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/loader), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal/loader), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/jdk/internal/loader)]/loader - Core Libs
      * [logger](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/logger) - Core Libs
      * [math](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/math) - Core Libs
      * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/misc), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal/misc), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/jdk/internal/misc)]/misc - Core Libs, HotSpot
      * [module](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/module) - Core Libs
      * [org/objectweb](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/org/objectweb) - Core Libs
      * [org/xml](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/org/xml) - Core Libs
      * [perf](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/perf) - Runtime
      * [[linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/classes/jdk/internal/platform), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/platform), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/jdk/internal/platform), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/jdk/internal/platform)]/platform - HotSpot
      * [random](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/random) - Core Libs
      * [ref](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/ref) - Core Libs, GC
      * [reflect](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/reflect) - Core Libs
      * [util/random](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/util/random) - Core Libs
      * [util/regex](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/util/regex) - Core Libs
      * [util/xml](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/util/xml) - Core Libs
      * [vm](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/jdk/internal/vm) - HotSpot
    * [invoke](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/invoke) - Core Libs
    * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/io), [sun](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/sun/io), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java/io)]/io - Core Libs
    * [[macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/java), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/java)]/java
      * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/lang), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/java/lang), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/java/lang)]/lang - Core Libs
      * [math](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/math) - Core Libs
      * [time](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/time) - Core Libs
    * [launcher](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/launcher) - Tools, Core Libs
    * [META-INF/services](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/META-INF/services) - Core Libs
    * [[javax](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/javax/net), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/java/net)]/net - Net
    * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/classes/sun/nio), [java](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/nio), [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/classes/sun/nio), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/sun/nio), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/sun/nio), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/sun/nio)]/nio - NIO
    * [reflect](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/reflect) - Core Libs
    * [[apple](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/apple/security), [java](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/security), [javax](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/javax/security), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/apple/security), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/classes/sun/security), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/sun/security)]/security - Security
    * [[java](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/text), [sun](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/sun/text)]/text - I18n
    * [[java](https://github.com/openjdk/jdk/tree/master/src/java.base/share/classes/java/util), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/classes/sun/util), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/classes/sun/util)]/util - I18n, Core Libs
  * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/conf), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/conf), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/conf), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/conf)]/conf
    * [sdp](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/conf/sdp) - Net
    * [security](https://github.com/openjdk/jdk/tree/master/src/java.base/share/conf/security) - Security
  * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/legal), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/legal)]/legal
  * [man](https://github.com/openjdk/jdk/tree/master/src/java.base/share/man)
    * [java.md](https://github.com/openjdk/jdk/tree/master/src/src/java.base/share/man/java.md) - Tools, HotSpot
    * [keytool.md](https://github.com/openjdk/jdk/tree/master/src/src/java.base/share/man/keytool.md) - Security
  * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/native), [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/native), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native)]/native
    * [common](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/common)
    * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/include), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/include), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/include)]/include - Runtime, Core Libs
    * [jspawnhelper](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/jspawnhelper) - Tools
    * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/launcher), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/launcher), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/launcher)]/launcher - Tools
    * [libfallbackLinker](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libfallbackLinker) - Core Libs
    * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/native/libjava), [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/native/libjava), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native/libjava), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libjava), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjava), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/libjava)]/libjava - Core Libs
    * [[share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libjimage), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjimage), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/libjimage)]/libjimage - Core Libs
    * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/native/libjli), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native/libjli), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libjli), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjli), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/libjli)]/libjli - Tools, Core Libs
    * [libjsig](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libjsig) - HotSpot
    * [[macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native/libnet), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libnet), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libnet), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/libnet)]/libnet - Net
    * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/native/libnio), [linux](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/native/libnio), [macosx](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native/libnio), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libnio), [unix](https://github.com/openjdk/jdk/tree/master/src/java.base/unix/native/libnio), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/libnio)]/libnio - NIO
    * [libosxsecurity](https://github.com/openjdk/jdk/tree/master/src/java.base/macosx/native/libosxsecurity) - Security
    * [libsimdsort](https://github.com/openjdk/jdk/tree/master/src/java.base/linux/native/libsimdsort) - Core Libs
    * [[aix](https://github.com/openjdk/jdk/tree/master/src/java.base/aix/native/libsyslookup), [share](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libsyslookup), [windows](https://github.com/openjdk/jdk/tree/master/src/java.base/windows/native/libsyslookup)]/libsyslookup - Core Libs
    * [libverify](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libverify) - Runtime
    * [libzip](https://github.com/openjdk/jdk/tree/master/src/java.base/share/native/libzip) - Core Libs
  * [share/data](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data)
    * [blockedcertsconverter](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/blockedcertsconverter) - Security
    * [cacerts](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/cacerts) - Security
    * [currency](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/currency) - I18n
    * [lsrdata](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/lsrdata) - I18n
    * [publicsuffixlist](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/publicsuffixlist) - Client Libs
    * [tzdata](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/tzdata) - I18n
    * [unicodedata](https://github.com/openjdk/jdk/tree/master/src/java.base/share/data/unicodedata) - I18n
* [java.compiler](https://github.com/openjdk/jdk/tree/master/src/java.compiler) - Java Language (javac)
* [java.datatransfer](https://github.com/openjdk/jdk/tree/master/src/java.datatransfer) - Client Libs
* [java.desktop](https://github.com/openjdk/jdk/tree/master/src/java.desktop) - Client Libs
* [java.instrument](https://github.com/openjdk/jdk/tree/master/src/java.instrument) - Serviceability
* [java.logging](https://github.com/openjdk/jdk/tree/master/src/java.logging) - Core Libs
* [java.management](https://github.com/openjdk/jdk/tree/master/src/java.management) - Serviceability
* [java.management.rmi](https://github.com/openjdk/jdk/tree/master/src/java.management.rmi) - Serviceability
* [java.naming](https://github.com/openjdk/jdk/tree/master/src/java.naming) - Core Libs
* [java.net.http](https://github.com/openjdk/jdk/tree/master/src/java.net.http) - Net
* [java.prefs](https://github.com/openjdk/jdk/tree/master/src/java.prefs) - Core Libs
* [java.rmi](https://github.com/openjdk/jdk/tree/master/src/java.rmi) - Core Libs
* [java.scripting](https://github.com/openjdk/jdk/tree/master/src/java.scripting) - Tools
* [java.se](https://github.com/openjdk/jdk/tree/master/src/java.se) - Core Libs
* [java.security.jgss](https://github.com/openjdk/jdk/tree/master/src/java.security.jgss) - Security
* [java.security.sasl](https://github.com/openjdk/jdk/tree/master/src/java.security.sasl) - Security
* [java.smartcardio](https://github.com/openjdk/jdk/tree/master/src/java.smartcardio) - Security
* [java.sql](https://github.com/openjdk/jdk/tree/master/src/java.sql) - Core Libs
* [java.sql.rowset](https://github.com/openjdk/jdk/tree/master/src/java.sql.rowset) - Core Libs
* [java.transaction.xa](https://github.com/openjdk/jdk/tree/master/src/java.transaction.xa) - Core Libs
* [java.xml](https://github.com/openjdk/jdk/tree/master/src/java.xml) - Core Libs
* [java.xml.crypto](https://github.com/openjdk/jdk/tree/master/src/java.xml.crypto) - Security
* [jdk.accessibility](https://github.com/openjdk/jdk/tree/master/src/jdk.accessibility) - Client Libs
* [jdk.attach](https://github.com/openjdk/jdk/tree/master/src/jdk.attach) - Serviceability
* [jdk.charsets](https://github.com/openjdk/jdk/tree/master/src/jdk.charsets) - I18n, Core Libs
* [jdk.compiler](https://github.com/openjdk/jdk/tree/master/src/jdk.compiler) - Java Language (javac)
* [jdk.crypto.cryptoki](https://github.com/openjdk/jdk/tree/master/src/jdk.crypto.cryptoki) - Security
* [jdk.crypto.ec](https://github.com/openjdk/jdk/tree/master/src/jdk.crypto.ec) - Security
* [jdk.crypto.mscapi](https://github.com/openjdk/jdk/tree/master/src/jdk.crypto.mscapi) - Security
* [jdk.dynalink](https://github.com/openjdk/jdk/tree/master/src/jdk.dynalink) - Tools
* [jdk.editpad](https://github.com/openjdk/jdk/tree/master/src/jdk.editpad) - JShell
* [jdk.graal.compiler](https://github.com/openjdk/jdk/tree/master/src/jdk.graal.compiler) - Compiler
* [jdk.graal.compiler.management](https://github.com/openjdk/jdk/tree/master/src/jdk.graal.compiler.management) - Compiler
* [jdk.hotspot.agent](https://github.com/openjdk/jdk/tree/master/src/jdk.hotspot.agent) - Serviceability
* [jdk.httpserver](https://github.com/openjdk/jdk/tree/master/src/jdk.httpserver) - Net
* [jdk.incubator.vector](https://github.com/openjdk/jdk/tree/master/src/jdk.incubator.vector) - Compiler
* [jdk.internal.ed](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.ed) - JShell
* [jdk.internal.jvmstat](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.jvmstat) - Serviceability
* [jdk.internal.le](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.le) - JShell
* [jdk.internal.md](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.md) - Tools
* [jdk.internal.opt](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.opt) - Tools
* [jdk.internal.vm.ci](https://github.com/openjdk/jdk/tree/master/src/jdk.internal.vm.ci) - Compiler
* [jdk.jartool](https://github.com/openjdk/jdk/tree/master/src/jdk.jartool) - Tools
* [jdk.javadoc](https://github.com/openjdk/jdk/tree/master/src/jdk.javadoc) - Javadoc
* [jdk.jcmd](https://github.com/openjdk/jdk/tree/master/src/jdk.jcmd) - Serviceability
* [jdk.jconsole](https://github.com/openjdk/jdk/tree/master/src/jdk.jconsole) - Serviceability
* [jdk.jdeps](https://github.com/openjdk/jdk/tree/master/src/jdk.jdeps) - Core Libs
* [jdk.jdi](https://github.com/openjdk/jdk/tree/master/src/jdk.jdi) - Serviceability
* [jdk.jdwp.agent](https://github.com/openjdk/jdk/tree/master/src/jdk.jdwp.agent) - Serviceability
* [jdk.jfr](https://github.com/openjdk/jdk/tree/master/src/jdk.jfr) - JFR
* [jdk.jlink](https://github.com/openjdk/jdk/tree/master/src/jdk.jlink) - Tools
* [jdk.jpackage](https://github.com/openjdk/jdk/tree/master/src/jdk.jpackage) - Core Libs
* [jdk.jshell](https://github.com/openjdk/jdk/tree/master/src/jdk.jshell) - JShell
* [jdk.jsobject](https://github.com/openjdk/jdk/tree/master/src/jdk.jsobject) - Tools
* [jdk.jstatd](https://github.com/openjdk/jdk/tree/master/src/jdk.jstatd) - Serviceability
* [jdk.localedata](https://github.com/openjdk/jdk/tree/master/src/jdk.localedata) - I18n
* [jdk.management](https://github.com/openjdk/jdk/tree/master/src/jdk.management) - Serviceability
* [jdk.management.agent](https://github.com/openjdk/jdk/tree/master/src/jdk.management.agent) - Serviceability
* [jdk.management.jfr](https://github.com/openjdk/jdk/tree/master/src/jdk.management.jfr) - Runtime
* [jdk.naming.dns](https://github.com/openjdk/jdk/tree/master/src/jdk.naming.dns) - Core Libs
* [jdk.naming.rmi](https://github.com/openjdk/jdk/tree/master/src/jdk.naming.rmi) - Core Libs
* [jdk.net](https://github.com/openjdk/jdk/tree/master/src/jdk.net) - Net
* [jdk.nio.mapmode](https://github.com/openjdk/jdk/tree/master/src/jdk.nio.mapmode) - NIO
* [jdk.sctp](https://github.com/openjdk/jdk/tree/master/src/jdk.sctp) - Net
* [jdk.security.auth](https://github.com/openjdk/jdk/tree/master/src/jdk.security.auth) - Security
* [jdk.security.jgss](https://github.com/openjdk/jdk/tree/master/src/jdk.security.jgss) - Security
* [jdk.unsupported](https://github.com/openjdk/jdk/tree/master/src/jdk.unsupported) - Core Libs
* [jdk.unsupported.desktop](https://github.com/openjdk/jdk/tree/master/src/jdk.unsupported.desktop) - Client Libs
* [jdk.xml.dom](https://github.com/openjdk/jdk/tree/master/src/jdk.xml.dom) - Core Libs
* [jdk.zipfs](https://github.com/openjdk/jdk/tree/master/src/jdk.zipfs) - Core Libs
* [make](https://github.com/openjdk/jdk/tree/master/make) - Build
* [test](https://github.com/openjdk/jdk/tree/master/test)
  * The test directories follow to a large part the same structure as the source code in `src`. The owners are the same for directories with the same names.
* [utils](https://github.com/openjdk/jdk/tree/master/src/utils)

### Directories removed

* hotspot
  * `*.jdk` – Compiler (Removed in [10](https://bugs.openjdk.org/browse/JDK-8187443))
  * share
    * `aot` – Compiler (Removed in [17](https://bugs.openjdk.org/browse/JDK-8263327))
    * `shark` – Compiler (Removed in [10](https://bugs.openjdk.org/browse/JDK-8171853))
    * `trace` – Runtime (Removed in [11](https://bugs.openjdk.org/browse/JDK-8199712))
* java.base
  * `share/lib` – Security (Removed in [24](https://bugs.openjdk.org/browse/JDK-8338411))
  * `windows/lib` – Security (Removed in [24](https://bugs.openjdk.org/browse/JDK-8338411))
* `jdk.aot` – Compiler (Removed in [17](https://bugs.openjdk.org/browse/JDK-8263327))
* `jdk.crypto.ucrypto` – Security (Removed in [12](https://bugs.openjdk.org/browse/JDK-8241787))
  * only available on Solaris
* `jdk.incubator.concurrent` – Core Libs (Removed in [21](https://bugs.openjdk.org/browse/JDK-8306647))
* `jdk.internal.vm.compiler` – Compiler (Removed in [22](https://bugs.openjdk.org/browse/JDK-8318027))
* `jdk.internal.vm.compiler.management` – Compiler (Removed in [22](https://bugs.openjdk.org/browse/JDK-8318027))
* `jdk.pack` – Tools (Removed in [14](https://bugs.openjdk.org/browse/JDK-8234596))
* `jdk.random` – Core Libs (Removed in [23](https://bugs.openjdk.org/browse/JDK-8330005))
* `jdk.rmic` – Core Libs (Removed in [15](https://bugs.openjdk.org/browse/JDK-8225319))
* `jdk.scripting.nashorn` – Tools (Removed in [15](https://bugs.openjdk.org/browse/JDK-8236933))
* `jdk.scripting.nashorn.shell` – Tools (Removed in [15](https://bugs.openjdk.org/browse/JDK-8236933))

::: {.box}
[To the top](#){.boxheader}
:::
