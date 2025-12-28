ls /sys/class/
ls /sys/class/backlight/ /sys/class/thermal/ /sys/class/power_supply/ /sys/class/net/
cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status 2>/dev/null
cat /sys/class/backlight/amdgpu_bl1/brightness /sys/class/backlight/amdgpu_bl1/max_brightness 2>/dev/null
cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null
iwgetid -r 2>/dev/null || cat /sys/class/net/wlo1/operstate 2>/dev/null || echo "No WiFi"
which -a curl wget git nvim code
ls -la /home/dnet/ | grep -E "(code|src|dev)"
make clean && make
./dwmblocks -p
amixer scontrols
amixer scontents
make
timeout 5s ./dwmblocks -p
mkdir -p ~/.local/bin
chmod +x /home/dnet/.local/bin/vscode-launcher
chmod +x /home/dnet/.local/bin/volume-control
chmod +x /home/dnet/.local/bin/network-control
cd /home/dnet/src/suckless/dwm-dnet && make clean && make
cd "/home/dnet/src/suckless/dwmblocks-dnet"
make clean && make
timeout 5s ./dwmblocks -p
BUTTON=1 /home/dnet/.local/bin/vscode-launcher
cd src/
cd suckless
cd dwm-dnet/
cd patches/
mc
code
fc-list | grep -i "nerd\|awesome\|icon" | head -10
fc-list | head -20
fc-list | grep -i "terminal"
which dwmblocks
ps aux | grep dwmblocks
xset -q | grep -i font
sudo pacman -S nerd-fonts-jetbrains-mono
sudo pacman -Ss nerd-font
sudo pacman -S ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols
fc-cache -fv
fc-list | grep -i "jetbrains\|nerd" | head -10
sudo mkdir -p /usr/local/bin
chmod +x /home/dnet/volume-control /home/dnet/network-control /home/dnet/vscode-launcher
sudo mv /home/dnet/volume-control /home/dnet/network-control /home/dnet/vscode-launcher /usr/local/bin/
cd /home/dnet/src/suckless/dwmblocks-dnet && make clean && make
sudo make install
cd /home/dnet/src/suckless/dwm-dnet && make clean && make
cd "/home/dnet/src/suckless/dwmblocks-dnet"
sudo make install
cd /home/dnet/src/suckless/dwm-dnet && sudo cp dwm /usr/local/bin/
cd "/home/dnet/src/suckless/dwmblocks-dnet"
cd /home/dnet/src/suckless/st-dnet && make clean && make
cd "/home/dnet/src/suckless/dwmblocks-dnet"
sudo cp st /usr/local/bin/
cd /home/dnet/src/suckless/st-dnet && sudo cp st /usr/local/bin/
cd "/home/dnet/src/suckless/dwmblocks-dnet"
dwmblocks -p
cd /home/dnet/src/suckless/dwmblocks-dnet && make clean && make && sudo make install
pkill dwmblocks
dwmblocks -p
volume-control
volume-control
amixer scontrols
network-control
network-control
network-control
volume-control
dwmblocks -p
cd /home/dnet/src/suckless/dwmblocks-dnet && rm -f blocks.h && make && sudo make install
dwmblocks -p
dwmblocks &
sigqueue 25051 4 "$(printf '%d%d' 1 4)"
BUTTON=1 network-control
pkill dwm && dwm &
dwm
c
dwm
c
dwm
c
dwm
c
dwm
c
cd src/
cd suckless
l
cd dwmblocks-dnet/
sudo make clean install
,
cd dwm-dnet/
sudo make clean install
dwm
sudo tee /usr/local/bin/cpu-temp > /dev/null << 'EOF'
#!/bin/bash

# CPU Temperature script for dwmblocks
# Handles different button clicks and provides robust temperature detection

