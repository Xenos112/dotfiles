#!/bin/bash

# Create wlogout icons directory
mkdir -p ~/.config/wlogout/icons

# Create Lock Icon
cat > ~/.config/wlogout/icons/lock.svg << 'EOF'
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="lockGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#f6c177;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#f4b942;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect x="36" y="56" width="56" height="48" rx="8" fill="url(#lockGrad)" stroke="#e0def4" stroke-width="2"/>
  <rect x="48" y="32" width="32" height="32" rx="16" fill="none" stroke="url(#lockGrad)" stroke-width="6"/>
  <circle cx="64" cy="74" r="4" fill="#191724"/>
  <rect x="62" y="78" width="4" height="12" fill="#191724"/>
</svg>
EOF

# Create Logout Icon
cat > ~/.config/wlogout/icons/logout.svg << 'EOF'
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="logoutGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#9ccfd8;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#7dd3d8;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect x="24" y="32" width="48" height="64" rx="8" fill="url(#logoutGrad)" stroke="#e0def4" stroke-width="2"/>
  <path d="M72 64 L96 64 M88 56 L96 64 L88 72" stroke="url(#logoutGrad)" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="36" cy="48" r="3" fill="#191724"/>
</svg>
EOF

# Create Shutdown Icon
cat > ~/.config/wlogout/icons/shutdown.svg << 'EOF'
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="shutdownGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#eb6f92;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#e85d7a;stop-opacity:1" />
    </linearGradient>
  </defs>
  <circle cx="64" cy="64" r="40" fill="none" stroke="url(#shutdownGrad)" stroke-width="6" stroke-dasharray="188.4 62.8" stroke-dashoffset="31.4" stroke-linecap="round"/>
  <line x1="64" y1="28" x2="64" y2="64" stroke="url(#shutdownGrad)" stroke-width="6" stroke-linecap="round"/>
</svg>
EOF

# Create Reboot Icon
cat > ~/.config/wlogout/icons/reboot.svg << 'EOF'
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="rebootGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#ebbcba;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#e5a3a1;stop-opacity:1" />
    </linearGradient>
  </defs>
  <path d="M64 24 A40 40 0 1 1 44 36" stroke="url(#rebootGrad)" stroke-width="6" fill="none" stroke-linecap="round"/>
  <path d="M52 24 L64 24 L64 36" stroke="url(#rebootGrad)" stroke-width="6" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
  <path d="M64 88 A24 24 0 1 0 64 40" stroke="url(#rebootGrad)" stroke-width="4" fill="none" stroke-linecap="round"/>
</svg>
EOF

# Create Suspend Icon
cat > ~/.config/wlogout/icons/suspend.svg << 'EOF'
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="suspendGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#c4a7e7;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#b794f6;stop-opacity:1" />
    </linearGradient>
  </defs>
  <circle cx="40" cy="64" r="8" fill="url(#suspendGrad)"/>
  <circle cx="64" cy="48" r="6" fill="url(#suspendGrad)" opacity="0.8"/>
  <circle cx="88" cy="64" r="8" fill="url(#suspendGrad)"/>
  <circle cx="64" cy="80" r="6" fill="url(#suspendGrad)" opacity="0.8"/>
  <path d="M32 32 Q64 16 96 32 Q64 48 32 32" fill="url(#suspendGrad)" opacity="0.6"/>
  <path d="M32 96 Q64 80 96 96 Q64 112 32 96" fill="url(#suspendGrad)" opacity="0.6"/>
</svg>
EOF

# Create Hibernate Icon
cat > ~/.config/wlogout/icons/hibernate.svg << 'EOF'
<svg width="128" height="128" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="hibernateGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#31748f;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#2a6478;stop-opacity:1" />
    </linearGradient>
  </defs>
  <path d="M32 48 Q48 32 64 48 Q80 32 96 48 Q80 64 64 48 Q48 64 32 48" fill="url(#hibernateGrad)"/>
  <path d="M32 80 Q48 64 64 80 Q80 64 96 80 Q80 96 64 80 Q48 96 32 80" fill="url(#hibernateGrad)" opacity="0.7"/>
  <circle cx="64" cy="64" r="4" fill="url(#hibernateGrad)"/>
</svg>
EOF

# Convert SVGs to PNGs (requires inkscape or imagemagick)
echo "Converting SVGs to PNGs..."
cd ~/.config/wlogout/icons

for file in *.svg; do
    if command -v inkscape >/dev/null 2>&1; then
        inkscape "$file" --export-type=png --export-filename="${file%.svg}.png" --export-width=128 --export-height=128
    elif command -v imagemagick >/dev/null 2>&1; then
        convert -background none "$file" -resize 128x128 "${file%.svg}.png"
    else
        echo "Please install inkscape or imagemagick to convert SVGs to PNGs"
        echo "Or manually convert the SVG files to PNG format"
        break
    fi
done

echo "Wlogout icons created successfully!"
echo "Icons location: ~/.config/wlogout/icons/"
