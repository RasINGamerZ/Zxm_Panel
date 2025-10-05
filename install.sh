#!/bin/bash
# ========================================
# 🚀 ZXm_Panel Installation Script
# Created by MrdraynoX
# ========================================

echo ""
echo "========================================"
echo "     💻 Installing ZXm_Panel UI"
echo "========================================"
echo ""

# Step 1: Check dependencies
echo "🔍 Checking dependencies..."
if ! command -v unzip &> /dev/null; then
  echo "⚠️ unzip not found. Installing..."
  sudo apt update && sudo apt install unzip -y
  git clone https://github.com/RasINGamerZ/Zxm_Panel.git
  cd Zxm_Panel
fi

# Step 2: Create install directory
INSTALL_DIR="/var/www/html/ZXm_Panel"

echo "📦 Creating installation directory at $INSTALL_DIR ..."
sudo mkdir -p "$INSTALL_DIR"

# Step 3: Unzip panel files
echo "📂 Extracting panel files..."
if [ -f "ZXm_Panel_v1_ui.zip" ]; then
  sudo unzip -o ZXm_Panel_v1_ui.zip -d "$INSTALL_DIR"
else
  echo "❌ Error: ZXm_Panel_v1_ui.zip not found in current directory."
  exit 1
fi

# Step 4: Set permissions
echo "🔧 Setting permissions..."
sudo chown -R www-data:www-data "$INSTALL_DIR"
sudo chmod -R 755 "$INSTALL_DIR"

# Step 5: Start local preview (optional)
echo ""
read -p "🌐 Do you want to open the panel in your browser? (y/n): " OPEN_BROWSER

if [[ "$OPEN_BROWSER" == "y" || "$OPEN_BROWSER" == "Y" ]]; then
  echo "🚀 Opening panel at http://localhost/ZXm_Panel ..."
  xdg-open "http://localhost/ZXm_Panel" >/dev/null 2>&1 &
fi

echo ""
echo "✅ ZXm_Panel installation complete!"
echo "👉 Access your panel at: http://localhost/ZXm_Panel"
echo ""
echo "========================================"
echo "     ⚡ Installation Successful ⚡"
echo "========================================"
echo ""

