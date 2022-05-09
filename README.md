# QL-Magnetic
Magnetic Scrolls adventure interpreter for the SInclair QL and derivates. After nearly 40 years, The Pawn is back to where it all began.

Magnetic Scrolls Adventures on the QL and QL-alikes
---------------------------------------------------

Disclaimer: This software package does not contain any Magnetic Scrolls IPR.
To use it properly, you will, however, need to download the original game files
ripped from the original Magnetic Scrolls games. These are hosted by the Magnetic
Scrolls Memorials site, which claims the following:

"Important note:
The rights on the games are held by Magnetic Scrolls Ltd, which belongs to Anita Sinclair
and Ken Gordon. Their games, sadly enough, have been unavailable for years, so there are
very few options left to play the games in a legitimate way.
The reason for making the interpreter files and the game related materials available here
is to prevent the loss of the games. Anita and Ken - very nice people indeed - both know
the Memorial pages and didn't object to the contents, so I assume that the page is in
their spirit and the availabilty of the materials on these pages is tolerated.
Of course this is not a legal entitlement and obviously the materials can only be used
for personal, strictly non-commercial purposes."

Credit whom Credit is due
-------------------------

The software you'll find in this repository is based on work by Niclas Karlsson, who
decoded the format of the Magnetic Scrolls games and implemented a game interpreter
for those games. The MS games are actually written in a sub-set of 68000 assembly,
which is executed (emulated!) by this software.

The Software
------------
The software that comes with this package is an interpreter for ".mag" game files,
optionally coming with picture files (".gfx"). The interpreter will run the games (all
seven of them) as they were back in 1985, displaying the original graphics in locations
that have them.
The hint system and music support that were in some of the later MS games is not
supported. Furthermore, the graphic animations in later games (for example the cut scene
when falling down the rabbit hole in "Wonderland") is not supported. The animations will
be shown as static pictures. I hope and assume this doesn't take too much away from the
original experience.

The software plays all 7 MS games
 - The Pawn
 - Jinxter
 - Fish
 - Wonderland
 - The Guild of Thieves
 - Corruption
 - Myth
with all the graphics files.


Prerequisites
-------------
Currently, you need a Q68, QXL, QPC or QL with suitable memory extension and disk capacity
to run the games.

You will need this software unpacked on the QL media - use "unzip" on the QL itself, the
software will unpack to a directory "magnetic" per default. You'll find a file
"magnetic_exe" in that directory, which is the game interpreter.

You will, in addition, need all the game and graphic files for the MS games you want
to play. Due to copyright reasons, these files are not included in the package, but
openly downloadable from

"https://msmemorial.if-legends.org/magnetic.php"

with the above disclaimer. (Scroll down to the bottom of the page. You can disregard the
"collection" files - you are interested in the top 7)

Download the single game zipfiles, unzip them (as they contain no executables, you can
do this on the PC). For each game, you should have a ".MAG" and a ".GFX" file - The
former is the game itself, the latter the graphics file. Place all these files in the
same directory on your QL image as the software. You can disregard other files in the
downloaded archives - The QL version doesn't use them.

Running a game
--------------
The software takes the game you want to play and its associated graphics file as command
line arguments - So if you want to play "FISH", for example, use the following
command line (above directories assumed):

   EX win1_magq68_magnetic_exe;"win1_magq68_fish_mag win1_magq68_fish_gfx"

Note the games respect and obey default directories, so you can set the data default to the
place that stores the game files.

Note also that the games support the "last line recall" function of the QL (ALT+ENTER), and the cursor key recall.

The game properly multi-tasks (except when in interlaced mode on a BBQL) and works nicely with
the expended environment (PE). Memory permitting, you can even run some games in parallel,
the job name is amended with the loaded game. Beyond PE, there's no provisions to save
screen contents when switching to another job and thus no refresh.
Note the game will always switch to full-screen, regardless of what resolution you use.

Running the games on various machine types
------------------------------------------
The game detects on what type of machine it runs and makes some humble attempts to adapt.

Original support is currently experimental. Your mileage may vary. Note, you need at least a
Trump card to run the game at all, for optimal experience, a GoldCard or SGC plus SMSQ/E is recommended.

