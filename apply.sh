#!/bin/bash

# This is a repeatable series of commands to move textures over and resize/edit them so they work for 2G

git submodule init && git submodule update

# Requires magick
if [[ -z "$(which magick)" ]]; then
  echo 'magick (ImageMagick) is required and must be on the $PATH. Download here: https://imagemagick.org/script/download.php'
  exit 1
fi


## Intro textures
## No language selection in 2G
## Dolby logo is skipped because it doesn't appear anyways

echo "Title screen"
cp MHFU-HD/Intro/welcome.png ULJM05500/INTRO/091db3007c963d08bcffe946.png
## Resize to fit
magick convert ULJM05500/INTRO/091db3007c963d08bcffe946.png -background transparent -gravity NorthWest -extent 4096x4096 ULJM05500/INTRO/091db3007c963d08bcffe946.png

echo "Capcom Logo"
cp MHFU-HD/Intro/capcom.png ULJM05500/INTRO/091bb0d0060d25f7d0bbe225.png
## Resize to fit
magick convert ULJM05500/INTRO/091bb0d0060d25f7d0bbe225.png -background black -gravity NorthWest -extent 4096x4096 ULJM05500/INTRO/091bb0d0060d25f7d0bbe225.png

# echo "Dolby Logo"
## texture is not centered?
# cp MHFU-HD/Intro/dolby.png ULJM05500/INTRO/0922bb90b58f5a2d5c1d68f4.png

echo "Intro background" # I think?
cp MHFU-HD/Intro/intro.png ULJM05500/INTRO/091fb53089630225d1f43eed.png
## Resize to fit
magick convert ULJM05500/INTRO/091fb53089630225d1f43eed.png -background black -gravity NorthWest -extent 4096x4096 ULJM05500/INTRO/091fb53089630225d1f43eed.png


## UI textures
## Font/ doesn't contain any textures
## Textures inside Frame/ are identical, no need to copy

echo "UI"
cp MHFU-HD/UI/UI.png ULJM05500/UI/091527a0e580c2a80b39570d.png
## Move the speech bubble
magick convert ULJM05500/UI/091527a0e580c2a80b39570d.png -copy 144x176+512+1024 144x176+1904+514 ULJM05500/UI/091527a0e580c2a80b39570d.png
## Remove speech bubble at original location
magick convert ULJM05500/UI/091527a0e580c2a80b39570d.png -write mpr:img \
  \( mpr:img -crop 144x176+512+1024 +repage \) \
  -geometry 144x176+512+1024 -compose subtract -composite \
  ULJM05500/UI/091527a0e580c2a80b39570d.png

echo "Loading screen"
cp MHFU-HD/UI/loading.png ULJM05500/INTRO/0912f8701e940712ee2b31e4.png
## Resize to fit
magick convert ULJM05500/INTRO/0912f8701e940712ee2b31e4.png -background transparent -gravity NorthWest -extent 4096x4096 ULJM05500/INTRO/0912f8701e940712ee2b31e4.png

echo "Items"
cp MHFU-HD/UI/items.png ULJM05500/UI/091830a0535e616be502b6aa.png

echo "Done"