case "$BUTTON" in
    1) # Left click - Show detailed CPU info
        notify-send "CPU Info" "$(sensors | grep -E '(Core|Package|Tdie)' | head -10)"
        ;;
    2) # Middle click - Open sensors in terminal
        st -e watch -n 1 'sensors | grep -E "(Core|Package|Tdie)"' &
        ;;
    3) # Right click - Show CPU frequency info
        if command -v lscpu >/dev/null 2>&1; then
            notify-send "CPU Frequency" "$(lscpu | grep -E '(CPU MHz|Model name)')"
        else
            notify-send "CPU Info" "lscpu not available"
        fi
        ;;
esac

# Robust temperature detection
get_temp() {
    # Try different temperature sources in order of preference
    if command -v sensors >/dev/null 2>&1; then
        # Try lm-sensors first
        TEMP=$(sensors 2>/dev/null | grep -E -m1 '(Package id 0|Tdie|Core 0|temp1)' | grep -oE '[0-9]+\.[0-9]+' | head -1)
        if [[ -n "$TEMP" ]]; then
            echo "${TEMP}°C"
            return
        fi
    fi
    
    # Try /sys/class/thermal/
    if [[ -d /sys/class/thermal/thermal_zone0 ]]; then
        TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
        if [[ -n "$TEMP" && "$TEMP" != "0" ]]; then
            echo "$((TEMP / 1000))°C"
            return
        fi
    fi
    
    # Try /sys/devices/platform/coretemp
    for temp_file in /sys/devices/platform/coretemp.*/hwmon/hwmon*/temp1_input; do
        if [[ -f "$temp_file" ]]; then
            TEMP=$(cat "$temp_file" 2>/dev/null)
            if [[ -n "$TEMP" && "$TEMP" != "0" ]]; then
                echo "$((TEMP / 1000))°C"
                return
            fi
        fi
    done
    
    # Fallback message
    echo "N/A"
}

get_temp
EOF

sudo tee /usr/local/bin/cpu-temp > /dev/null << 'EOF'
#!/bin/bash

# CPU Temperature script for dwmblocks
# Handles different button clicks and provides robust temperature detection

case "$BUTTON" in
    1) # Left click - Show detailed CPU info
        notify-send "CPU Info" "$(sensors | grep -E '(Core|Package|Tdie)' | head -10)"
        ;;
    2) # Middle click - Open sensors in terminal
        st -e watch -n 1 'sensors | grep -E "(Core|Package|Tdie)"' &
        ;;
    3) # Right click - Show CPU frequency info
        if command -v lscpu >/dev/null 2>&1; then
            notify-send "CPU Frequency" "$(lscpu | grep -E '(CPU MHz|Model name)')"
        else
            notify-send "CPU Info" "lscpu not available"
        fi
        ;;
esac

# Robust temperature detection
get_temp() {
    # Try different temperature sources in order of preference
    if command -v sensors >/dev/null 2>&1; then
        # Try lm-sensors first
        TEMP=$(sensors 2>/dev/null | grep -E -m1 '(Package id 0|Tdie|Core 0|temp1)' | grep -oE '[0-9]+\.[0-9]+' | head -1)
        if [[ -n "$TEMP" ]]; then
            echo "${TEMP}°C"
            return
        fi
    fi
    
    # Try /sys/class/thermal/
    if [[ -d /sys/class/thermal/thermal_zone0 ]]; then
        TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
        if [[ -n "$TEMP" && "$TEMP" != "0" ]]; then
            echo "$((TEMP / 1000))°C"
            return
        fi
    fi
    
    # Try /sys/devices/platform/coretemp
    for temp_file in /sys/devices/platform/coretemp.*/hwmon/hwmon*/temp1_input; do
        if [[ -f "$temp_file" ]]; then
            TEMP=$(cat "$temp_file" 2>/dev/null)
            if [[ -n "$TEMP" && "$TEMP" != "0" ]]; then
                echo "$((TEMP / 1000))°C"
                return
            fi
        fi
    done
    
    # Fallback message
    echo "N/A"
}

