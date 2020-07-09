% Community Code Review

## General

The cr.openjdk.java.net server provides storage and display of code review
materials such as webrevs and other artifacts related to the
[OpenJDK](http://openjdk.java.net/) Community. If you
are interested in monitoring recent reviews, try our review feed
[here](http://cr.openjdk.java.net/feed.atom).

Any user with push access to the OpenJDK
[Mercurial](http://hg.openjdk.java.net) server can publish
materials on the cr.openjdk.java.net server.
Users can upload files to temporary
storage using secure methods (rsync, scp, and sftp).

## Terms and conditions

This site is for open source materials related to the OpenJDK
Community only. Users uploading inappropriate materials will lose
access and the material will be deleted. Please review the
[Terms of Use](http://openjdk.java.net/legal/terms.html).

Special note to developers working on closed code and tests:
This cr.openjdk.java.net
server is intended for OpenJDK materials only. Please use your
current process for webrevs and reviews of closed code and
tests.

## Webrev

So, what is webrev?

[Webrev](webrevHelp.html) is
a script that will crawl over your changes, compare the modified
files with your parent forest, then generate a set of web pages to
display the differences.

When you are asking reviewers to check over your proposed
changes, it helps to make that job as easy for them as possible,
and webrev is one way to do it.

For more information about webrev, refer to:

* See the [the webrev help page](webrevHelp.html)

## Example

* A developer called "username" runs `webrev -f`
  on their work done in a Mercurial forest. This creates output under
  a webrev directory.

* For clarity, they add the bug ID they are working on, and
  perhaps add a sequence number:

      mkdir 6543210
      mv webrev 6543210/webrev.00

  This will allow subsequent webrevs (if there are any) to be
  added as webrev.01 and so on without clobbering the original
  files.

* **Optional:** If they would like to dress up their entry in
  the [Atom feed](http://cr.openjdk.java.net/feed.atom),
  create `.title` and/or `.description` files:

      echo "A suitable review title or bug synopsis" > 6543210/.title
      echo "Short description of the change to be reviewed" > 6543210/.description

  Syndication does not recognize line endings or formatting tags,
  so it would be a good idea to keep the information in these files
  as simple as possible.

  If these file(s) are not found by the cr.openjdk.java.net
  server, the subdirectory
  name (6543210 in this example) will be used for title and/or
  description in the stream.

* They transfer the webrev tree to their home directory on
  cr.openjdk.java.net using scp or rsync:

      scp -r 6543210 username@cr.openjdk.java.net:

  or

      rsync -av 6543210 username@cr.openjdk.java.net:

  Note the final : on the command line. If you omit that, you will
  copy the bits into a directory called
  "username@cr.openjdk.java.net" on your local system.

* The results will be published at:

      http://cr.openjdk.java.net/~username/6543210

* In ten minutes or less, the new information will appear on the
  feed:

  [http://cr.openjdk.java.net/feed.atom](http://cr.openjdk.java.net/feed.atom)

* Later on, if it is time to clean up, use sftp to access your
  code review directory:

      sftp username@cr.openjdk.java.net

  Use the `rm` command to delete individual files. If you
  want to delete a tree of files and directories, use the
  `rename` command to move them into your ~/.trash
  subdirectory. To continue with the example for bug ID 6543210:

      rename 6543210 .trash/6543210

  A cron job on the cr.openjdk.java.net
  server will periodically empty the trash for
  all users.

Please send feedback to `web-discuss at openjdk dot java dot net`
