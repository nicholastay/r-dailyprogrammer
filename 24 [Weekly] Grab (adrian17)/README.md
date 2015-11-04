[[Weekly #24] Mini Challenges - Grab (by adrian17)](https://www.reddit.com/r/dailyprogrammer/comments/3o4tpz/weekly_24_mini_challenges/cvu1763)

# Description

*Grab* - like grep but simpler.

*Input* - a single line of text and a file name. You can take input via command line arguments or stdin, whichever is easier for you. You can also just take a single word instead of a line.

*Output* - all lines of the checked file which contain this piece of text, along with line numbers. Make it work case-insensitive.

*Example*

    $ grab mark file.txt
    7: Oh hi mark.
    15: Mark frowned.

# Extra
Make a second program (or modify the first one to do it when no filename was given) that, instead of checking a single file, does it for all text files in the current directory. When showing matching lines, also show the file you've found it in.

*Example*

    $ grab mark
    the_room.txt: 7: Oh hi mark.
    the_room.txt: 15: Mark frowned.
    story.txt: 127: Markings on the wall.
