@echo off
echo 🔧 Starting setup (Windows)...

:: Step 1: Create virtual environment
if not exist venv (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

:: Step 2: Activate virtual environment
call venv\Scripts\activate

:: Step 3: Upgrade pip
echo ⬆️  Upgrading pip...
python -m pip install --upgrade pip

:: Step 4: Install dependencies
echo 📥 Installing dependencies from requirements.txt...
pip install -r requirements.txt

:: Step 5: Check for AWS CLI
where aws >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ AWS CLI not found. Please install it from: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html
) else (
    aws configure set region eu-north-1
    echo ✅ AWS CLI configured
)

echo ✅ Setup complete! Run your script with:
echo venv\Scripts\activate && python scripts\uploader.py