The games should work to various extents on all recent QL platforms except uQLX. I have tested on
QXL, Q40, QPC, Q68, Trump Card QL, GC and SGC QL.
Anything "better" than a BBQL is expected to have High Color support and thus will only
run in HC (So, no Aurora, apologies. In case sufficient people nag me for an Aurora version,
I might consider). uQLX doesn't really have support for MODE 8, so, no dice. QDOS Classic
wasn't tested, neither on the Amiga nor other platforms. More exotic beasts like Thors or
Futura weren't tested. If you want a version for those, please send me one.....

In case you want (or need) to override the defaults, the following command line switches
are supported:

  -e Enlarges the graphics x 2. Useful on platforms that have a screen resolution of at least
     512x384. Ignored if the machine is a BBQL.
  -t TV Mode on a BBQL. Don't try this on other machines. If this is selected, the game will
     not use the leftmost 32 pixels of the screen to make the picture fit to your TV
  -c use a condensed font (9x5) to fit more text to the screen. Definitely recommended if you
     try running this on a BBQL in MODE 8.
  -i Use interlaced graphics mode 8 - This allows some BBQLs to display the graphics in 32
     colours. This is still somewhat experimental and definitely doesn't work on Minerva.
     See tech note below. If this mode irritates you LCD screen (somewhat likely), try
     a real CRT. It usually works better there.
  -f on original QLs, dither the original Amiga pictures instead of simply displaying them
     in the closest QL colours. Takes a bit of speed, but produces much nicer pictures.
  -q assume we're running on a QL. Useful if you want to run the game on a "better"
     platform in MODE 8 (why would anyone want to do that?)
   

To use the command line switches, place them on the command line (where else?) before any
file names, separated by spaces, so for running The Pawn in dithered colours on an SGC QL,
display in TV mode, I use the following:

DATA_USE win1_magnetic : EX win1_magnetic_magnetic_exe;"-c -t -f pawn_mag pawn_gfx"

Some comments on what you can expect to work on a classic QL
------------------------------------------------------------
Some of the games can be run on an original QL with a Tetroid Trump Card with no further
software loaded (maybe even from floppy, I didn't try what fits and what doesn't).
Some of the games simply need too much memory to work there.
Due to the restricted memory of other expansions, don't expect magnetic to work on
anything less, my apologies.

If you have a GC or SGC, you can try running the game with the "-i" switch to display
32 colors. Don't expect this to work with a Minerva ROM, it doesn't (Reasons below).
It _might_ work with MG or JS ROMs, I haven't tried (No "old-ROM-QL" around the house
any more and no time to fit one). In case you're adventureous, you probably should.
Interlaced mode works fine on my SGC and GC-equipped QLs running SMSQ/E, though.

On a Trump Card, expect the games to run really slow. Expect a start-up time of
nearly a minute. SGC is fine, though ;)

Interlaced Mode will wait for a keypress (Space or Enter) while displaying a picture
in MODE 8i - There's no visible hint to that. Once you press one of these keys,
interlaced mode is cancelled and you directly see the difference between
modes 8 and 8i...

Note interlaced mode needs further 64k of free mem above MODE 8 to buffer the
system variables and the second screen contents - that might make a difference
when memory is tight.

When you quit from the game on a BBQL, you might be left with a garbled screen.
I haven't yet found out how to overcome this (I think PE is annoyed that someone
else messes with the screen...) Don't worry, simply type "MODE 4" and you should be
back to normal.

Why does Interlaced Mode not run on all platforms?
--------------------------------------------------
I have tried to get interlaced mode to work on all my QLs - No way. Fitting
Dithvide with an interactive game requires to be able to detect keypresses
from supervisor mode while interrupts are disabled - This simply doesn't seem
to work with Minerva (it seems to re-enter the scheduler and allow a task switch
from the MT.IPCOM call - which crashes the QL).
MODE 8i works flawlessly on SMSQ/E, though. Original Dithvide simply
displays a picture for a given number of frames - that is much simpler.

Don't expect Interlaced Mode to work on an Emulator - I would be surprised
if any QL emulator would simulate the QL hardware so closely.
