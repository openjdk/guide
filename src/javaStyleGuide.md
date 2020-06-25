% Java Style Guide

::: {.NavBit}
[« Previous](mailinglists.html) • [TOC](index.html) • [Next »](changePlanning.html)
:::

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
- [Naming](#naming)  
  - [Package Names](#package-names)  
  - [Class, Interface and Enum Names](#class-interface-and-enum-names)  
  - [Method Names](#method-names)  
  - [Variables](#variables)  
  - [Type Variables](#type-variables)  
  - [Constants](#constants)  
- [Programming Practices](#programming-practices)  
  - [Commenting Code](#commenting-code)  
- [When to reformat code](#when-to-reformat-code)  
- [Cases not covered](#cases-not-covered)  

## Java Source Files

::: conventions
- Source files must be encoded in 7-bit ASCII.
- All lines must be terminated with a line feed character (`LF`, ASCII value 10) and *not* for instance `CR` or `CR`+`LF`.
- There may be no trailing white space at the end of a line.
- The name of a source file must equal the name of the class it contains followed by the `.java` extension, even for files that only contain a package private class. This does not apply to files that do not contain any class declarations, such as `package-info.java`.
:::

::: box
[Motivation]{.boxheader}
7-bit ASCII reduces errors due to confusion of characters since there are no invisible spaces, characters that look like minus signs but are really dashes, etc. It also ensures packages and classes are named in such way that the corresponding directories and source files are portable across different filesystems.
  
Agreeing on a common line delimiter character is important since different operating systems have different defaults. Editing a file on Windows that was originally written on Linux, may cause all `LF` to be saved back as `CR`+`LF`. This creates unnecessarily big patches and may not display correctly in the text editor it was originally written in. A single line feed character is default for Unix-like systems and supported by all common text editors and IDEs.

Trailing white space is nothing but unnecessary cruft. It’s easy to remove and agreeing on doing so consistently minimizes diffs.

Not using the name of the class as filename can be confusing. Also, unless the file is given explicitly to the compiler, the class it contains may not be resolved correctly.
:::

### Special Characters
::: conventions
- Apart from `LF` the only allowed white space character is Space (ASCII value 32). Note that this implies that other white space characters (in, for instance, string and character literals) must be written in escaped form.
- `\'`, `\"`, `\\`, `\t`, `\b`, `\r`, `\f`, and `\n` should be preferred over corresponding octal (e.g. `\047`) or Unicode (e.g. `\u0027`) escaped characters.
- Should there be a need to go against the above rules for the sake of testing, the test should generate the required source.
:::

::: box
[Motivation]{.boxheader}
Having any white space character but space and `LF` in the source code can be a source of confusion.

The short forms (e.g. `\t`) are commonly used and easier to recognize than the corresponding longer forms (`\011`, `\u0009`).
:::

## Formatting
::: conventions
- A Java source file should be structured as follows:
  #. The copyright notice
  #. Package declaration
  #. Import statements
  #. Class declaration
- There may be only one top level class declaration per file.
:::

### Copyright notice
::: conventions
- All source files should have an appropriate copyright notice at the top of the file.

- For files under Oracle copyright, the copyright notice must follow the standard wording and format. In particular the first two lines should be

  ~~~java
  /*
   * Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
  ~~~

  or

  ~~~java
  /*
   * Copyright (c) 2011, 2015, Oracle and/or its affiliates. All rights reserved.
  ~~~

  where the first year is the year the file was created and the second year is the year the file was last edited.
:::

For questions regarding Oracle copyright or license notices, please contact [iris.clark@oracle.com](mailto:iris.clark@oracle.com).

### Package declaration
::: conventions
- The package declaration should not be line wrapped, regardless of whether it exceeds the recommended maximum length of a line. (See section on [Wrapping Lines](#wrapping-lines).)
:::

### Import statements
::: conventions
- Import statements should be sorted…
  - …primarily by non-static / static with non-static imports first.
  - …secondarily by package origin according to the following order
    - `java` packages
    - `javax` packages
    - external packages (e.g. `org.xml`)
    - internal packages (e.g. `com.sun`)
  - …tertiary by package and class identifier in lexicographical order
- Import statements should not be line wrapped, regardless of whether it exceeds the recommended maximum length of a line.
- No unused imports should be present.
:::

#### Wildcard Imports
::: conventions
- Wildcard imports should in general not be used.
- When importing a large number of closely-related classes (such as implementing a visitor over a tree with dozens of distinct “node” classes), a wildcard import may be used.
- In any case, no more than one wildcard import per file should be used.
:::

::: box
[Motivation]{.boxheader}
Wildcard imports makes it unclear what actually needs to be imported.

Having more than one wildcard import makes the code fragile since adding a new class in one of the imported packages can introduce a name clash.

An unused import gives a false impression of a dependency. Also, many IDEs list such import statements as warnings which clutters the list of problems.
:::

### Class Structure
::: conventions
- The recommended order of class members is the following:
  #. Fields
  #. Constructors
  #. Factory methods
  #. Other Methods
- Related fields should be grouped together. Ordering fields primarily according to access modifiers or identifier is not required. The same applies to methods.
- Nested types should be grouped at the top of the class, or else defined before first use.
:::

#### Order of Constructors and Overloaded Methods
::: conventions
- Constructors and overloaded methods should be grouped together by functionality and ordered with increasing arity. This implies that delegation among these constructs flow downward in the code.
- Constructors and overloaded methods should generally not be split apart by other members.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
public HashSet() {
    this(DEFAULT_INITIAL_CAPACITY);
}

public HashSet(int capacity) {
    this(capacity, DEFAULT_LOAD_FACTOR);
}

public HashSet(int capacity, double loadFactor) {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
// Overloaded methods should not be split apart
void logValue(int i) {
    log("Int: %d", i);
}

void setValue(int i) {
    val = i;
}

void logValue(double d) {
    log("Double: %.2d", d);
}

void setValue(double d) {
    val = d;
}
~~~

:::
:::

::: box
[Motivation]{.boxheader}
This order puts the most generally applicable versions first. Also, making sure delegation is always done downwards in the file makes the code easier to follow.
:::

### Modifiers
::: conventions
- Modifiers should go in the following order
  #. Access modifier (`public` / `private` / `protected`)
  #. `abstract`
  #. `static`
  #. `final`
  #. `transient`
  #. `volatile`
  #. `default`
  #. `synchronized`
  #. `native`
  #. `strictfp`
- Modifiers should not be written out when they are implicit. For example, interface methods should neither be declared public nor abstract, and nested enums and interfaces should not be declared static.
- Method parameters and local variables should not be declared final unless it improves readability or documents an actual design decision.
- Fields should be declared final unless there is a compelling reason to make them mutable.
:::

::: box
[Motivation]{.boxheader}
Writing out modifiers where they are implicit clutters the code and learning which modifiers are implicit where is easy.

Although method parameters should typically not be mutated, consistently marking all parameters in every methods as `final` is an exaggeration.

Making fields immutable where possible is good programming practice. Refer to *Effective Java, Item 15: Minimize Mutability* for details.
:::

### Braces
::: conventions
- Opening braces should be put on the end of the current line rather than on a line by its own.
- There should be a new line in front of a closing brace unless the block is empty (see [Short Forms](#short-forms) below)
- Braces are recommended even where the language makes them optional, such as single-line if and loop bodies.
  - If a block spans more than one line (including comments) it must have braces.
  - If one of the blocks in a if / else statement has braces, the other block must too.
  - If the block comes last in an enclosing block, it must have braces.
- The `else`,&nbsp;`catch` and the `while` keyword in `do`…`while` loops go on the same line as the closing brace of the preceding block.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
void method() {
    …
}
~~~

~~~java
try {
    something();
} catch (AnException e) {
    …
}
~~~

~~~java
for (int[] row : matrix) {
    for (int val : row) {
        sum += val;
    }
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
// Wrong placement of opening brace
void method()
{
    …
}
~~~

~~~java
// Newline in front of catch should be avoided
try {
    something();
}
catch (AnException e) {
    …
}
~~~

~~~java
// Braces should be used
if (flag)
    // Restore x
    x = 1;
~~~

~~~java
// Use braces if block comes last in enclosing block
// to avoid accidentally indenting the closing brace.
for (int[] row : matrix) {
    for (int val : row)
        sum += val;
}
~~~

:::
:::

::: box
[Motivation]{.boxheader}
Putting opening braces on the end of the line (as opposed to on a line of its own) is a long standing Java convention. This style is also suitable for Java, considering that it’s common to have small blocks (in for instance anonymous classes and lambda expressions) and having opening braces on a separate line creates an unnecessary amount of white space in such situations.

Omitting braces is error prone and can lead to mistakes in the indentation and hard to detect bugs.
:::

#### Short Forms
::: conventions
- The above recommendations are intended to improve uniformity (and thus increase familiarity / readability). In some cases “short forms” that deviate from the above guidelines are just as readable and may be used instead. These cases include for instance simple enum declarations and trivial methods and lambda expressions.
:::


::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
enum Response { YES, NO, MAYBE }
~~~

~~~java
public boolean isReference() { return true; }
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
public boolean getResult() { int value = getValue(); return value < 0 ? 0 : value; }
~~~

~~~java
for (int i = 0; i < size; i++) { sum += data[i]; }
~~~

:::
:::


### Indentation
::: conventions
- Indentation level is four spaces.
- Only space characters may be used for indentation. No tabs.
- Empty lines must not be indented. (This is implied by the no trailing white space rule.)
- `case` lines should be indented with four spaces, and statements within the case should be indented with another four spaces.
:::
Refer to Section&nbsp;[Wrapping Lines](#wrapping-lines)&nbsp;for guidelines on how to indent continuation lines.

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
switch (var) {
    case TWO:
        setChoice("two");
        break;
    case THREE:
        setChoice("three");
        break;
    default:
        throw new IllegalArgumentException();
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
switch (var) {
case TWO:
    setChoice("two");
    break;
case THREE:
    setChoice("three");
    break;
default:
    throw new IllegalArgumentException();
}
~~~

:::
:::


::: box
[Motivation]{.boxheader}
By using spaces for indentation, problems regarding different default settings for tab stops in various editors are avoided.
:::

### Wrapping Lines
::: conventions
- Source code and comments should generally not exceed 80 characters per line and rarely if ever exceed 100 characters per line, including indentation.

  ::: box
  ::: boxheader
  Note
  :::
  The character limit must be judged on a case by case basis. What really matters is the semantical “density” and readability of the line. Making lines gratuitously long makes them hard to read; similarly, making “heroic attempts” to fit them into 80 columns can also make them hard to read. The flexibility outlined here aims to enable developers to avoid these extremes, not to maximize use of monitor real-estate.
  :::

  ::: leftcol
  ::: box
  ::: {.boxheader .dos}
  Dos
  :::
  
  ~~~java
  // Ok even though it might exceed the character limit when indented.
  Error e = isTypeParam
          ? Errors.InvalidRepeatableAnnotationNotApplicable(targetContainerType, on)
          : Errors.InvalidRepeatableAnnotationNotApplicableInContext(targetContainerType));
  ~~~
  
  ~~~java
  String pretty = Stream.of(args)
                        .map(Argument::prettyPrint)
                        .collectors(joining(", "));
  ~~~

  :::
  :::

  ::: rightcol
  ::: box
  ::: {.boxheader .donts}
  Don’ts
  :::

  ~~~java
  // Too strict interpretation of the character limit. Readability suffers.
  Error e = isTypeParam
        ? Errors.InvalidRepeatableAnnotationNotApplicable(
                targetContainerType, on)
        : Errors.InvalidRepeatableAnnotationNotApplicableInContext(
                targetContainerType);
  ~~~

  ~~~java
  // Should be wrapped even though it fits within the character limit
  String pretty = Stream.of(args).map(Argument::prettyPrint).collectors(joining(", "));
  ~~~

  :::
  :::

  ::: clear-floats
  :::

- URLs or example commands should not be wrapped.
- Wrapping at a higher syntactical level is preferred over wrapping at a lower syntactical level.

  ::: leftcol
  ::: box
  ::: {.boxheader .dos}
  Dos
  :::

  ~~~java
  aMethodCall(withMany(arguments, that, needs),
          to(be, (wrapped - to) * avoid / veryLong - lines));
  ~~~

  :::
  :::

  ::: rightcol
  ::: box
  ::: {.boxheader .donts}
  Don’ts
  :::

  ~~~java
  aMethodCall(withMany(arguments, that, needs), to(be, (wrapped
          - to) * avoid / veryLong - lines));
  ~~~

  :::
  :::

  ::: clear-floats
  :::

- There should be at most 1 statement per line.

  ::: leftcol
  ::: box
  ::: {.boxheader .dos}
  Dos
  :::

  ~~~java
  i += j;
  j += k;
  ~~~

  ~~~java
  if (condition) {
      return expression;
  }
  ~~~

  :::
  :::

  ::: rightcol
  ::: box
  ::: {.boxheader .donts}
  Don’ts
  :::

  ~~~java
  i += j; j += k;
  ~~~

  ~~~java
  if (condition) { return expression; }
  ~~~

  :::
  :::

  ::: clear-floats
  :::

- A continuation line should be indented in one of the following four ways
  - **Variant 1:** With 8 extra spaces relative to the indentation of the previous line.
  - **Variant 2:** With 8 extra spaces relative to the starting column of the wrapped expression.
  - **Variant 3:** Aligned with previous sibling expression (as long as it is clear that it’s a continuation line)
  - **Variant 4:** Aligned with previous method call in a chained expression.

  ::: leftcol
  ::: box
  ::: {.boxheader .dos}
  Dos
  :::

  ~~~java
  // Variant 1
  int anInteger = aMethod(that, takes,
          a, lengthy, list, of, arguments);
  ~~~

  ~~~java
  // Variant 2
  int anInteger = that * (is + computed) / using
                          + a * complex - expression;
  ~~~

  ~~~java
  // Variant 3
  int anInteger = aMethod(thatTakes,
                          aLongList,
                          ofArguments);
  ~~~

  ~~~java
  // Variant 4
  int anInteger = IntStream.of(numbers)
                           .map(Math::sqrt)
                           .sum();
  ~~~

  :::
  :::

  ::: rightcol
  ::: box
  ::: {.boxheader .donts}
  Don’ts
  :::

  ~~~java
  // Mixing of wrapping variants (unless there
  // is a logical grouping of arguments)
  int anInteger = aMethod(that,
                          takes,
                          a, lengthy, list,
                          of, arguments);
  ~~~

  ~~~java
  // Don't align with sibling expression if the
  // continuation line can be confused with a block
  // indentation
  if (somePredicate() ||
      someOtherPredicate()) {
      System.out.println("Avoid");
  }
  ~~~

  :::
  :::

  ::: clear-floats
  :::
:::

#### Wrapping Class Declarations
::: conventions
- A class header should not be wrapped unless it approaches the maximum column limit.
- If it does, it may be wrapped before `extends` and/or `implements` keywords.
- Declarations of type parameters may, if necessary, be wrapped the same way as method arguments
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
public class MyGenericClass<T, S>
        extends HashMap<T, S>
        implements Comparable<T> {
    …
}
~~~

~~~java
public class AnotherClass<K, R> implements Collector<T extends K,
                                                     Set<? extends R>,
                                                     List<R>> {
    …
}
~~~

~~~java
public class AnotherClass<K, R> implements Collector<T extends K,
                                                     Set<? extends R>,
                                                     List<R>> {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
public class MyGenericClass<T> implements Comparable<T>,
        Predicate<T> {
    …
}
~~~

:::
:::


#### Wrapping Method Declarations
::: conventions
- Method declarations can be formatted by listing the arguments vertically, or by a new line and +8 extra spaces
- If a throws clause needs to be wrapped, put the line break in front of the throws clause and make sure it stands out from the argument list, either by indenting +8 relative to the function declaration, or +8 relative to the previous line.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
int someMethod(String aString,
               List<Integer> aList,
               Map<String, String> aMap,
               int anInt,
               long aLong,
               Set<Number> aSet,
               double aDouble) {
    …
}
~~~

~~~java
int someMethod(String aString, List<Integer> aList,
        Map<String, String> aMap, int anInt, long aLong,
        double aDouble, long aLong) {
    …
}
~~~

~~~java
int someMethod(String aString,
               List<Map<Integer, StringBuffer>> aListOfMaps,
               Map<String, String> aMap)
        throws IllegalArgumentException {
    …
}
~~~

~~~java
int someMethod(String aString, List<Integer> aList,
        Map<String, String> aMap, int anInt)
                throws IllegalArgumentException {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
// If aligning the parameters vertically, don't put two
// parameters on one line
int someMethod(String aString,
               List<Integer> aList,
               Map<String, String> aMap,
               int anInt, long aLong,
               Set<Number> aSet,
               double aDouble) {
    …
}
~~~

~~~java
int someMethod(String aString,
               List<Map<Integer, StringBuffer>> aListOfMaps,
               Map<String, String> aMap) throws InterruptedException {
    …
}
~~~

~~~java
int someMethod(String aString,
               List<Integer> aList,
               Map<String, String> aMap)
               throws IllegalArgumentException {
    …
}
~~~

:::
:::


#### Wrapping Expressions
::: conventions
- If a line approaches the maximum character limit, always consider breaking it down into multiple statements / expressions instead of wrapping the line.
- Break before operators.
- Break before the `.` in chained method calls.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
methodCall(a * simple - formula,
           some + complex - formula * spanning
                        + multiple - lines * may
                        + look - as * follows);
~~~

~~~java
popupMsg("Inbox notification: You have "
        + newMsgs + " new messages");
~~~

~~~java
people.stream()
      .map(Person::getName)
      .forEach(System.out::println);
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
// Arity unclear
methodCall(a * simple - formula,
           some + complex - formula * spanning +
           multiple - lines * should + not *
           look - as * follows);
~~~

~~~java
// Looks like two arguments
popupMsg("Inbox notification: You have " +
         newMsgs + " new messages");
~~~

~~~java
people.stream().
       map(Person::getName).
       forEach(System.out::println);
~~~

:::
:::

    
### Whitespace
#### Vertical Whitespace
::: conventions
- A single blank line should be used to separate…
  - Copyright notice
  - Package declaration
  - Class declarations
  - Constructors
  - Methods
  - Static initializers
  - Instance initializers

  …and may be used to separate logical groups of

  - import statements
  - fields
  - statements
- Multiple consecutive blank lines should only be used to separate groups of related members and not as the standard inter-member spacing.
:::

#### Horizontal Whitespace
::: conventions
- A single space should be used…
  - To separate keywords from neighboring opening or closing brackets and braces
  - Before and after all binary operators and operator like symbols such as arrows in lambda expressions and the colon in enhanced for loops (but not before the colon of a label)
  - After `//` that starts a comment.
  - After commas separating arguments and semicolons separating the parts of a for loop.
  - After the closing parenthesis of a cast.
- In variable declarations it is not recommended to align types and variables.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
int someInt;
String myString;
char aChar;
long sixtyfourFlags;
~~~

~~~java
if (isFlagSet(GO)) {
    …
}
~~~

~~~java
IntUnaryOperator inc = x -> x + 1;
~~~

~~~java
init: {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
int    someInt;
String myString;
char   aChar;
long   sixtyfourFlags;
~~~

~~~java
if( isFlagSet( GO ) ) {
    …
}
~~~

~~~java
IntUnaryOperator inc = x->x + 1;
~~~

~~~java
init : {
    …
}
~~~

:::
:::


::: box
[Motivation]{.boxheader}
The improvement in readability when aligning variable names is negligible compared to the efforts needed to keep them aligned as the code evolves. Realigning all variables when one of the types change also causes unnecessarily complicated patches to review.
:::

### Variable Declarations
::: conventions
- One variable per declaration (and at most one declaration per line)
- Square brackets of arrays should be at the type (`String[] args`) and not on the variable (`String args[]`).
- Declare a local variable right before it is first used, and initialize it as close to the declaration as possible.
:::

### Annotations
::: conventions
- Declaration annotations should be put on a separate line from the declaration being annotated.
- Few/short annotations annotating a single-line method may however be put on the same line as the method if it improves readability.
- Either all annotations should be put on the same line or each annotation should be put on a separate line.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
@Deprecated
@Override
public void foo() {
    …
}
~~~

~~~java
@Deprecated @Override
public void foo() {
    …
}
~~~

~~~java
addListener(new Listener() {
 
    // Ignored events
    @Override public void event1() { }
    @Override public void event2() { }
    @Override public void event3() { }
 
    // Important event
    @Override
    public void event4() {
        …
    }
});
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
@Override @Deprecated public void foo() {
    …
}
~~~

~~~java
@Override @Deprecated
@SafeVarargs
public void foo() {
    …
}
~~~

:::
:::


### Lambda Expressions
::: conventions
- Expression lambdas are preferred over single-line block lambdas.
- Method references should generally be preferred over lambda expressions.<br /><br />
  For bound instance method references, or methods with arity greater than one, a lambda expression may be easier to understand and therefore preferred. Especially if the behavior of the method is not clear from the context.
- The parameter types should be omitted unless they improve readability.
- If a lambda expression stretches over more than a few lines, consider creating a method.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
Runnable r = () -> System.out.println("Hello World");
~~~

~~~java
Supplier<String> c = () -> "Hello World";
~~~

~~~java
// Collection::contains is a simple unary method and its behavior is
// clear from the context. A method reference is preferred here.
appendFilter(goodStrings::contains);
~~~

~~~java
// A lambda expression is more readable in this case
// (cf. corresponding example in Don'ts section)
trackTemperature((time, temp) -> tempMap.put(time, temp));
~~~

~~~java
Function<Person, String> nameFunc = p -> p.getFirstName() + " " + p.getLastName();
~~~

~~~java
class Util {
    private static String getCapitalizedFirstName(Person p) {
        String first = p.getFirstName();
        char initial = Character.toUpperCase(first.charAt(0));
        return initial + first.substring(1);
    }
 
    static void printAllPeople(List<Person> people) {
        people.stream()
              .map(Util::getCapitalizedFirstName)
              .forEach(System.out::println);
    }
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
Runnable r = () -> { System.out.println("Hello World"); };
~~~

~~~java
Supplier<String> s = () -> { return "Hello World"; };
~~~

~~~java
// A lambda expression is not needed here
appendFilter(s -> goodStrings.contains(s));
~~~

~~~java
// Map::put is a binary function, and it’s not clear from context what type
// of argument trackTemperature accepts. A lambda expression is better here.
trackTemperature(tempMap::put);
~~~

~~~java
// Unnecessary parameter type
Function<Person, String> nameFunc = (Person p) -> p.getFirstName() + " " + p.getLastName();
~~~

~~~java
class Util {
    static void printAllPeople(List<Person> people) {
        people.stream()
              .map(p -> {
                  String first = p.getFirstName();
                  char initial = Character.toTitleCase(first.charAt(0));
                  return initial + first.substring(1);
              })
              .forEach(System.out::println);
    }
}
~~~

:::
:::


### Redundant Parentheses
::: conventions
- Redundant grouping parentheses (i.e. parentheses that does not affect evaluation) may be used if they improve readability.
- Redundant grouping parentheses should typically be left out in shorter expressions involving common operators but included in longer expressions or expressions involving operators whose precedence and associativity is unclear without parentheses. Ternary expressions with non-trivial conditions belong to the latter.
- The entire expression following a return keyword must not be surrounded by parentheses.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
return flag ? "yes" : "no";
~~~

~~~java
String cmp = (flag1 != flag2) ? "not equal" : "equal";
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
return (flag ? "yes" : "no");
~~~

:::
:::


### Literals
::: conventions
- `long` literals should use the upper case letter `L` suffix.
- Hexadecimal literals should use upper case letters `A`-`F`.
- All other numerical prefixes, infixes, and suffixes should use lowercase letters.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
long l = 5432L;
int i = 0x123 + 0xABC;
byte b = 0b1010;
float f1 = 1 / 5432f;
float f2 = 0.123e4f;
double d1 = 1 / 5432d;  // or 1 / 5432.0
double d2 = 0x1.3p2;
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
long l = 5432l;
int i = 0X123 + 0xabc;
byte b = 0B1010;
float f1 = 1 / 5432F;
float f2 = 0.123E4f;
double d1 = 1 / 5432D;
double d2 = 0x1.3P2;
~~~

:::
:::


::: box
[Motivation]{.boxheader}
Lower case L resembles a 1 in many monospace fonts which means that the literal `5432l` can be confused with `54321`. Using upper case `L` suffix avoids this. The lowercase `0x`, `0b`, `e`, `p`, `f`, and `d` characters are easier to spot in a long sequence of digits, and they avoid confusion with the hexadecimal digits `A`-`F`.
:::

## Naming
::: conventions
- Avoid hiding/shadowing methods, variables and type variables in outer scopes.
- Let the verbosity of the name correlate to the size of the scope. (For instance, use descriptive names for fields of large classes and brief names for local short-lived variables.)
- When naming public static members, let the identifier be self descriptive if you believe they will be statically imported.
:::

### Package Names
::: conventions
- Package names should be all lower case without underscores or other special characters.
- Don’t use plural form. Follow the convention of the standard API which uses for instance `java.lang.annotation` and not `java.lang.annotations`.
:::

### Class, Interface and Enum Names
::: conventions
- Class and enum names should typically be nouns.
- Interface names should typically be nouns or adjectives ending with *…able*.
- Use mixed case with the first letter in each word in upper case.
- Use whole words and avoid using abbreviations unless the abbreviation is more widely used than the long form.
- Format an abbreviation as a word if the it is part of a longer class name.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
class EmptyCell {
    …
}
~~~

~~~java
class RunningMode {
    …
}
~~~

~~~java
interface Expandable {
    …
}
~~~

~~~java
class XmlParser {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
class Empty {
    …
}
~~~

~~~java
class Running {
    …
}
~~~

~~~java
class Expandable {
    …
}
~~~

~~~java
// Abbreviation should be formatted as 'Xml'
class XMLParser {
    …
}
~~~

:::
:::

        
### Method Names
::: conventions
- Method names should typically be verbs or other descriptions of actions.
- Use mixed case with the first letter in lower case.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
public void expand() {
    …
}
~~~

~~~java
public boolean isExpanding() {
    …
}
~~~

~~~java
public State getState() {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
public boolean expanding() {
    …
}
~~~

~~~java
public State GetState() {
    …
}
~~~

~~~java
public int get_index() {
    …
}
~~~

:::
:::



### Variables
::: conventions
- Variable names should be in mixed case with the first letter in lower case.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
int currentIndex;
boolean dataAvailable;
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
int current_index;
boolean DataAvailable;
~~~

:::
:::


### Type Variables
::: conventions
- For simple cases where there are few type variables involved use a single upper case letter.
- If one letter is more descriptive than another (such as `K` and `V` for keys and values in maps or `R` for a function return type) use that, otherwise use `T`.
- For complex cases where single letter type variables become confusing, use longer names written in all capital letters and use underscore (`_`) to separate words.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
interface SpecialMap<K, V> extends Map<K, V> {
    …
}
~~~

~~~java
class GraphMapper<SRC_VERTEX, SRC_EDGE, DST_VERTEX, DST_EDGE> {
    …
}
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
interface SpecialMap<Key, Value> extends Map<Key, Value> {
    …
}
~~~

~~~java
class GraphMapper<S, T, U, V> {
    …
}
~~~

:::
:::


### Constants
::: conventions
- Constants (static final fields whose content is immutable, by language rules or by convention) should be named with all capital letters and underscore (`_`) to separate words.
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
public static final int BUFFER_SIZE = 1024;
~~~

~~~java
enum ApplicationMode { RUNNING, PAUSED, TERMINATED }
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
public final List<String> CURRENT_WORDS = new ArrayList<>();
~~~

~~~java
enum ApplicationMode { Running, Paused, Terminated }
~~~

:::
:::


## Programming Practices
The focus of the guidelines in this section is on style. General guidelines on best programming practices, use of design patterns, how to structure programs etc is thus out of scope.&nbsp;A few “low level” practices that are easy to pin down is however good to agree upon.

::: conventions
- Always use `@Override` where it is possible to do so.
- Document any non-obvious pre and post conditions (also for private methods). In particular, all parameters / return values are assumed to be non-null unless explicitly stated otherwise.
- Avoid checking in “`TODO`” comments. If the missing code doesn’t affect correctness or performance, skip the comment, otherwise file an issue for it.
- Avoid checking in dead code.
- Static mutable state should be used judiciously. In particular enums should not have mutable state, and any public static variable must also be final.
- Static methods and fields that are accessed out of scope should be qualified with the identifier of the class that declares them and not with a subclass or an instance variable.
- Fall through on non-empty cases in switch statements should be documented, typically with a “`// fall through`” comment.
- Mutating method parameters is discouraged. This is because parameters are typically associated with the input values and by mutating these the code may be harder to understand, especially when only looking at parts of the method below the mutation.
- Keep methods short. Consider splitting up long methods into smaller ones to limit variable scopes and simplify structure of the code.
:::

### Commenting Code
::: conventions
- First and foremost, try to make the code simple enough that it’s self explanatory. While comments explaining the code are good, not having to explain the code is better.
- For single line comments, use end-of-line comments (`//`) otherwise use multiline comments (`/* … */`).
- Avoid comments that run the risk of getting out of sync as the code evolves. (If a comment runs the risk of getting out of sync, it’s often a sign that it comments how the code works rather than what the code achieves.)
- Small well documented methods are preferred over longer methods with comments in the body of the method.
- Don’t check in code that’s commented out.
- IDE/tool-specific comments should be avoided wherever possible, especially when there are reasonable alternatives, such as external settings files, etc.
- Comments should be grammatically correct and follow general recommendations of technical writing.
- Start longer Javadoc comments with a short summarizing sentence since Javadoc includes this in the method summary table.
- Prefer inline tags (such as `{@code …}` and `{@link …}` etc) over corresponding HTML tags (`<code>…</code>`, `<a href="…">…</a>` etc).
- Use `<p>` to separate paragraphs (closing `</p>` tags are not needed and should not be used)
:::

::: leftcol
::: box
[Dos]{.boxheader .dos}

~~~java
/** A short javadoc comment */
~~~

~~~java
/**
 * …
 *
 * <blockquote>{@code
 *     List<String> names;
 * }</blockquote>
 */
~~~

:::
:::

::: rightcol
::: box
[Don’ts]{.boxheader .donts}

~~~java
/** put on single line instead
 */
~~~

~~~java
/**
 * The <String> below may interfere with the HTML!
 *
 * <blockquote><pre>
 *     List<String> names;
 * </pre></blockquote>
 */
~~~

:::
:::

For a complete Javadoc reference refer to &nbsp;[How to Write Doc Comments for the Javadoc Tool](http://www.oracle.com/technetwork/articles/java/index-137868.html).

## When to reformat code
::: conventions
- Do not reformat code in files unrelated to the current changeset, even if the code doesn’t adhere to the guidelines.
- Minor cleanups in files that are already touched for other reasons are fine. Put the cleanups in a separate patch if you think it will simplify the review process. Large cleanups should always go in a separate changeset.
:::

::: box
[Motivation]{.boxheader}
Cleaning up code that’s unrelated to the patch may…

- Complicate the review of the patch in which case correctness may suffer
- Run the risk of breaking existing code
- Have a downstream impact, e.g. affect ports to other versions.
- Trigger an unnecessary debate (perhaps the original formatting was intentional).
:::

## Cases not covered
::: conventions
- If some aspect is not covered by these guidelines one should fall back on the style of the surrounding code within the same file, within the package or within the project in that order.
:::

::: {.NavBit}
[« Previous](mailinglists.html) • [TOC](index.html) • [Next »](changePlanning.html)
:::
