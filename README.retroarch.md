
See here:
https://wiki.gnome.org/Design/Playground/Games/LibretroCores
for a set of rules explaining selection of cores.

Also note that portable consoles go in the portable version of
retroarch, living room ones, into the living room version.

console version of retroarch
----------------------------

- snes9x-next (SNES)
- mupen64plus-libretro (N64)
- libretro-fba (NeoGeo, BIOS is available with games) or MAME?

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
