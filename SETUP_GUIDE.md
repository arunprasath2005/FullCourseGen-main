# Full Course Generator - Setup & Running Guide

## Overview
This is a FastAPI-based backend with a modern HTML/CSS/JS frontend that uses Google Gemini AI to generate educational content, MCQ questions, course recommendations, and more.

## Project Structure
```
project/
├── main.py                    # Main backend server (all endpoints)
├── frontend.html              # Modern web UI
├── requirements.txt           # Python dependencies
├── .env                       # Environment variables (Gemini API key)
├── start_server.sh           # Server startup script
├── contentlabelall.py        # Legacy file (domain detection)
├── courserecommendataion.py  # Legacy file (recommendations)
├── fullcoursegen.py          # Legacy file (course generation)
├── fullmcqgen.py             # Legacy file (MCQ generation)
└── README.md                 # Original project documentation
```

## Prerequisites
- Python 3.13+ installed
- pip/pip3 package manager
- Google Gemini API key

## Installation Steps

### 1. Install Python Dependencies
```bash
python3 -m pip install --break-system-packages -r requirements.txt
```

Or if you prefer using a virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Configure Environment Variables
The `.env` file already exists with the following variables:
```
GOOGLE_GEMINI_KEY=<YOUR_API_KEY>
```

**IMPORTANT**: Replace the API key with your actual Google Gemini API key from:
https://makersuite.google.com/app/apikey

### 3. Start the Backend Server

**Option A: Using the startup script (recommended)**
```bash
./start_server.sh
```

**Option B: Manual start**
```bash
python3 main.py
```

**Option C: Using uvicorn directly**
```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

The server will start on: `http://0.0.0.0:8000`

### 4. Access the Frontend
Open `frontend.html` in your browser:

**Option A: Direct file access**
```
file:///path/to/project/frontend.html
```

**Option B: Using Python's built-in server (recommended for CORS)**
```bash
python3 -m http.server 8080
```
Then open: `http://localhost:8080/frontend.html`

## API Endpoints

### 1. Generate Complete Course
- **Endpoint**: `POST /generate-course`
- **Body**:
  ```json
  {
    "subject": "Python",
    "difficulty": "medium",
    "focus_area": "Web Development",
    "units": 5
  }
  ```

### 2. Generate MCQ Questions
- **Endpoint**: `POST /generate-question`
- **Body**: Same as generate-course

### 3. Doubt Chatbot
- **Endpoint**: `POST /doubt-chatbot`
- **Body**:
  ```json
  {
    "ques": "What is Python?"
  }
  ```

### 4. Predict Student Level
- **Endpoint**: `POST /predict-level`
- **Body**:
  ```json
  {
    "score": 7.5,
    "time_taken": 80
  }
  ```

### 5. Course Recommendation
- **Endpoint**: `POST /course-recommendation`
- **Body**:
  ```json
  {
    "student_level": "Intermediate",
    "course": "Data Science"
  }
  ```

### 6. Detect Domain from File
- **Endpoint**: `POST /detect-domain-from-file`
- **Body**:
  ```json
  {
    "file_url": "https://example.com/document.pdf"
  }
  ```

## Testing the API

### Using curl
```bash
# Test root endpoint
curl http://localhost:8000/

# Test predict level
curl -X POST http://localhost:8000/predict-level \
  -H "Content-Type: application/json" \
  -d '{"score": 8, "time_taken": 70}'

# Test chatbot
curl -X POST http://localhost:8000/doubt-chatbot \
  -H "Content-Type: application/json" \
  -d '{"ques": "What is Python?"}'
```

### Using the Frontend UI
1. Open `frontend.html` in your browser
2. Use the tab navigation to switch between features
3. Fill in the form fields
4. Click the action button
5. View results in the output section
6. Use Copy/Download buttons to save results

## Features

### Frontend Features
- Modern, responsive UI design
- Tab-based navigation
- Real-time API communication
- Copy to clipboard functionality
- Download results as JSON
- Clean error handling
- Loading indicators

### Backend Features
- FastAPI with async support
- CORS enabled for all origins
- Comprehensive error handling
- YouTube video integration
- File parsing (PDF, DOCX, PPTX)
- Google Gemini AI integration
- JSON response formatting

## Troubleshooting

### Issue: "Module not found" errors
**Solution**: Install dependencies
```bash
python3 -m pip install --break-system-packages -r requirements.txt
```

### Issue: "GOOGLE_GEMINI_KEY not set"
**Solution**: Edit `.env` file and add your API key
```bash
GOOGLE_GEMINI_KEY=your_actual_api_key_here
```

### Issue: CORS errors in frontend
**Solution**: Serve frontend using HTTP server, not file:// protocol
```bash
python3 -m http.server 8080
```

### Issue: "Port 8000 already in use"
**Solution**: Kill existing process or use different port
```bash
# Kill existing process
pkill -f "python3.*main.py"

# Or use different port
uvicorn main:app --port 8001
```

### Issue: Gemini API errors
**Solution**: Check your API key and quota at:
https://makersuite.google.com/app/apikey

## Notes

- All legacy Python files (contentlabelall.py, courserecommendataion.py, etc.) are kept for reference but not used
- The main application runs entirely from `main.py`
- Frontend connects to `http://localhost:8000` by default
- YouTube integration requires valid YouTube API key (already configured)
- File upload feature requires publicly accessible URLs

## Development

To modify the application:

1. **Backend changes**: Edit `main.py`
2. **Frontend changes**: Edit `frontend.html`
3. **Dependencies**: Update `requirements.txt`
4. **Environment**: Update `.env`

Restart the server after backend changes for them to take effect.

## Production Deployment

For production deployment:

1. Set proper environment variables
2. Use production WSGI server (gunicorn)
3. Enable HTTPS
4. Set specific CORS origins (not *)
5. Add rate limiting
6. Implement proper logging
7. Use environment-specific configs

Example production command:
```bash
gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
```

## License
See project documentation for license information.

## Support
For issues or questions, refer to the original README.md or project documentation.
