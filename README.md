## md2overleaf — Obsidian → Overleaf Exporter

Convert any Obsidian note into a full Overleaf project with one click.

This plugin:

- Runs a custom Pandoc + Lua filter pipeline (your mdtex.sh script).

- Rewrites images and embeds into clean LaTeX figure environments.

- Converts TLDraw drawings → PNG automatically.

- Collects only the referenced images/drawings.

- Packs everything into a ZIP.

- Uploads the ZIP to Overleaf Snippet Import.

- (optional) Automatically opens the project in Overleaf.

### Installation (user)
1. Download the latest release ZIP from GitHub Releases.
2. Extract it to: ''' <Vault>/.obsidian/plugins/md2overleaf/''' 
3. Downlod the vault_files folder and copy the files directly to your vault
4. open Terminal and cd to your vault
5. run ''' chmod +x ./mdtex.sh '''
6. Enable it in Settings → Community Plugins.

### Installation (developer)
1. git clone https://github.com/asafdayan/md2overleaf
2. cd md2overleaf
3. npm install
4. npm run build
5. Then copy the dist/ folder into: '''<Vault>/.obsidian/plugins/md2overleaf/'''
6.  Downlod the vault_files folder and copy the files directly to your vault
7. open Terminal and cd to your vault
8. run ''' chmod +x ./mdtex.sh '''
9, Enable it in Settings → Community Plugins.

### Required Tools
pandoc version 3.2.1 or higher
