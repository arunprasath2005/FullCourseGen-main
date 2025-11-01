# FullCourseGen - Frontend

This repository contains backend Python scripts and a simple static frontend (`frontend.html`) to interact with the backend's `/generate-course` endpoint.

What I added
- `frontend.html` — a small UI to enter subject, difficulty, focus area and number of units. It also has a configurable Server URL input (defaults to `http://localhost:8000`).

Quick usage
1. Start your backend so it listens on `http://localhost:8000` (or change the Server URL in the page to match your backend).
2. Serve the static file folder (project root) so the browser can load `frontend.html`.

To serve using Python (PowerShell):

```powershell
# serve current directory at http://0.0.0.0:8000
python -m http.server 8000
```

Then open: http://localhost:8000/frontend.html

CORS note
- If your backend runs on a different origin (port/host) you must enable CORS on the backend or set the server URL to the backend origin and ensure CORS headers allow the request.

If you want, I can:
- Add a tiny Flask/Starlette example showing how the backend could implement `/generate-course` and enable CORS.
- Add more frontend features (preview templates, copy/download already added, nicer styling).
