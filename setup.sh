#!/bin/bash

echo "🔧 Starting setup (macOS/Linux)..."

# Exit if any command fails
set -e

# Step 1: Create virtual environment
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

echo "✅ Activating virtual environment..."
source venv/bin/activate

# Step 2: Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Step 3: Install dependencies
echo "📥 Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Step 4: Install AWS CLI if missing
if ! command -v aws &> /dev/null; then
    echo "📦 Installing AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
fi

# Step 5: Set default region
aws configure set region eu-north-1

echo "✅ Setup complete! Run your script with:"
echo "source venv/bin/activate && python scripts/uploader.py"
