# Quick Start Guide - Full Course Generator

## 3 Simple Steps to Get Running

### Step 1: Install Dependencies
```bash
python3 -m pip install --break-system-packages -r requirements.txt
```

### Step 2: Configure API Key
Edit the `.env` file and replace with your actual Gemini API key:
```bash
GOOGLE_GEMINI_KEY=YOUR_ACTUAL_API_KEY_HERE
```

Get your API key from: https://makersuite.google.com/app/apikey

### Step 3: Start the Application

**Terminal 1 - Backend Server:**
```bash
./start_server.sh
```
Or simply:
```bash
python3 main.py
```

**Terminal 2 - Frontend Server:**
```bash
python3 -m http.server 8080
```

**Then open your browser:**
```
http://localhost:8080/frontend.html
```

## That's It!

You should now see the Full Course Generator interface with 6 feature tabs:
1. Generate Course
2. Generate MCQs
3. Doubt Chatbot
4. Predict Level
5. Course Recommendation
6. Detect Domain

## Test It

Try the "Predict Level" feature first (it's the quickest):
- Switch to "Predict Level" tab
- Score: 8
- Time: 70
- Click "Predict Level"
- Result: "Advanced"

## Troubleshooting

**Error: "Module not found"**
→ Run: `python3 -m pip install --break-system-packages -r requirements.txt`

**Error: "Port already in use"**
→ Run: `pkill -f "python3.*main.py"` then try again

**Error: "GOOGLE_GEMINI_KEY not set"**
→ Edit `.env` file with your actual API key

## Full Documentation

See `SETUP_GUIDE.md` for complete documentation.
