$NVIM_CONFIG_PATH="${env:UserProfile}\AppData\Local\nvim"

Copy-Item -Recurse .\nvim_config $NVIM_CONFIG_PATH
