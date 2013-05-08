This gem makes it somewhat possible to use `utf-8` inside pry under windows.

Installation
============

### install the gem

`gem install pry-windows`

### fix your console font

1. Open `cmd.exe`
2. Click the window icon in the title bar
3. Go to Properties -> Fonts
4. Choose Consolas or Lucidia Console (i.e. anything except Raster fonts)

Troubleshooting
===============

To test `pry-windows` try outputting a division sign:

It should look like this:

```ruby
[1] pry(main)> puts "\xC3\xB7" # good :)
÷
```

```ruby
[1] pry(main)> puts "\xC3\xB7" # bad :(
├╖
```

If you're seeing something wrong. Check you fixed your font, and then file a bug.

Why?
====

By default in windows you can only access characters in your home codepage (e.g. [CP437](http://en.wikipedia.org/wiki/Code_page_437)) which makes it hard to play with unicode. This gem makes it a bit easier by changing the codepage to CP65001 (otherwise known as UTF-8) while pry is running. This lets you output utf-8 (assuming you have fixed your font, as above). It also treats strings you type into pry as utf-8 by default.

Bugs
====

It's not possible to type or paste non-ascii characters into `cmd.exe` when it's in `CP65001` mode. Instead you can use ruby's `"\u00f7"` notation.

If your ruby program exits unexpectedly, you will not be able to run other programs from your console until you fix the problem by running `chcp 437`

Meta-fu
=======

Licensed under the MIT license, bug-reports and pull-requests are welcome.

