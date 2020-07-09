% Producing a Changeset

::: {.NavBit}
[« Previous](jckAcquisition.html) • [TOC](index.html) • [Next »](next.html)
:::

This section is confined to the actual Mercurial mechanics required to produce
a changeset:

* [Setting a JDK User Name](#setting-a-jdk-user-name) reminds
the user to confirm proper configuration.
* [Creating](#creating) includes instructions for the
required format of a changeset comment and describes how to commit files to a
changeset.
* [Merging](#merging) describes how to pull changes
from a parent forest or clone and incorporate the changes into the current
working set of files.
* [Pushing](#pushing) covers configuring ssh, setting
the `default-push` path, and pushing changesets.

## Setting a JDK User Name

Ensure that _ui.username_ has a value in the
`~/.hgrc` file as described in
[Verifying the Configuration](repositories.html#verify).

## Creating

The timing for creating a changeset is important. Creating the changeset long
before it gets pushed into the parent repository may require complex merges. If
a changeset is created before sufficient review or testing, a rollback may be
required and a new changeset may be required to correct previous mistakes. The
[mq extension](http://hgbook.red-bean.com/hgbookch12.html#x16-26500012) is
recommended for managing changes before they become
committed to a changeset.

In the examples below, the script
`common/bin/hgforest.sh` can be used to apply the
Mercurial command to all the repositories in the forest. So when you see
_**`hg`**_, if you are dealing with one repository, just use
"`hg`", if it's a forest, use "`sh common/bin/hgforest.sh`".


Each repository in the forest is managed independently. After editing files in
the individual cloned repositories of the forest, the `hg
status` command may be used to see the changes in a single
repository.

>     $ hg root
>     /u/iris/sandbox/box
>     $ hg status
>     ? duke/images/DukeTubbingSmall.png
>     $ hg add duke/images/DukeTubbingSmall.png
>     $ hg status
>     A duke/images/DukeTubbingSmall.png

To see changes made to the repositories use _**`hg`**_ `status`:

>     $ hg status
>     [.]
>     A duke/images/DukeTubbingSmall.png

In this example, the repository was previously cloned as described in
[Cloning a Sandbox Repository](repositories.html#cloneSandbox). A new file
`DukeTubbingSmall.png` was added to a new subdirectory.

#### Formatting a Changeset Comment

A single change is described by a block of text of the following form:

>     <bugid>: <synopsis-of-symptom>
>     Summary: <summary-of-code-change>
>     Reviewed-by: <reviewer>+
>     Contributed-by: <contributor-email>

There may be more than one _bugid_ line, but there
must be at least one.

The _summary_ line is optional, but authors are
strongly encouraged to include one if the nature of the change is not obvious
from the synopsis. It's just one line, meant to give the reader a clue as to
how the code changed. A more complete description of the change belongs in the
bug report.

A _reviewed-by_ line is required. Reviewers must have
the ability to deal with any adverse consequences of the change, and so must
themselves be authors. They are therefore identified by their OpenJDK usernames
rather than full e-mail addresses.

The _contributed-by_ line is optional. If present, it
is a list of comma-separated email addresses. It should be included only when
the author or authors of the change do not have commit rights to the target
repository and thus would not otherwise receive acknowledgment.

There will be exceptions for merge changesets, tag changesets, etc.

Example:

>     1234567: NPE thrown on FileInputStream("")
>     Summary: Rewrite precondition-checking code in io.c
>     Reviewed-by: mr
>     Contributed-by: Ben Bitdiddle <ben at bits.org>

If a changeset contains multiple unrelated changes (this is frowned upon, but
may happen from time to time) then its comment will contain multiple blocks of
the above form, separated by blank lines.

The required format of the comments will be enforced whenever the changeset is
pushed into the JDK master or team repository forests. Other Projects may copy
these conventions, adopt some other conventions, or have no conventions,
depending upon their goals.

#### Committing a Changeset

The following commands commit all of the changes in a repository to a
changeset.

>     $ cat ../message
>     1111111: Missing Duke gif
>     Summary:  Add missing file
>     Reviewed-by: iag
>     $ hg commit -l ../message
>     $ hg toutgoing
>     [.]
>     comparing with http://hg.openjdk.java.net/sandbox/box
>     searching for changes
>     changeset:   23:fb12953f3a35
>     tag:         tip
>     user:        iris
>     date:        Wed Dec 12 21:05:59 2007 -0800
>     summary:     1111111: Missing Duke gif

## Merging

It is often necessary to merge local changes with those made in the parent
repositories. The first step in a merge process is to retrieve (or pull) the
collection of changesets which have been pushed since the last merge or initial
clone. If there if there are merge conflicts, then they must be resolved.
[Chapter 3](http://hgbook.red-bean.com/hgbookch3.html#x7-530003) of
the Mercurial book contains detailed information on the
merging process.

There are two basic ways to update the working set files in the repositories:

Option 1: _**`hg`**_ `pull`

> One way to merge the parent repository with the working set of files is to use
> _**`hg`**_ `pull` all by itself. This option allows merging off-line or at a
> later time.
>
>>     $ hg pull
>>     [.]
>>     pulling from http://hg.openjdk.java.net/sandbox/box
>>     searching for changes
>>     no changes found
>
> In Mercurial, pulling changesets will not update or merge into the working set
> of files. To update the clone, run _**`hg`**_ `update`. If the update
> reports conflicts, run _**`hg`**_ `merge` to resolve them.

Option 2: _**`hg`**_ `fetch`

> Alternatively, use _**`hg`**_ `fetch` to pull the changes, update the
> working set files, and create simple merge changesets as necessary. The
> fetch extension is distributed with Mercurial but needs to be enabled. Edit
> the `.hgrc` to include the following entries:
>
>>     [extensions]
>>     fetch=
>
> Once the fetch extension has been enabled, _**`hg`**_ `fetch` may be invoked as follows:
>
>>     $ hg fetch
>>     [.]
>>     pulling from http://hg.openjdk.java.net/sandbox/box
>>     searching for changes
>>     no changes found

> ---
> Actual file merging will be done with the selected Mercurial merging tool see
> [MergeProgram](https://www.selenic.com/mercurial/wiki/index.cgi/MergeProgram)
> for the details on how to define the selected merge tool in ` ~/.hgrc`.

> ---

## Pushing

In order to push changesets into the parent repository, some additional
configuration is required. The following sections describe the operations that
will be performed by users with push access.

#### Generating an SSH Key

All pushes require an ssh key which must be installed on the Mercurial server.
The `ssh-keygen` command generates an ssh key. The
`-b` option overrides the default number of bits
for the key. Allow a few minutes to generate a 4096 bit key; a key of at least
2048 bits is recommended. While it is possible to use ssh without a passphrase,
this is **strongly** discouraged. Empty or
insecure passphrases may be reset using `ssh-keygen
-p`; this does not change the keys.

>     $ ssh-keygen -t rsa -b 4096
>     Enter file in which to save the key(/u/iris/.ssh/id_rsa):
>     Generating public/private rsa key pair.
>     Enter passphrase(empty for no passphrase):
>     Enter same passphrase again:
>     Your identification has been saved in /u/iris/.ssh/id_rsa.
>     Your public key has been saved in /u/iris/.ssh/id_rsa.pub.
>     The key fingerprint is:
>     md5 4096 c2:b7:00:e6:4b:da:ea:ec:32:30:f5:bd:12:26:04:83 iris@duke
>     The key's randomart image is:
>     +--[ RSA 4096]----+
>     |    E.=          |
>     |     . *         |
>     |      o .   .    |
>     |         + o     |
>     |        S + .    |
>     |       .   + .   |
>     |        + + +..  |
>     |       * . oo+.  |
>     |      o . .o..   |
>     +-----------------+

The `~/.ssh/id_rsa.pub` is a text file
containing the public ssh key. This file should be mailed as an attachment
along with the JDK username to
[keys(at)openjdk.java.net](mailto:keys-at-openjdk.java.net).
An administrator will install your key on the server and notify you on
completion. This process may take a couple of days.

> ---
> Users behind a SOCKS firewall can add a directive to the
> `~/.ssh/config` file to connect to the OpenJDK
> Mercurial server:
> 
>>     Host *.openjdk.java.net
>>     ProxyCommand /usr/lib/ssh/ssh-socks5-proxy-connect -h [socks_proxy_address] %h %p
>
> See the `ssh-socks5-proxy-connect` man page and
> `ssh-config` man page for more information. Other
> systems may require proxy access via other programs. Some Linux distributions
> provide the `corkscrew` package which provides ssh
> access through HTTP proxies.
> 
> **It is recommended that all users check with their network
> administrators before installing any kind of TCP forwarding tool on their
> network. Many corporations and institutions have strict security policies in
> this area.**

> ---

#### SSH Shortcuts

The following section provides some tips for improving the usability of
ssh-related operations.

* _Using SSH in multiple shells_

  To avoid having to constantly type in the passphrase, use the ssh-agent on your
  local client to cache your pashphrase:

  >     $ eval `ssh-agent`
  >     Agent pid 17450
  >     $ ssh-add
  >     Enter passphrase for /u/iris/.ssh/id_rsa:
  >     Identity added: /u/iris/.ssh/id_rsa(/u/iris/.ssh/id_rsa)

  The same ssh-agent process can be shared with multiple shells. There are
  various ways to do this. Bash users can accomplish this with the following code
  in `.bashrc`:

  >     if [ "$PS1" -a -d $HOME/.ssh ]; then
  >       if [ "x$SSH_AUTH_SOCK" = x ]; then
  >         eval `ssh-agent | grep -v 'echo Agent pid'`
  >         ssh-add
  >         trap "echo Killing SSH agent $SSH_AGENT_PID; kill $SSH_AGENT_PID" 0
  >       fi
  >     fi

  For secure operation, only start an ssh-agent when needed and kill it off when
  the shell completes. Test this by running `ssh 'hostname' echo
  hello` multiple times.

* _Logging in without a password_

  To avoid needing to constantly type in the password, add the public key to the
  list of ssh authorized keys.

  >     $ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  >     $ chmod 600 ~/.ssh/authorized_keys

#### Setting the `default-push` Path to the Server Repositories

<!-- 
#. Option 1: Add default-push path to every <code>.hg/hgrc</code>
-->

This is the typical development model:

:::{style="text-align:center;"}
![Diagram of server repos and user's clone](devModel.gif)
:::

Changesets need to be _pushed_ via ssh to the
read/write repository which resides on the OpenJDK Mercurial server. The
easiest way to do this is to have each repository define the "default-push"
path in every repository's `.hg/hgrc` file. The
`.hg/hgrc` file in is not a managed file - it is
private to the repository. The following example defines the "default" and
"default-push" paths for clones of the jdk9/dev team repository.

>     [paths]
>     default = http://hg.openjdk.java.net/jdk9/dev
>     default-push = ssh://<JDK_username>@hg.openjdk.java.net/jdk9/dev

Given a `JDK_username` this simple script will
attempt to do this for all the repositories:

>     #!/bin/sh
>     username=$1
>     hgdirs="`find . -type d -name .hg`"
>     for i in ${hgdirs}; do
>       d="`dirname ${i}`"
>       defpush="`(cd ${d} && hg paths default-push 2> /dev/null)`"
>       if [ "${defpush}" = "" ] ; then
>         defpath="`(cd ${d} && hg paths default 2> /dev/null)`"
>         if [ "${defpath}" != "" ] ; then
>           defpush="`echo ${defpath} | sed -e 's@http://\([^/]*/[^/]*/[^/]*\)/\(.*\)@ssh://$username\@\1/\2@'`"
>           cp ${i}/hgrc ${i}/hgrc.orig
>           echo "default-push = ${defpush}" >> ${i}/hgrc
>           echo "Added default-push: ${defpush}"
>         fi
>       fi
>     done
>     for i in ${hgdirs}; do
>       d="`dirname ${i}`"
>       echo "(cd ${d} && hg paths)"
>       (cd ${d} && hg paths)
>     done
>     exit 0

<!--
#. Option 2: Use the <code>defpath</code> ExtensionAnother way to setup the default-push path is to use the Mercurial defpath
    extension, which is available in /java/jdk/lib/hgext/defpath.py. To enable
    this extension add the following to the <code>~/hgrc</code> file:
<blockquote><pre>
[extensions]
defpath = /java/jdk/lib/hgext/defpath.py  # Or the pathname of a local copy
</pre></blockquote>
     The defpath extension actually adds two new Mercurial subcommands:
    defpath to operate upon a single repository and fdefpath for an entire
    forest. hg help defpath or hg help fdefpath will tell you more. For a
    freshly cloned open/closed forest the command you probably want is
<blockquote><pre>
$ hg fdefpath -dgv
</pre></blockquote>
     Be sure to try this with the -n flag first to see if it will do what
    you actually expect. If your OpenJDK username differs from your Oracle
    username then add -u name to the command line.
     The defpath extension defines the default-push path, which is the path
    that Mercurial uses by default in push operations.
-->

#### Pushing a Changeset

[Committers](https://openjdk.java.net/bylaws#committer)
can use the _**hg**_ `push` command to propagate changesets into the repositories.

Most developers will only find a need to create changesets in one or two
repositories. However, it is important that before any changesets are pushed,
the corresponding forest pull and merge with the destination forest be
performed; otherwise there is a risk of breaking the build.

>     $ hg push

After the push has been accepted, an automatic e-mail notification will be sent
to the [mailing list](https://mail.openjdk.java.net) associated with the
repository. In most cases notifications
are sent to the Project's _-dev_ mailing list. Some
Projects with high traffic _-dev_ mailing lists use a
dedicated _-changes_ list for notifications.

> ---
> Who has push access?
>
> All of a Project's [Committers](https://openjdk.java.net/bylaws#committer)
> can push to all of the the Project's repositories.
>
> Some Projects may chose to restrict the set of Committers with push to key
> repositories. For instance, JDK Release Projects restrict push access to MASTER
> repositories to Committers who are either integrators or members of the Release
> Engineering Team.
>
> Refer to the
> [Nominating a Contributor or Author to be a Committer](../projects/index.html#project-committer)
> section of the [Project](../projects/index.html) page for
> information about becoming a Project Committer.

> ---

::: {.NavBit}
[« Previous](jckAcquisition.html) • [TOC](index.html) • [Next »](next.html)
:::
