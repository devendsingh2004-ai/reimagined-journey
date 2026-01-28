#!/bin/bash
echo "🌟 Igniting GODPOWER Station..."
vncserver -kill :1 || true
rm -rf /tmp/.X1* || true
# Start VNC with no password and proper security settings
vncserver :1 -geometry 1280x720 -SecurityTypes None
export DISPLAY=:1
autocutsel -s CLIPBOARD -fork

# Wait for services to stabilize
sleep 5
xfce4-panel --restart >/dev/null 2>&1 &

echo "💾 Syncing Vault to GitHub..."
cd /workspaces/codespaces-blank
git add .
git commit -m "Auto-save" || echo "Nothing new."
git push -q origin main || echo "Cloud sync paused."

echo "✅ Ready! Open VNC and dominate."
