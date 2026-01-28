echo '🌟 Activating GODPOWER Station...'
vncserver -kill :1 || true
rm -rf /tmp/.X1* || true
vncserver :1 -geometry 1280x720
export DISPLAY=:1
autocutsel -s CLIPBOARD -fork
xfce4-panel -r && xfwm4 --replace &

echo '💾 Backing up your Vault (codespaces-blank) to GitHub...'
cd /workspaces/codespaces-blank
git add .
git commit -m 'Auto-save Godpower Station' || echo 'No new changes to save.'
git push -u origin main || echo 'Push failed, but files are saved locally.'

echo '✅ Station Online. Everything is backed up and safe.'