get_temp
EOF

 
sudo tee /usr/local/bin/cpu-temp > /dev/null << 'EOF'
#!/bin/bash

# CPU Temperature script for dwmblocks
# Handles different button clicks and provides robust temperature detection

case "$BUTTON" in
    1) # Left click - Show detailed CPU info
        notify-send "CPU Info" "$(sensors | grep -E '(Core|Package|Tdie)' | head -10)"
        ;;
    2) # Middle click - Open sensors in terminal
        st -e watch -n 1 'sensors | grep -E "(Core|Package|Tdie)"' &
        ;;
    3) # Right click - Show CPU frequency info
        if command -v lscpu >/dev/null 2>&1; then
            notify-send "CPU Frequency" "$(lscpu | grep -E '(CPU MHz|Model name)')"
        else
            notify-send "CPU Info" "lscpu not available"
        fi
        ;;
esac

# Robust temperature detection
get_temp() {
    # Try different temperature sources in order of preference
    if command -v sensors >/dev/null 2>&1; then
        # Try lm-sensors first
        TEMP=$(sensors 2>/dev/null | grep -E -m1 '(Package id 0|Tdie|Core 0|temp1)' | grep -oE '[0-9]+\.[0-9]+' | head -1)
        if [[ -n "$TEMP" ]]; then
            echo "${TEMP}°C"
            return
        fi
    fi
    
    # Try /sys/class/thermal/
    if [[ -d /sys/class/thermal/thermal_zone0 ]]; then
        TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
        if [[ -n "$TEMP" && "$TEMP" != "0" ]]; then
            echo "$((TEMP / 1000))°C"
            return
        fi
    fi
    
    # Try /sys/devices/platform/coretemp
    for temp_file in /sys/devices/platform/coretemp.*/hwmon/hwmon*/temp1_input; do
        if [[ -f "$temp_file" ]]; then
            TEMP=$(cat "$temp_file" 2>/dev/null)
            if [[ -n "$TEMP" && "$TEMP" != "0" ]]; then
                echo "$((TEMP / 1000))°C"
                return
            fi
        fi
    done
    
    # Fallback message
    echo "N/A"
}

get_temp
EOF

