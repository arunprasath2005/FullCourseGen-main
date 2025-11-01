#!/bin/bash

echo "Starting Full Course Generator Backend Server..."
echo "================================================"
echo ""

cd "$(dirname "$0")"

if [ ! -f ".env" ]; then
    echo "Error: .env file not found!"
    echo "Creating .env file with placeholder..."
    echo "GOOGLE_GEMINI_KEY=YOUR_API_KEY_HERE" > .env
    echo ""
    echo "Please edit .env file and add your actual Google Gemini API key."
    exit 1
fi

echo "Checking dependencies..."
python3 -m pip install --break-system-packages -q -r requirements.txt 2>&1 | grep -v "WARNING"

echo ""
echo "Starting FastAPI server on http://0.0.0.0:8000"
echo "Press CTRL+C to stop the server"
echo ""
echo "Available endpoints:"
echo "  GET  / - API information"
echo "  POST /generate-course - Generate complete course"
echo "  POST /generate-question - Generate MCQ questions"
echo "  POST /doubt-chatbot - Ask educational questions"
echo "  POST /predict-level - Predict student level"
echo "  POST /course-recommendation - Get course recommendations"
echo "  POST /detect-domain-from-file - Detect domain from file"
echo ""

python3 main.py
