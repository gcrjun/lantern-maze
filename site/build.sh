#!/usr/bin/env bash
# Builds the public web site into _site/: landing page at the root, the game at /play/.
# The game is the same www/ that goes into the Android app, plus home-screen (PWA) tags for iPhone.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf _site
mkdir -p _site/play
cp site/index.html site/manifest.webmanifest _site/
cp -r site/icons _site/icons
cp -r www/. _site/play/
touch _site/.nojekyll
python3 - <<'EOF'
p = "_site/play/index.html"
s = open(p, encoding="utf-8").read()
tags = (
    '<link rel="manifest" href="../manifest.webmanifest">\n'
    '<link rel="icon" href="../icons/icon-192.png">\n'
    '<link rel="apple-touch-icon" href="../icons/icon-180.png">\n'
    '<meta name="apple-mobile-web-app-capable" content="yes">\n'
    '<meta name="mobile-web-app-capable" content="yes">\n'
    '<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">\n'
    '<meta name="apple-mobile-web-app-title" content="Lantern Maze">\n'
    '<meta name="theme-color" content="#07080d">\n'
)
assert s.count("<title>Lantern Maze</title>") == 1
s = s.replace("<title>Lantern Maze</title>", "<title>Lantern Maze</title>\n" + tags)
open(p, "w", encoding="utf-8").write(s)
EOF
echo "site built in _site/"