chmod +x cpu-temp gpu-stats
make clean && make
./cpu-temp
./gpu-stats
./dwmblocks -p
cd /home/dnet/src/suckless/dwmblocks-dnet && ./dwmblocks -p
# Move scripts to system directory
sudo mv /home/dnet/src/suckless/dwmblocks-dnet/cpu-temp /usr/local/bin/
sudo mv /home/dnet/src/suckless/dwmblocks-dnet/gpu-stats /usr/local/bin/
sudo chmod +x /usr/local/bin/cpu-temp
sudo chmod +x /usr/local/bin/gpu-stats
# Install updated dwmblocks
sudo cp /home/dnet/src/suckless/dwmblocks-dnet/dwmblocks /usr/local/bin/
# Restart dwmblocks
pkill dwmblocks
dwmblocks &
# Move scripts to system directory
sudo mv /home/dnet/src/suckless/dwmblocks-dnet/cpu-temp /usr/local/bin/
sudo mv /home/dnet/src/suckless/dwmblocks-dnet/gpu-stats /usr/local/bin/
sudo chmod +x /usr/local/bin/cpu-temp
sudo chmod +x /usr/local/bin/gpu-stats
# Install updated dwmblocks
sudo cp /home/dnet/src/suckless/dwmblocks-dnet/dwmblocks /usr/local/bin/
# Restart dwmblocks
pkill dwmblocks
dwmblocks &
dwm
cd /home/dnet/src/suckless/dwmblocks-dnet
ls -la cpu-temp gpu-stats dwmblocks
cd /home/dnet/src/suckless/dwmblocks-dnet
ls -la cpu-temp gpu-stats dwmblocks
# Install the scripts
sudo mv cpu-temp /usr/local/bin/
sudo mv gpu-stats /usr/local/bin/
sudo chmod +x /usr/local/bin/cpu-temp
sudo chmod +x /usr/local/bin/gpu-stats
# Kill running dwmblocks and install updated version
pkill dwmblocks
sudo cp dwmblocks /usr/local/bin/
# Start the new dwmblocks with color support and GPU monitoring
dwmblocks &
ps aux | grep dwmblocks
pkill -f dwmblocks
pkill -f alsamixer
cd /home/dnet/src/suckless/dwmblocks-dnet && make clean && make
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwmblocks-dnet && timeout 5s ./dwmblocks -p
# Move scripts to system directory
sudo mv /home/dnet/src/suckless/dwmblocks-dnet/cpu-temp /usr/local/bin/
sudo mv /home/dnet/src/suckless/dwmblocks-dnet/gpu-stats /usr/local/bin/
sudo chmod +x /usr/local/bin/cpu-temp
sudo chmod +x /usr/local/bin/gpu-stats
# Install updated dwmblocks
sudo cp /home/dnet/src/suckless/dwmblocks-dnet/dwmblocks /usr/local/bin/
# Restart dwmblocks
pkill dwmblocks
dwmblocks &
cat /sys/class/power_supply/BAT0/capacity
cat /sys/class/thermal/thermal_zone0/temp
cat /sys/class/net/wlo1/operstate
firefox-developer-edition 
l
cd dwm-dnet/
cd patches/
curl dwm.suckless.org/patches/keymodes/dwm-keymodes-5.8.2.diff
wget dwm.suckless.org/patches/keymodes/dwm-keymodes-5.8.2.diff

