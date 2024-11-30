#!/usr/bin/env zsh

if [[ "$OS_TYPE" == "mac" ]]; then
  echo "Font setup script doesn't work on Mac"
  exit 0
fi

declare -a fonts=(
  # BitstreamVeraSansMono
  # CodeNewRoman
  # DroidSansMono
  # FiraCode
  FiraMono
  # Go-Mono
  # Hack
  # Hermit
  # JetBrainsMono
  # Meslo
  # Noto
  # Overpass
  # ProggyClean
  # RobotoMono
  # SourceCodePro
  # SpaceMono
  # Ubuntu
  # UbuntuMono
)

if [ "${#fonts}" -eq 0 ]; then
  echo "No fonts have been selected"
  exit 0
fi;

version="3.1.1"
fonts_dir="$XDG_DATA_HOME/fonts"

if [ ! -d "$fonts_dir" ]; then
  mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
  zip_file="${font}.zip"
  download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
  echo "Downloading $download_url"
  wget "$download_url"
  unzip "$zip_file" -d "$fonts_dir"
  rm "$zip_file"
done

# Remove unwanted files
find "$fonts_dir" -name "*Windows Compatible*" -delete
rm "$fonts_dir/LICENSE"
rm "$fonts_dir/readme.md"

# Update OS font cache
fc-cache -fv