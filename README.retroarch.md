This is a set of rules for the retroarch cores to be added to the RetroArch
or gnome-games manifests.

Gathered from:
https://github.com/RetroPie/RetroPie-Setup/wiki/Supported-Systems

Requirements:
- Portable consoles go in the portable version of retroarch, living room ones, into the living room version, PC front-end can handle both
- No BIOS needed, or the BIOS needs to be available by other ways than warez and soldering. The NeoGeo BIOS is shipped with Linux versions of the games (which include an emulator) for example.
- No computer cores that would require a keyboard in either console version
- No non-libretro cores that would require reconfiguring the joypads (or worse!)
- No single game ports, those should be installed as an "app", not as a data file that the front-end would handle

console version of retroarch
----------------------------

- stella-libretro (Atari 2600)
- prosystem-libretro (Atari 7200)
- nestopia (NES)
- beetle-pce-fast-libretro (PC Engine, only needs a BIOS for CD games)
- Genesis-Plus-GX (MegaDrive, Master System)
- snes9x-next (SNES)
- mupen64plus-libretro (N64)
- libretro-mame
- libretro-fba (NeoGeo, BIOS is available with games)

= Not shipped =
- DreamCast needs a BIOS
- PSOne needs a BIOS (recheck when a BIOS-free version comes)

PC front-end/gnome-games
------------------------

- Only ship living room consoles, and computers
- Check for joypad or keyboard when launching console cores
- Check for keyboard when launching computer cores
- Check for mouse with scummvm (or touch if supported)
- Make sure to support external core .so so that interested folks can extend it

portable version of retroarch
-----------------------------

- gw-libretro (Game & Watch), probably needs a way to install the games: http://bot.libretro.com/assets/cores/gw/
- gambatte-libretro (GameBoy, GameBoy Color)
- Genesis-Plus-GX (Game Gear)
- beetle-ngp-libretro (NeoGeo Pocket)
- libretro-ppsspp (PSP)

= Not shipped =
- GameBoy Advance needs BIOS
- NDS doesn't go fast enough to be usable: https://github.com/RetroPie/RetroPie-Setup/wiki/Nintendo-DS
- PC Engine GT, and Sega Nomad didn't have their own library, and thus used living room consoles
  versions, which we'd consider inappropriate for small screens