curl dwm.suckless.org/patches/keysequence/keysequence-20250606-0d6af14.diff
wget dwm.suckless.org/patches/keysequence/keysequence-20250606-0d6af14.diff
l
c
wget dwm.suckless.org/patches/keychain/dwm-keychain-20200729-053e3a2.diff
wget dwm.suckless.org/patches/keybindings/dwm-keybindings-6.5,diff
wget dwm.suckless.org/patches/ifroot/dwm-ifroot-6.6.diff
wget dwm.suckless.org/patches/multikey/dwm-multikey-6.2.diff
wget dwm.suckless.org/patches/appicons/dwm-appicons-20250601-c05f117.diff
wget dwm.suckless.org/patches/sgrstatus/dwm-sgrststus256-20220223-6.3.diff
wget dwm.suckless.org/patches/quitprompt/dwm-quitprompt-20220718-6613d9f.diff
wget dwm.suckless.org/patches/autostarttags/dwm-autostarttags-6.4.diff
wget dwm.suckless.org/patches/save_floats/dwm-savefloats-20181212-b69c870.diff
wget dwm.suckless.org/patches/cool_autostart-6.5.diff
wget dwm.suckless.org/patches/barpadding/dwm-barpadding-6.6.diff
wget dwm.suckless.org/patches/systray/dwm-systray-6.6.diff
pi nerd-fonts
pi ast-grep
pi fd lazygit
pi unzip
pi regex
pi regex-parser
pi gs
pi mmdc
pi npm
npm install -g neovim
sudo npm install -g neovim
which nvim
mc
mc
pi nvim
pi pynvim
pi python-nvim
pi python-pynvim
pi xsel xclip
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
c
nvim
nvim
nvim
nvim
nvim
nvim
cd src/
cd suckless
cd dwm-dnet/
nvim dwm.c
c
code
code
patch -p1 < patches/dwm-barpadding-6.6.diff
cp config.def.h.rej config.def.h.backup && git checkout HEAD -- config.def.h
git status
git checkout HEAD -- config.def.h
clear
git log
git reset --hard 018e2a22be3d51f0b54d26121428bf5a502bf396
clear
cp -r . ../dwm-backup-$(date +%Y%m%d)
git init && git add . && git commit -m "Pre-patch backup"
cd /home/dnet/src/suckless/dwmblocks-dnet && ls -la
cd "/home/dnet/src/suckless/dwm-dnet"
ps aux | grep -E "(dwmblocks|vscode)"
cd /home/dnet/src/suckless/dwmblocks-dnet && ./cpu-temp
cd "/home/dnet/src/suckless/dwm-dnet"
ls -la /usr/local/bin/ | grep -E "(cpu|gpu|volume|vscode|network)"
/usr/local/bin/cpu-temp
/usr/local/bin/gpu-stats
cd /home/dnet/src/suckless/dwmblocks-dnet && timeout 3s ./dwmblocks -p
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwmblocks-dnet && make clean && make
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwmblocks-dnet && timeout 3s ./dwmblocks -p
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwmblocks-dnet && sudo cp dwmblocks /usr/local/bin/
cd "/home/dnet/src/suckless/dwm-dnet"
pkill -f dwmblocks
cd /home/dnet/src/suckless/dwmblocks-dnet && sudo cp dwmblocks /usr/local/bin/
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwm-dnet && rm -f volume-control-safe
dwmblocks &
sleep 2 && xprop -root | grep WM_NAME
cd /home/dnet/src/suckless/dwm-dnet && grep -n -A5 -B5 "color" config.h
cd /home/dnet/src/suckless/dwm-dnet && grep -n -A10 -B5 "statuscmd" config.h
cd /home/dnet/src/suckless/dwm-dnet && grep -n -A20 -B5 "statuscmd" dwm.c
cd /home/dnet/src/suckless/dwmblocks-dnet && grep -n -A30 "statussig" dwm.c
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwm-dnet && grep -n -A30 "statussig" dwm.c
cd /home/dnet/src/suckless/dwmblocks-dnet && grep -n -A10 -B5 "drawbar" dwm.c
cd "/home/dnet/src/suckless/dwm-dnet"
cd /home/dnet/src/suckless/dwm-dnet && find . -name "dwm.c" -exec grep -l "drawbar" {} \;
cd /home/dnet/src/suckless/dwm-dnet && grep -n -A20 "drawbar" dwm.c
cd /home/dnet/src/suckless/dwm-dnet && grep -n -A5 -B5 "drw_text" dwm.c
cd /home/dnet/src/suckless/dwmblocks-dnet && make clean && make
cd "/home/dnet/src/suckless/dwm-dnet"
pkill -f dwmblocks && cd /home/dnet/src/suckless/dwmblocks-dnet && sudo cp dwmblocks /usr/local/bin/ && dwmblocks &
ls -l /home/dnet/.local/share/nvim/site/
ls -ld /home/dnet/.local/share/nvim/site/
sudo chmod -R 755 /home/dnet/.local/share/nvim/site/
pi yazi
yazi
cd src/
cd suckless
cd dwm-dnet/
sudo make clean install
cd src/
cd suckless
cd dwmblocks-dnet/
make clean install
sudo make clean install
ps aux | grep -E "(dwmblocks|dwm)" | head -10
cd /home/dnet/src/suckless/dwmblocks-dnet && ls -la
cd /home/dnet/src/suckless/dwmblocks-dnet && git status
cd /home/dnet/src/suckless/dwmblocks-dnet && git diff blocks.def.h
cd /home/dnet/src/suckless/dwmblocks-dnet && git diff HEAD~1 blocks.def.h
smc
code
code
git clean -df
code
code
smc
smc
,
,
cd dotfiles
l
stow .
pi stow
l
stow .
stow .
smc
stow .
source /home/dnet/.my-environment.sh 
stow .
l
,
l
cd dotfiles/
smc
source /home/dnet/.my-environment.sh 
stow .
smc
smc
stow .
smc
smc
stow .
smc
~ls
c
code
stow .
code
