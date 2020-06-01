% Java Style Guide

::: {.NavBit}
[« Previous](mailinglists.html) • [TOC](index.html) • [Next »](changePlanning.html)
:::

While this document covers a lot of ground, it should be noted that no style guide can answer all questions for us, and developers will always need to use good judgment towards the end of producing code that is correct, readable, maintainable, debuggable, consistently formatted, and aesthetically pleasing.

Examples in this document are non-normative; While they intend to illustrate correct way of formatting the code, there may be other ways to correctly format the code. This is a general principle: There may be several ways to format the code, all adhering to the guidelines in this document.

Tool support is nice, but ultimately each IDE and style checking tool can handle different sets of rules, and support for rules that can’t be handled today might be added in future versions. So, whether a rule plays well with tools or not can be a factor, but it’s secondary to the above principles.

## Overview

- [Java Source Files](#java-source-files)  
  - [Special Characters](#special-characters)  
- [Formatting](#formatting)  
  - [Copyright notice](#copyright-notice)  
  - [Package declaration](#package-declaration)  
  - [Import statements](#import-statements)  
  - [Class Structure](#class-structure)  
  - [Modifiers](#modifiers)  
  - [Braces](#braces)  
  - [Indentation](#indentation)  
  - [Wrapping Lines](#wrapping-lines)  
  - [Whitespace](#whitespace)  
  - [Variable Declarations](#variable-declarations)  
  - [Annotations](#annotations)  
  - [Lambda Expressions](#lambda-expressions)  
  - [Redundant Parentheses](#redundant-parentheses)  
  - [Literals](#literals)  
  - [Javadoc](#javadoc)  
- [Naming](#naming)  
  - [Package Names](#package-names)  
  - [Class, Interface and Enum Names](#class--interface-and-enum-names)  
  - [Method Names](#method-names)  
  - [Variables](#variables)  
  - [Type Variables](#type-variables)  
  - [Constants](#constants)  
- [Programming Practices](#programming-practices)  
  - [Commenting Code](#commenting-code)  
- [When to reformat code](#when-to-reformat-code)  
- [Cases not covered](#cases-not-covered)  

## Java Source Files{#java-source-files}
This section concerns ordinary `.java` files only. Rules do not necessarily apply to other source files such as `.jasm`, `.sh` or `.gmk`.

<ul class="conventions">
<li>Source files must be encoded in 7-bit ASCII.</li>
<li>All lines must be terminated with a line feed character (`LF`, ASCII value 10) and *not* for instance `CR` or `CR`+`LF`.</li>
<li>There may be no trailing white space at the end of a line.</li>
<li>The name of a source file must equal the name of the class it contains followed by the `.java` extension, even for files that only contain a package private class. This does not apply to files that do not contain any class declarations, such as `package-info.java`.</li>
</ul>

<div class="box">
<div class="boxheader">Motivation</div>
7-bit ASCII reduces errors due to confusion of characters since there are no invisible spaces, characters that look like minus signs but are really dashes, etc. It also ensures packages and classes are named in such way that the corresponding directories and source files are portable across different filesystems.

Agreeing on a common line delimiter character is important since different operating systems have different defaults. Editing a file on Windows that was originally written on Linux, may cause all `LF` to be saved back as `CR`+`LF`. This creates unnecessarily big patches and may not display correctly in the text editor it was originally written in. A single line feed character is default for Unix-like systems and supported by all common text editors and IDEs.

Trailing white space is nothing but unnecessary cruft. It’s easy to remove and agreeing on doing so consistently minimizes diffs.

Not using the name of the class as filename can be confusing. Also, unless the file is given explicitly to the compiler, the class it contains may not be resolved correctly.
</div>

### Special Characters{#special-characters}
<ul class="conventions">
    <li>Apart from `LF` the only allowed white space character is Space (ASCII value 32). Note that this implies that other white space characters (in, for instance, string and character literals) must be written in escaped form.</li>
    <li>`\'`, `\"`, `\\`, `\t`, `\b`, `\r`, `\f`, and `\n` should be preferred over corresponding octal (e.g. `\047`) or Unicode (e.g. `\u0027`) escaped characters.</li>
    <li>Should there be a need to go against the above rules for the sake of testing, the test should generate the required source.</li>
</ul>

<div class="box">
<div class="boxheader">Motivation</div>
Having any white space character but space and `LF` in the source code can be a source of confusion.

The short forms (e.g. `\t`) are commonly used and easier to recognize than the corresponding longer forms (`\011`, `\u0009`).
</div>

## Formatting{#formatting}
<ul class="conventions">
<li>A Java source file should be structured as follows:
    <ol class="spread">
        <li>The copyright notice</li>
        <li>Package declaration</li>
        <li>Import statements</li>
        <li>Class declaration</li>
    </ol>
</li>
<li>There may be only one top level class declaration per file.</li>
</ul>

### Copyright notice{#copyright-notice}
<ul class="conventions">
<li>All source files should have an appropriate copyright notice at the top of the file.</li>
<li>For files under Oracle copyright, the copyright notice must follow the standard wording and format. In particular the first two lines should be
<pre><code style="font-size: 90%;"><span class="comment">/*
 * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.</span></code></pre>
or
<pre><code style="font-size: 90%"><span class="comment">/*
 * Copyright (c) 2011, 2015, Oracle and/or its affiliates. All rights reserved.</span></code></pre>
where the first year is the year the file was created and the second year is the year the file was last edited.
</li>
</ul>

For questions regarding Oracle copyright or license notices, please contact <a href="mailto:iris.clark@oracle.com">iris.clark@oracle.com</a>.

### Package declaration{#package-declaration}
<ul class="conventions">
    <li>The package declaration should not be line wrapped, regardless of whether it exceeds the recommended maximum length of a line. (See section on [Wrapping Lines](#wrapping-lines).)</li>
</ul>

### Import statements{#import-statements}
<ul class="conventions">
 <li>Import statements should be sorted…
  <ul class="spread">
   <li>…primarily by non-static / static with non-static imports first.</li>
   <li>…secondarily by package origin according to the following order
    <ul class="spread">
     <li>`java` packages</li>
     <li>`javax` packages</li>
     <li>external packages (e.g. `org.xml`)</li>
     <li>internal packages (e.g. `com.sun`)</li>
    </ul>
   </li>
   <li>…tertiary by package and class identifier in lexicographical order</li>
  </ul>
 </li>
 <li>Import statements should not be line wrapped, regardless of whether it exceeds the recommended maximum length of a line.</li>
 <li>No unused imports should be present.</li>
</ul>

#### Wildcard Imports
<ul class="conventions">
    <li>Wildcard imports should in general not be used.</li>
    <li>When importing a large number of closely-related classes (such as implementing a visitor over a tree with dozens of distinct &ldquo;node&rdquo; classes), a wildcard import may be used.</li>
    <li>In any case, no more than one wildcard import per file should be used.</li>
</ul>
<div class="box">
<div class="boxheader">Motivation</div>
Wildcard imports makes it unclear what actually needs to be imported.

Having more than one wildcard import makes the code fragile since adding a new class in one of the imported packages can introduce a name clash.

An unused import gives a false impression of a dependency. Also, many IDEs list such import statements as warnings which clutters the list of problems.
</div>

### Class Structure{#class-structure}
<ul class="conventions">
 <li>The recommended order of class members is the following:
  <ol class="spread">
   <li>Fields</li>
   <li>Constructors</li>
   <li>Factory methods</li>
   <li>Other Methods</li>
  </ol>
 </li>
 <li>Related fields should be grouped together. Ordering fields primarily according to access modifiers or identifier is not required. The same applies to methods.</li>
 <li>Nested types should be grouped at the top of the class, or else defined before first use.</li>
</ul>

#### Order of Constructors and Overloaded Methods
<ul class="conventions">
 <li>Constructors and overloaded methods should be grouped together by functionality and ordered with increasing arity. This implies that delegation among these constructs flow downward in the code.</li>
 <li>Constructors and overloaded methods should generally not be split apart by other members.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">public</span> HashSet() {
    <span class="keyword">this</span>(DEFAULT_INITIAL_CAPACITY);
}

<span class="keyword">public</span> HashSet(<span class="keyword">int</span> capacity) {
    <span class="keyword">this</span>(capacity, DEFAULT_LOAD_FACTOR);
}

<span class="keyword">public</span> HashSet(<span class="keyword">int</span> capacity, <span class="keyword">double</span> loadFactor) {
    …
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">// Overloaded methods should not be split apart
</span><span class="keyword">void</span> logValue(<span class="keyword">int</span> i) {
    log(<span class="literal">"Int: %d"</span>, i);
}

<span class="keyword">void</span> setValue(<span class="keyword">int</span> i) {
    val = i;
}

<span class="keyword">void</span> logValue(<span class="keyword">double</span> d) {
    log(<span class="literal">"Double: %.2d"</span>, d);
}

<span class="keyword">void</span> setValue(<span class="keyword">double</span> d) {
    val = d;
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

<div class="box">
<div class="boxheader">Motivation</div>
This order puts the most generally applicable versions first. Also, making sure delegation is always done downwards in the file makes the code easier to follow.
</div>

### Modifiers{#modifiers}
<ul class="conventions">
 <li>Modifiers should go in the following order
  <ol class="spread">
   <li>Access modifier (`public` / `private` / `protected`)</li>
   <li>`abstract`</li>
   <li>`static`</li>
   <li>`final`</li>
   <li>`transient`</li>
   <li>`volatile`</li>
   <li>`default`</li>
   <li>`synchronized`</li>
   <li>`native`</li>
   <li>`strictfp`</li>
  </ol>
 </li>
 <li>Modifiers should not be written out when they are implicit. For example, interface methods should neither be declared public nor abstract, and nested enums and interfaces should not be declared static.
 </li>
 <li>Method parameters and local variables should not be declared final unless it improves readability or documents an actual design decision.</li>
 <li>Fields should be declared final unless there is a compelling reason to make them mutable.</li>
</ul>
<div class="box">
<div class="boxheader">Motivation</div>
Writing out modifiers where they are implicit clutters the code and learning which modifiers are implicit where is easy.

Although method parameters should typically not be mutated, consistently marking all parameters in every methods as `final` is an exaggeration.

Making fields immutable where possible is good programming practice. Refer to <em>Effective Java, Item 15: Minimize Mutability</em> for details.
</div>

### Braces{#braces}
<ul class="conventions">
 <li>Opening braces should be put on the end of the current line rather than on a line by its own.</li>
 <li>There should be a new line in front of a closing brace unless the block is empty (see [Short Forms](#short-forms) below)</li>
 <li>Braces are recommended even where the language makes them optional, such as single-line if and loop bodies.
  <ul class="spread">
   <li>If a block spans more than one line (including comments) it must have braces.</li>
   <li>If one of the blocks in a if / else statement has braces, the other block must too.</li>
   <li>If the block comes last in an enclosing block, it must have braces.</li>
  </ul>
 </li>
 <li>The `else`,&nbsp;`catch` and the `while` keyword in `do`…`while` loops go on the same line as the closing brace of the preceding block.</li>
</ul>

<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">void</span> method() {
    …
}</code></pre>
<pre><code><span class="keyword">try</span> {
    something();
} <span class="keyword">catch</span> (AnException e) {
    …
}</code></pre>
<pre><code><span class="keyword">for</span> (<span class="keyword">int</span>[] row : matrix) {
    <span class="keyword">for</span> (<span class="keyword">int</span> val : row) {
        sum += val;
    }
}</code></pre>
</div>
</div>

<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">// Wrong placement of opening brace
</span><span class="keyword">void</span> method()
{
    …
}</code></pre>
<pre><code><span class="comment">// Newline in front of catch should be avoided
</span><span class="keyword">try</span> {
    something();
}
<span class="keyword">catch</span> (AnException e) {
    …
}</code></pre>
<pre><code><span class="comment">// Braces should be used
</span><span class="keyword">if</span> (flag)
    <span class="comment">// Restore x
</span>    x = <span class="literal">1</span>;</code></pre>
<pre><code><span class="comment">// Use braces if block comes last in enclosing block
</span><span class="comment">// to avoid accidentally indenting the closing brace.
</span><span class="keyword">for</span> (<span class="keyword">int</span>[] row : matrix) {
    <span class="keyword">for</span> (<span class="keyword">int</span> val : row)
        sum += val;
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

<div class="box">
<div class="boxheader">Motivation</div>
Putting opening braces on the end of the line (as opposed to on a line of its own) is a long standing Java convention. This style is also suitable for Java, considering that it’s common to have small blocks (in for instance anonymous classes and lambda expressions) and having opening braces on a separate line creates an unnecessary amount of white space in such situations.

Omitting braces is error prone and can lead to mistakes in the indentation and hard to detect bugs.
</div>

#### Short Forms{#short-forms}
<ul class="conventions">
    <li>The above recommendations are intended to improve uniformity (and thus increase familiarity / readability). In some cases &ldquo;short forms&rdquo; that deviate from the above guidelines are just as readable and may be used instead. These cases include for instance simple enum declarations and trivial methods and lambda expressions.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">enum</span> Response { YES, NO, MAYBE }</code></pre>
<pre><code><span class="keyword">public</span> <span class="keyword">boolean</span> isReference() { <span class="keyword">return</span> true; }</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">public</span> <span class="keyword">boolean</span> getResult() { <span class="keyword">int</span> value = getValue(); <span class="keyword">return</span> value &lt; <span class="literal">0</span> ? <span class="literal">0</span> : value; }</code></pre>
<pre><code><span class="keyword">for</span> (<span class="keyword">int</span> i = <span class="literal">0</span>; i < size; i++) { sum += data[i]; }</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
    
### Indentation{#indentation}
<ul class="conventions">
    <li>Indentation level is four spaces.</li>
    <li>Only space characters may be used for indentation. No tabs.</li>
    <li>Empty lines must not be indented. (This is implied by the no trailing white space rule.)</li>
    <li>`case` lines should be indented with four spaces, and statements within the case should be indented with another four spaces.</li>
</ul>
Refer to Section&nbsp;[Wrapping Lines](#wrapping-lines)&nbsp;for guidelines on how to indent continuation lines.
        
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">switch</span> (var) {
    <span class="keyword">case</span> TWO:
        setChoice(<span class="literal">"two"</span>);
        <span class="keyword">break</span>;
    <span class="keyword">case</span> THREE:
        setChoice(<span class="literal">"three"</span>);
        <span class="keyword">break</span>;
    <span class="keyword">default</span>:
        <span class="keyword">throw</span> <span class="keyword">new</span> IllegalArgumentException();
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">switch</span> (var) {
<span class="keyword">case</span> TWO:
    setChoice(<span class="literal">"two"</span>);
    <span class="keyword">break</span>;
<span class="keyword">case</span> THREE:
    setChoice(<span class="literal">"three"</span>);
    <span class="keyword">break</span>;
<span class="keyword">default</span>:
    <span class="keyword">throw</span> <span class="keyword">new</span> IllegalArgumentException();
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
    
<div class="box">
<div class="boxheader">Motivation</div>
By using spaces for indentation, problems regarding different default settings for tab stops in various editors are avoided.
</div>

### Wrapping Lines{#wrapping-lines}
<ul class="conventions">
<li>Source code and comments should generally not exceed 80 characters per line and rarely if ever exceed 100 characters per line, including indentation.
<div class="box">
<div class="boxheader">Note</div>
The character limit must be judged on a case by case basis. What really matters is the semantical &ldquo;density&rdquo; and readability of the line. Making lines gratuitously long makes them hard to read; similarly, making &ldquo;heroic attempts&rdquo; to fit them into 80 columns can also make them hard to read. The flexibility outlined here aims to enable developers to avoid these extremes, not to maximize use of monitor real-estate.
</div>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="comment">// Ok even though it might exceed the character limit when indented.
</span>Error e = isTypeParam
        ? Errors.InvalidRepeatableAnnotationNotApplicable(targetContainerType, on)
        : Errors.InvalidRepeatableAnnotationNotApplicableInContext(targetContainerType));</code></pre>
<pre><code>String pretty = Stream.of(args)
                      .map(Argument::prettyPrint)
                      .collectors(joining(<span class="literal">", "</span>));</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">// Too strict interpretation of the character limit. Readability suffers.
</span>Error e = isTypeParam
        ? Errors.InvalidRepeatableAnnotationNotApplicable(
                targetContainerType, on)
        : Errors.InvalidRepeatableAnnotationNotApplicableInContext(
                targetContainerType);</code></pre>

<pre><code><span class="comment">// Should be wrapped even though it fits within the character limit
</span>String pretty = Stream.of(args).map(Argument::prettyPrint).collectors(joining(<span class="literal">", "</span>));</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
</li>
<li>URLs or example commands should not be wrapped.</li>
<li>Wrapping at a higher syntactical level is preferred over wrapping at a lower syntactical level.
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code>aMethodCall(withMany(arguments, that, needs),
            to(be, (wrapped - to) * avoid / veryLong - lines));</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code>aMethodCall(withMany(arguments, that, needs), to(be, (wrapped
    - to) * avoid / veryLong - lines));</code></pre>
</div>
</div>
</div>
<p style="clear: both"></p>
</li>
<li>There should be at most 1 statement per line.
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code>i += j;
j += k;</code></pre>
<pre><code><span class="keyword">if</span> (condition) {
    <span class="keyword">return</span> expression;
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code>i += j; j += k;</code></pre>
<pre><code><span class="keyword">if</span> (condition) { <span class="keyword">return</span> expression; }</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
</li>
<li>A continuation line should be indented in one of the following four ways
<ul class="spread">
<li><strong>Variant 1:</strong> With 8 extra spaces relative to the indentation of the previous line.</li>
<li><strong>Variant 2:</strong> With 8 extra spaces relative to the starting column of the wrapped expression.</li>
<li><strong>Variant 3:</strong> Aligned with previous sibling expression (as long as it is clear that it’s a continuation line)</li>
<li><strong>Variant 4:</strong> Aligned with previous method call in a chained expression.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="comment">// Variant 1
</span><span class="keyword">int</span> anInteger = aMethod(that, takes,
        a, lengthy, list, of, arguments);</code></pre>
<pre><code><span class="comment">// Variant 2
</span><span class="keyword">int</span> anInteger = that * (is + computed) / using
                        + a * complex - expression;</code></pre>
<pre><code><span class="comment">// Variant 3
</span><span class="keyword">int</span> anInteger = aMethod(thatTakes,
                        aLongList,
                        ofArguments);</code></pre>
<pre><code><span class="comment">// Variant 4
</span><span class="keyword">int</span> anInteger = IntStream.of(numbers)
                         .map(Math::sqrt)
                         .sum();</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">// Mixing of wrapping variants (unless there
</span><span class="comment">// is a logical grouping of arguments)
</span><span class="keyword">int</span> anInteger = aMethod(that,
                        takes,
                        a, lengthy, list,
                        of, arguments);</code></pre>
<pre><code><span class="comment">// Don't align with sibling expression if the continuation
</span><span class="comment">// line can be confused with a block indentation
</span><span class="keyword">if</span> (somePredicate() ||
    someOtherPredicate()) {
    System.out.println(<span class="literal">"Avoid"</span>);
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
</li>
</ul>
    
#### Wrapping Class Declarations
<ul class="conventions">
    <li>A class header should not be wrapped unless it approaches the maximum column limit.</li>
    <li>If it does, it may be wrapped before `extends` and/or `implements` keywords.</li>
    <li>Declarations of type parameters may, if necessary, be wrapped the same way as method arguments</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">public</span> <span class="keyword">class</span> MyGenericClass&lt;T, S&gt;
        <span class="keyword">extends</span> HashMap&lt;T, S&gt;
        <span class="keyword">implements</span> Comparable&lt;T&gt; {
    …
}</code></pre>
<pre><code><span class="keyword">public</span> <span class="keyword">class</span> AnotherClass&lt;K, R&gt; <span class="keyword">implements</span> Collector&lt;T <span class="keyword">extends</span> K,
                                                     Set&lt;? <span class="keyword">extends</span> R&gt;,
                                                     List&lt;R&gt;&gt; {
    …
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">public</span> <span class="keyword">class</span> MyGenericClass&lt;T&gt; <span class="keyword">implements</span> Comparable&lt;T&gt;,
        Predicate&lt;T&gt; {
    …
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
#### Wrapping Method Declarations
<ul class="conventions">
    <li>Method declarations can be formatted by listing the arguments vertically, or by a new line and +8 extra spaces</li>
    <li>If a throws clause needs to be wrapped, put the line break in front of the throws clause and make sure it stands out from the argument list, either by indenting +8 relative to the function declaration, or +8 relative to the previous line.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">int</span> someMethod(String aString,
               List&lt;Integer&gt; aList,
               Map&lt;String, String&gt; aMap,
               <span class="keyword">int</span> anInt,
               <span class="keyword">long</span> aLong,
               Set&lt;Number&gt; aSet,
               <span class="keyword">double</span> aDouble) {
    …
}</code></pre>
<pre><code><span class="keyword">int</span> someMethod(String aString, List&lt;Integer&gt; aList,
        Map&lt;String, String&gt; aMap, <span class="keyword">int</span> anInt, <span class="keyword">long</span> aLong,
        <span class="keyword">double</span> aDouble, <span class="keyword">long</span> aLong) {
    …
}</code></pre>
<pre><code><span class="keyword">int</span> someMethod(String aString,
               List&lt;Map&lt;Integer, StringBuffer&gt;&gt; aListOfMaps,
               Map&lt;String, String&gt; aMap)
        <span class="keyword">throws</span> IllegalArgumentException {
    …
}</code></pre>
<pre><code><span class="keyword">int</span> someMethod(String aString, List&lt;Integer&gt; aList,
        Map&lt;String, String&gt; aMap, <span class="keyword">int</span> anInt)
                <span class="keyword">throws</span> IllegalArgumentException {
    …
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">// If aligning the parameters vertically, don't put two
</span><span class="comment">// parameters on one line
</span><span class="keyword">int</span> someMethod(String aString,
               List&lt;Integer&gt; aList,
               Map&lt;String, String&gt; aMap,
               <span class="keyword">int</span> anInt, <span class="keyword">long</span> aLong,
               Set&lt;Number&gt; aSet,
               <span class="keyword">double</span> aDouble) {
    …
}</code></pre>
<pre><code><span class="keyword">int</span> someMethod(String aString,
               List&lt;Map&lt;Integer, StringBuffer&gt;&gt; aListOfMaps,
               Map&lt;String, String&gt; aMap) <span class="keyword">throws</span> InterruptedException {
    …
}</code></pre>
<pre><code><span class="keyword">int</span> someMethod(String aString,
               List&lt;Integer&gt; aList,
               Map&lt;String, String&gt; aMap)
               <span class="keyword">throws</span> IllegalArgumentException {
    …
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

#### Wrapping Expressions
<ul class="conventions">
    <li>If a line approaches the maximum character limit, always consider breaking it down into multiple statements / expressions instead of wrapping the line.</li>
    <li>Break before operators.</li>
    <li>Break before the `.` in chained method calls.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code>methodCall(a * simple - formula,
           some + complex - formula * spanning
                        + multiple - lines * may
                        + look - as * follows);</code></pre>
<pre><code>popupMsg(<span class="literal">"Inbox notification: You have "</span>
        + newMsgs + <span class="literal">" new messages"</span>);</code></pre>
<pre><code>people.stream()
      .map(Person::getName)
      .forEach(System.out::println);</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">// Arity unclear
</span>methodCall(a * simple - formula,
           some + complex - formula * spanning +
           multiple - lines * should + not *
           look - as * follows);</code></pre>
<pre><code><span class="comment">// Looks like two arguments
</span>popupMsg(<span class="literal">"Inbox notification: You have "</span> +
         newMsgs + <span class="literal">" new messages"</span>);</code></pre>
<pre><code>people.stream().
       map(Person::getName).
       forEach(System.out::println);</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
    
### Whitespace{#whitespace}
#### Vertical Whitespace
<ul class="conventions">
 <li>A single blank line should be used to separate…
  <ul class="spread">
   <li>Copyright notice</li>
   <li>Package declaration</li>
   <li>Class declarations</li>
   <li>Constructors</li>
   <li>Methods</li>
   <li>Static initializers</li>
   <li>Instance initializers</li>
  </ul>
  …and may be used to separate logical groups of
  <ul class="spread">
   <li>import statements</li>
   <li>fields</li>
   <li>statements</li>
  </ul>
 </li>
 <li>Multiple consecutive blank lines should only be used to separate groups of related members and not as the standard inter-member spacing.</li>
</ul>
        
#### Horizontal Whitespace
<ul class="conventions">
 <li>A single space should be used…
  <ul class="spread">
   <li>To separate keywords from neighboring opening or closing brackets and braces</li>
   <li>Before and after all binary operators and operator like symbols such as arrows in lambda expressions and the colon in enhanced for loops (but not before the colon of a label)</li>
   <li>After `//` that starts a comment.</li>
   <li>After commas separating arguments and semicolons separating the parts of a for loop.</li>
   <li>After the closing parenthesis of a cast.</li>
  </ul>
 </li>
 <li>In variable declarations it is not recommended to align types and variables.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">int</span> someInt;
String myString;
<span class="keyword">char</span> aChar;
<span class="keyword">long</span> sixtyfourFlags;</code></pre>
<pre><code><span class="keyword">if</span> (isFlagSet(GO)) {
    …
}</code></pre>
<pre><code>IntUnaryOperator inc = x -&gt; x + <span class="literal">1</span>;</code></pre>
<pre><code>init: {
    …
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">int</span>    someInt;
String myString;
<span class="keyword">char</span>   aChar;
<span class="keyword">long</span>   sixtyfourFlags;</code></pre>
<pre><code><span class="keyword">if</span>( isFlagSet( GO ) ) {
    …
}</code></pre>
<pre><code>IntUnaryOperator inc = x-&gt;x + <span class="literal">1</span>;</code></pre>
<pre><code>init : {
    …
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

<div class="box">
<div class="boxheader">Motivation</div>
The improvement in readability when aligning variable names is negligible compared to the efforts needed to keep them aligned as the code evolves. Realigning all variables when one of the types change also causes unnecessarily complicated patches to review.
</div>
        
### Variable Declarations{#variable-declarations}
<ul class="conventions">
    <li>One variable per declaration (and at most one declaration per line)</li>
    <li>Square brackets of arrays should be at the type (`String[] args`) and not on the variable (`String args[]`).</li>
    <li>Declare a local variable right before it is first used, and initialize it as close to the declaration as possible.</li>
</ul>

### Annotations{#annotations}
<ul class="conventions">
    <li>Declaration annotations should be put on a separate line from the declaration being annotated.</li>
    <li>Few/short annotations annotating a single-line method may however be put on the same line as the method if it improves readability.</li>
    <li>Either all annotations should be put on the same line or each annotation should be put on a separate line.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code>@Deprecated
@Override
<span class="keyword">public</span> <span class="keyword">void</span> foo() {
    …
}</code></pre>
<pre><code>@Deprecated @Override
<span class="keyword">public</span> <span class="keyword">void</span> foo() {
    …
}</code></pre>
<pre><code>addListener(<span class="keyword">new</span> Listener() {
 
    <span class="comment">// Ignored events
</span>    @Override <span class="keyword">public</span> <span class="keyword">void</span> event1() { }
    @Override <span class="keyword">public</span> <span class="keyword">void</span> event2() { }
    @Override <span class="keyword">public</span> <span class="keyword">void</span> event3() { }
 
    <span class="comment">// Important event
</span>    @Override
    <span class="keyword">public</span> <span class="keyword">void</span> event4() {
        …
    }
});</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code>@Override @Deprecated <span class="keyword">public</span> <span class="keyword">void</span> foo() {
    …
}</code></pre>
<pre><code>@Override @Deprecated
@SafeVarargs
<span class="keyword">public</span> <span class="keyword">void</span> foo() {
    …
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
### Lambda Expressions{#lambda-expressions}
<ul class="conventions">
    <li>Expression lambdas are preferred over single-line block lambdas.</li>
    <li>Method references should generally be preferred over lambda expressions.<br /><br />
        For bound instance method references, or methods with arity greater than one, a lambda expression may be easier to understand and therefore preferred. Especially if the behavior of the method is not clear from the context.
    </li>
    <li>The parameter types should be omitted unless they improve readability.</li>
    <li>If a lambda expression stretches over more than a few lines, consider creating a method.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code>Runnable r = () -&gt; System.out.println(<span class="literal">"Hello World"</span>);</code></pre>
<pre><code>Supplier&lt;String&gt; c = () -&gt; <span class="literal">"Hello World"</span>;</code></pre>
<pre><code><span class="comment">// Collection::contains is a simple unary method and its behavior is
</span><span class="comment">// clear from the context. A method reference is preferred here.
</span>appendFilter(goodStrings::contains);</code></pre>
<pre><code><span class="comment">// A lambda expression is more readable in this case
</span><span class="comment">// (cf. corresponding example in Don'ts section)
</span>trackTemperature((time, temp) -> tempMap.put(time, temp));</code></pre>
<pre><code>Function&lt;Person, String&gt; nameFunc = p -&gt; p.getFirstName() + <span class="literal">" "</span> + p.getLastName();</code></pre>
<pre><code><span class="keyword">class</span> Util {
    <span class="keyword">private</span> <span class="keyword">static</span> String getCapitalizedFirstName(Person p) {
        String first = p.getFirstName();
        <span class="keyword">char</span> initial = Character.toUpperCase(first.charAt(<span class="literal">0</span>));
        <span class="keyword">return</span> initial + first.substring(<span class="literal">1</span>);
    }
 
    <span class="keyword">static</span> <span class="keyword">void</span> printAllPeople(List&lt;Person&gt; people) {
        people.stream()
              .map(Util::getCapitalizedFirstName)
              .forEach(System.out::println);
    }
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code>Runnable r = () -&gt; { System.out.println(<span class="literal">"Hello World"</span>); };</code></pre>
<pre><code>Supplier&lt;String&gt; s = () -&gt; { <span class="keyword">return</span> <span class="literal">"Hello World"</span>; };</code></pre>
<pre><code><span class="comment">// A lambda expression is not needed here
</span>appendFilter(s -> goodStrings.contains(s));</code></pre>
<pre><code><span class="comment">// Map::put is a binary function, and it’s not clear from context what type
</span><span class="comment">// of argument trackTemperature accepts. A lambda expression is better here.
</span>trackTemperature(tempMap::put);</code></pre>
<pre><code><span class="comment">// Unnecessary parameter type
</span>Function&lt;Person, String&gt; nameFunc = (Person p) -&gt; p.getFirstName() + <span class="literal">" "</span> + p.getLastName();</code></pre>
<pre><code><span class="keyword">class</span> Util {
    <span class="keyword">static</span> <span class="keyword">void</span> printAllPeople(List&lt;Person&gt; people) {
        people.stream()
              .map(p -&gt; {
                  String first = p.getFirstName();
                  <span class="keyword">char</span> initial = Character.toTitleCase(first.charAt(<span class="literal">0</span>));
                  <span class="keyword">return</span> initial + first.substring(<span class="literal">1</span>);
              })
              .forEach(System.out::println);
    }
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

### Redundant Parentheses{#redundant-parentheses}
<ul class="conventions">
    <li>Redundant grouping parentheses (i.e. parentheses that does not affect evaluation) may be used if they improve readability.</li>
    <li>Redundant grouping parentheses should typically be left out in shorter expressions involving common operators but included in longer expressions or expressions involving operators whose precedence and associativity is unclear without parentheses. Ternary expressions with non-trivial conditions belong to the latter.</li>
    <li>The entire expression following a return keyword must not be surrounded by parentheses.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">return</span> flag ? <span class="literal">"yes"</span> : <span class="literal">"no"</span>;</code></pre>
<pre><code>String cmp = (flag1 != flag2) ? <span class="literal">"not equal"</span> : <span class="literal">"equal"</span>;</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">return</span> (flag ? <span class="literal">"yes"</span> : <span class="literal">"no"</span>);</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

### Literals{#literals}
<ul class="conventions">
    <li>`long` literals should use the upper case letter `L` suffix.</li>
    <li>Hexadecimal literals should use upper case letters `A`-`F`.</li>
    <li>All other numerical prefixes, infixes, and suffixes should use lowercase letters.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">long</span> l = <span class="literal">5432L</span>;
<span class="keyword">int</span> i = <span class="literal">0x123</span> + <span class="literal">0xABC</span>;
<span class="keyword">byte</span> b = <span class="literal">0b1010</span>;
<span class="keyword">float</span> f1 = <span class="literal">1</span> / <span class="literal">5432f</span>;
<span class="keyword">float</span> f2 = <span class="literal">0.123e4f</span>;
<span class="keyword">double</span> d1 = <span class="literal">1</span> / <span class="literal">5432d</span>;  <span class="comment">// or 1 / 5432.0
</span><span class="keyword">double</span> d2 = <span class="literal">0x1.3p2</span>;</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">long</span> l = <span class="literal">5432l</span>;
<span class="keyword">int</span> i = <span class="literal">0X123</span> + <span class="literal">0xabc</span>;
<span class="keyword">byte</span> b = <span class="literal">0B1010</span>;
<span class="keyword">float</span> f1 = <span class="literal">1</span> / <span class="literal">5432F</span>;
<span class="keyword">float</span> f2 = <span class="literal">0.123E4f</span>;
<span class="keyword">double</span> d1 = <span class="literal">1</span> / <span class="literal">5432D</span>;
<span class="keyword">double</span> d2 = <span class="literal">0x1.3P2</span>;</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
    
<div class="box">
<div class="boxheader">Motivation</div>
Lower case L resembles a 1 in many monospace fonts which means that the literal `5432l` can be confused with `54321`. Using upper case `L` suffix avoids this. The lowercase `0x`, `0b`, `e`, `p`, `f`, and `d` characters are easier to spot in a long sequence of digits, and they avoid confusion with the hexadecimal digits `A`-`F`.
</div>

### Javadoc{#javadoc}
This section only covers basic Javadoc formatting. For a complete reference refer to &nbsp;<a href="http://www.oracle.com/technetwork/articles/java/index-137868.html">How to Write Doc Comments for the Javadoc Tool</a>.
<ul class="conventions">
    <li>Start longer comments with a short summarizing sentence since Javadoc includes this in the method summary table.</li>
    <li>Prefer inline tags (such as `{@code …}` and `{@link …}` etc) over corresponding HTML tags (<code>&lt;code&gt;…&lt;/code&gt;</code>, <code>&lt;a href=&quot;…&quot;&gt;…&lt;/a&gt;</code> etc).</li>
    <li>Use `<p>` to separate paragraphs (closing `</p>` tags are not needed and should not be used)</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="comment">/** A short javadoc comment */</span></code></pre>
<pre><code><span class="comment">/**
 * …
 *
 * &lt;blockquote&gt;{@code
 *     List&lt;String&gt; names;
 * }&lt;/blockquote&gt;
 */</span></code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="comment">/** put on single line instead
 */</span></code></pre>
<pre><code><span class="comment">/**
 * The &lt;String&gt; below may interfere with the HTML!
 *
 * &lt;blockquote&gt;&lt;pre&gt;
 *     List&lt;String&gt; names;
 * &lt;/pre&gt;&lt;/blockquote&gt;
 */</span></code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
## Naming{#naming}
<ul class="conventions">
    <li>Avoid hiding/shadowing methods, variables and type variables in outer scopes.</li>
    <li>Let the verbosity of the name correlate to the size of the scope. (For instance, use descriptive names for fields of large classes and brief names for local short-lived variables.)</li>
    <li>When naming public static members, let the identifier be self descriptive if you believe they will be statically imported.</li>
</ul>

### Package Names{#package-names}
<ul class="conventions">
    <li>Package names should be all lower case without underscores or other special characters.</li>
    <li>Don’t use plural form. Follow the convention of the standard API which uses for instance `java.lang.annotation` and not `java.lang.annotations`.</li>
</ul>

### Class, Interface and Enum Names{#class--interface-and-enum-names}
<ul class="conventions">
    <li>Class and enum names should typically be nouns.</li>
    <li>Interface names should typically be nouns or adjectives ending with <i>…able</i>.</li>
    <li>Use mixed case with the first letter in each word in upper case.</li>
    <li>Use whole words and avoid using abbreviations unless the abbreviation is more widely used than the long form.</li>
    <li>Format an abbreviation as a word if the it is part of a longer class name.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">class</span> EmptyCell {
    …
}</code></pre>
<pre><code><span class="keyword">class</span> RunningMode {
    …
}</code></pre>
<pre><code><span class="keyword">interface</span> Expandable {
    …
}</code></pre>
<pre><code><span class="keyword">class</span> XmlParser {
    …
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">class</span> Empty {
    …
}</code></pre>
<pre><code><span class="keyword">class</span> Running {
    …
}</code></pre>
<pre><code><span class="keyword">class</span> Expandable {
    …
}</code></pre>
<pre><code><span class="comment">// Abbreviation should be formatted as 'Xml'
</span><span class="keyword">class</span> XMLParser {
    …
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
### Method Names{#method-names}
<ul class="conventions">
    <li>Method names should typically be verbs or other descriptions of actions.</li>
    <li>Use mixed case with the first letter in lower case.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">public</span> <span class="keyword">void</span> expand() {
    …
}</code></pre>
<pre><code><span class="keyword">public</span> <span class="keyword">boolean</span> isExpanding() {
    …
}</code></pre>
<pre><code><span class="keyword">public</span> State getState() {
    …
}</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">public</span> <span class="keyword">boolean</span> expanding() {
    …
}</code></pre>
<pre><code><span class="keyword">public</span> State GetState() {
    …
}</code></pre>
<pre><code><span class="keyword">public</span> <span class="keyword">int</span> get_index() {
    …
}</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
### Variables{#variables}
<ul class="conventions">
    <li>Variable names should be in mixed case with the first letter in lower case.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">int</span> currentIndex;
<span class="keyword">boolean</span> dataAvailable;
</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">int</span> current_index;
<span class="keyword">boolean</span> DataAvailable;</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>

### Type Variables{#type-variables}
<ul class="conventions">
    <li>For simple cases where there are few type variables involved use a single upper case letter.</li>
    <li>If one letter is more descriptive than another (such as `K` and `V` for keys and values in maps or `R` for a function return type) use that, otherwise use `T`.</li>
    <li>For complex cases where single letter type variables become confusing, use longer names written in all capital letters and use underscore (`_`) to separate words.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">interface</span> SpecialMap&lt;K, V&gt; <span class="keyword">extends</span> Map&lt;K, V&gt; {
    …
}
</code></pre>
<pre><code><span class="keyword">class</span> GraphMapper&lt;SRC_VERTEX, SRC_EDGE, DST_VERTEX, DST_EDGE&gt; {
    …
}
</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">interface</span> SpecialMap&lt;Key, Value&gt; <span class="keyword">extends</span> Map&lt;Key, Value&gt; {
    …
}
</code></pre>
<pre><code><span class="keyword">class</span> GraphMapper&lt;S, T, U, V&gt; {
    …
}
</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
### Constants{#constants}
<ul class="conventions">
    <li>Constants (static final fields whose content is immutable, by language rules or by convention) should be named with all capital letters and underscore (`_`) to separate words.</li>
</ul>
<div>
<div class="leftcol">
<div class="box">
<div class="boxheader dos">Dos</div>
<pre><code><span class="keyword">public</span> <span class="keyword">static</span> <span class="keyword">final</span> <span class="keyword">int</span> BUFFER_SIZE = <span class="literal">1024</span>;</code></pre>
<pre><code><span class="keyword">enum</span> ApplicationMode { RUNNING, PAUSED, TERMINATED }</code></pre>
</div>
</div>
<div class="rightcol">
<div class="box">
<div class="boxheader donts">Don’ts</div>
<pre><code><span class="keyword">public</span> <span class="keyword">final</span> List&lt;String&gt; CURRENT_WORDS = <span class="keyword">new</span> ArrayList&lt;&gt;();</code></pre>
<pre><code><span class="keyword">enum</span> ApplicationMode { Running, Paused, Terminated }</code></pre>
</div>
</div>
<p style="clear: both"></p>
</div>
        
        
## Programming Practices{#programming-practices}
The focus of the guidelines in this document is on style. General guidelines on best programming practices, use of design patterns, how to structure programs etc is thus out of scope.&nbsp;A few &ldquo;low level&rdquo; practices that are easy to pin down is however good to agree upon.
<ul class="conventions">
    <li>Always use `@Override` where it is possible to do so.</li>
    <li>Document any non-obvious pre and post conditions (also for private methods). In particular, all parameters / return values are assumed to be non-null unless explicitly stated otherwise.</li>
    <li>Avoid checking in &ldquo;`TODO`&rdquo; comments. If the missing code doesn’t affect correctness or performance, skip the comment, otherwise file an issue for it.</li>
    <li>Avoid checking in dead code.</li>
    <li>Static mutable state should be used judiciously. In particular enums should not have mutable state, and any public static variable must also be final.</li>
    <li>Static methods and fields that are accessed out of scope should be qualified with the identifier of the class that declares them and not with a subclass or an instance variable.</li>
    <li>Fall through on non-empty cases in switch statements should be documented, typically with a &ldquo;`// fall through`&rdquo; comment.</li>
    <li>Mutating method parameters is discouraged. This is because parameters are typically associated with the input values and by mutating these the code may be harder to understand, especially when only looking at parts of the method below the mutation.</li>
    <li>Keep methods short. Consider splitting up long methods into smaller ones to limit variable scopes and simplify structure of the code.</li>
</ul>

### Commenting Code{#commenting-code}
<ul class="conventions">
    <li>First and foremost, try to make the code simple enough that it’s self explanatory. While comments explaining the code are good, not having to explain the code is better.</li>
    <li>For single line comments, use end-of-line comments (`//`) otherwise use multiline comments (`/* … */`).</li>
    <li>Avoid comments that run the risk of getting out of sync as the code evolves. (If a comment runs the risk of getting out of sync, it’s often a sign that it comments how the code works rather than what the code achieves.)</li>
    <li>Small well documented methods are preferred over longer methods with comments in the body of the method.</li>
    <li>Don’t check in code that’s commented out.</li>
    <li>IDE/tool-specific comments should be avoided wherever possible, especially when there are reasonable alternatives, such as external settings files, etc.</li>
    <li>Comments should be grammatically correct and follow general recommendations of technical writing.</li>
</ul>
    
## When to reformat code{#when-to-reformat-code}
<ul class="conventions">
    <li>Do not reformat code in files unrelated to the current changeset, even if the code doesn’t adhere to the guidelines.</li>
    <li>Minor cleanups in files that are already touched for other reasons are fine. Put the cleanups in a separate patch if you think it will simplify the review process. Large cleanups should always go in a separate changeset.</li>
</ul>
<div class="box">
<div class="boxheader">Motivation</div>
Cleaning up code that’s unrelated to the patch may…
<ul>
<li>Complicate the review of the patch in which case correctness may suffer</li>
<li>Run the risk of breaking existing code</li>
<li>Have a downstream impact, e.g. affect ports to other versions.</li>
<li>Trigger an unnecessary debate (perhaps the original formatting was intentional).</li>
</ul>
</div>

## Cases not covered{#cases-not-covered}
<ul class="conventions">
    <li>If some aspect is not covered by these guidelines one should fall back on the style of the surrounding code within the same file, within the package or within the project in that order.</li>
</ul>

::: {.NavBit}
[« Previous](mailinglists.html) • [TOC](index.html) • [Next »](changePlanning.html)
:::
