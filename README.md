[LITERATE_README]: 2>/dev/zero || . ./literate-executable-readme.sh <<"."
# Literate `README` Demo Project

Quoth [@rsnous](https://twitter.com/rsnous/status/1533320874778042369) of Twitter:
> you should be able to star a file in your GitHub repo to show people thats the file they need to run to get the project to work

GitHub already has that feature, so long as the file to run is named `README`. You're reading it now. It's right at the front of the repo; that's stars enough. This one is an executable polyglot shell script and Markdown file. You can get started with this project by running it in your shell,

    $ ./README.md

and our *sophisticated* menu system will guide you through the available options. (J/K, I'm not putting that much time into this. But it *could* have been sophisticated.)

It just makes sense for an executable `README` to be doing something like [Literate Programming](en.wikipedia.org/wiki/Literate_programming), so after the preliminary introduction, let's start with the most important task...

.

just going to mention [HELLO] or something.

[HELLO]: <http://asdf.com/> asdf. the best website.

[//]: # (This may be the most platform independent comment)

[TASK]: #compile <<"."
# Compiling From Source
    # There's probably a bunch of .o files to get rid of.
    make clean

    # Compile the project in parallel without fork-bombing your computer.
    make -j$(nproc)

.


[TASK]: #package <<"."
# Packaging
    # First, make sure the repo is in a clean state.
    make clean

    # Then build everything.
    make all

    # Then run the `package` Makefile target. It probably makes a .tar.gz or something.
    make package
.

[COMMAND]: #report_an_issue xdg-open "https://github.com/purpleposeidon/literate-readme/issues/new/choose"

[NOTE]: - <<"."

... Right, that's that.

Now you should look at the source of this file, and see [`./literate-executable-readme.sh`](./literate-executable-readme.sh).

# But Also

This example sacrifices correctness for elegance.

1. No shebang. You could tell the users to run `bash ./README.md` instead.
2. [This guy](https://stackoverflow.com/questions/4823468/comments-in-markdown/20885980#20885980) who I got the markdown-comment trick from says you should wrap them in blank lines, and to use `#` or `<>` as the link target. But it doesn't look as good, and Github can handle it.
3. By this rule, it looks like it would be difficult to get the sourcing line to parse correctly. 
4. The heredocs are specified using `<<"."`; meaning they terminate with a lone `.`, and do no string interpolation.
5. shellcheck doesn't like it.
.
