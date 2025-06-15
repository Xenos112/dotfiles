#!/bin/bash

# Create scripts directory
mkdir -p ~/.config/hypr/scripts

# Weather Script
cat > ~/.config/hypr/scripts/weather.sh << 'EOF'
#!/bin/bash
# Simple weather display for hyprlock
# You can customize this with your preferred weather service

# Example using wttr.in (replace with your city)
CITY="Algiers"
WEATHER=$(curl -s "wttr.in/$CITY?format=%C+%t" 2>/dev/null | head -1)

if [ -n "$WEATHER" ]; then
    echo "🌤️ $WEATHER"
else
    echo "🌍 Beautiful day in $CITY"
fi
EOF

# Battery Script
cat > ~/.config/hypr/scripts/battery.sh << 'EOF'
#!/bin/bash
# Battery status for hyprlock

BAT_PATH="/sys/class/power_supply/BAT0"
AC_PATH="/sys/class/power_supply/ADP1"

if [ -f "$BAT_PATH/capacity" ]; then
    CAPACITY=$(cat "$BAT_PATH/capacity")
    STATUS=$(cat "$BAT_PATH/status")
    
    # Battery icons based on level
    if [ "$CAPACITY" -ge 90 ]; then
        ICON="󰁹"
    elif [ "$CAPACITY" -ge 80 ]; then
        ICON="󰂂"
    elif [ "$CAPACITY" -ge 70 ]; then
        ICON="󰂁"
    elif [ "$CAPACITY" -ge 60 ]; then
        ICON="󰂀"
    elif [ "$CAPACITY" -ge 50 ]; then
        ICON="󰁿"
    elif [ "$CAPACITY" -ge 40 ]; then
        ICON="󰁾"
    elif [ "$CAPACITY" -ge 30 ]; then
        ICON="󰁽"
    elif [ "$CAPACITY" -ge 20 ]; then
        ICON="󰁼"
    elif [ "$CAPACITY" -ge 10 ]; then
        ICON="󰁻"
    else
        ICON="󰁺"
    fi
    
    # Charging indicator
    if [ "$STATUS" = "Charging" ]; then
        ICON="󰂄"
    fi
    
    echo "$ICON $CAPACITY%"
else
    # No battery found, show power info
    echo "󰚥 AC Power"
fi
EOF

# Music Script
cat > ~/.config/hypr/scripts/music.sh << 'EOF'
#!/bin/bash
# Music info for hyprlock (supports playerctl)

if command -v playerctl >/dev/null 2>&1; then
    STATUS=$(playerctl status 2>/dev/null)
    if [ "$STATUS" = "Playing" ]; then
        ARTIST=$(playerctl metadata artist 2>/dev/null)
        TITLE=$(playerctl metadata title 2>/dev/null)
        
        if [ -n "$ARTIST" ] && [ -n "$TITLE" ]; then
            # Truncate long strings
            if [ ${#TITLE} -gt 30 ]; then
                TITLE="${TITLE:0:27}..."
            fi
            if [ ${#ARTIST} -gt 25 ]; then
                ARTIST="${ARTIST:0:22}..."
            fi
            echo "♪ $ARTIST - $TITLE"
        else
            echo "♪ Music Playing"
        fi
    elif [ "$STATUS" = "Paused" ]; then
        echo "⏸️ Music Paused"
    fi
else
    # No playerctl, check if any music processes are running
    if pgrep -x spotify >/dev/null 2>&1; then
        echo "♪ Spotify"
    elif pgrep -x mpv >/dev/null 2>&1; then
        echo "♪ Media Playing"
    fi
fi
EOF

# Make scripts executable
chmod +x ~/.config/hypr/scripts/*.sh

echo "Hyprlock scripts created successfully!"
echo "Scripts location: ~/.config/hypr/scripts/"

# Installation instructions script
cat > ~/.config/hypr/setup_hyprlock.sh << 'EOF'
#!/bin/bash

echo "🎨 Setting up Rosé Pine Hyprlock..."

# Check if Pictures directory exists
if [ ! -d "$HOME/Pictures" ]; then
    echo "📁 Creating Pictures directory..."
    mkdir -p "$HOME/Pictures"
    echo "ℹ️  Add your wallpapers to ~/Pictures/ for the background slideshow"
fi

# Check for user avatar
if [ ! -f "$HOME/.face" ]; then
    echo "🖼️  No user avatar found at ~/.face"
    echo "ℹ️  You can add a profile picture at ~/.face for the lock screen"
    echo "   Example: cp ~/Pictures/avatar.jpg ~/.face"
fi

# Test scripts
echo "🧪 Testing helper scripts..."
~/.config/hypr/scripts/weather.sh
~/.config/hypr/scripts/battery.sh
~/.config/hypr/scripts/music.sh

echo ""
echo "✅ Hyprlock setup complete!"
echo ""
echo "📋 Configuration saved to ~/.config/hypr/hyprlock.conf"
echo "🎯 To use: hyprlock"
echo ""
echo "🎨 Features:"
echo "   • Rosé Pine color scheme"
echo "   • Dynamic wallpaper from ~/Pictures/"
echo "   • Weather display"
echo "   • Battery status"
echo "   • Music info"
echo "   • Beautiful animations and effects"
echo ""
echo "⚙️  Customize the CITY variable in weather.sh for your location"
EOF

chmod +x ~/.config/hypr/setup_hyprlock.sh
