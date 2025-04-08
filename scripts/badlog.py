from datetime import datetime
import os

filename = f"log_{datetime.now().strftime('%Y-%m-%dT%H-%M-%S')}.log"
filepath = os.path.join("scripts/logs/", filename)

os.makedirs("scripts/logs/", exist_ok=True)

with open(filepath, "wb") as f:
    f.write(b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A")

print(f"🧪 Created broken log at: {filepath}")