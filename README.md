Each directory is a game with the YAML script and description stub and whatever else I feel like should be included per-game

Misc is folder containing scripts or artifacts that is helpful to writing installers in general

drive_c/users/username/AppData/Roaming/thprac/thprac.json

# Notes
Things I have learned to watch out for when writing installers, thoughts may be unorganized

General:
- Touhou games does not require any exotic graphics option in Lutris advanced runner setting, all of them can be off or on (on my systems at least). The performance impact is uninvestigated.
- All Japanese applications that uses file API seems to require the Linux host system to support Japanese locale, as is the case with ZUN patches. Not only that, when running these applications, `LC_ALL` must be set to a Japanese locale.

Lutris:
- Extremely unclear whether the dgVoodoo2 works, it might require extensive tweaking.

Writing installer:
- During installation, executables may be run under no prefix or a game prefix. To run executables under a game prefix it must be explicitly instructed. This is the same for named task winetricks as well.
- Do not use out-of-band methods to run wine, it will cause issues. Always use named task `wineexec`.
- Setting locale environment variable in `wineexec` seems to NEVER work.
- Setting locale in system env works but it makes all wine menus to be in that locale permanently. Seems to be unavoidable.

Touhou:
- System wine has mono, game prefix does not, thcrap requires mono, therefore thcrap cannot be run under game prefix during installation.
- thcrap under wine specifically will hang after the game close, both Steam and Lutris will think the game is still running and there is not a way to fix this (yet).
- Some ZUN patch that opens a directory picker needs to be run under game prefix for ease of locating game directory

Runtime:
- Prefer System Libraries is needed on some systems to have working audio.
