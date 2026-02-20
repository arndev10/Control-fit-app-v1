# Control Fit App v1

Full-stack fitness tracking application for monitoring body composition, daily habits, and physical progress.

## Features

- Daily logging: weight, sleep, training, calories
- Body photo management with metadata
- Weight trend charts and progress visualization
- Cheat meal tracking
- Profile versioning and historical data

## Tech Stack

**Backend:** Python, FastAPI, SQLAlchemy, SQLite, Pydantic
**Frontend:** Next.js 14, React 18, TypeScript, Axios

## Setup

### Backend

```bash
cd backend
python -m venv venv
venv\Scripts\activate  # Windows
pip install -r requirements.txt
python -m uvicorn app.main:app --reload
```

Backend runs at `http://localhost:8000`

### Frontend

```bash
cd frontend
npm install
npm run dev
```

Frontend runs at `http://localhost:3000`

## Project Structure

```
├── backend/
│   ├── app/            # FastAPI application
│   ├── storage/        # Local file storage
│   └── requirements.txt
├── frontend/
│   ├── app/            # Next.js pages
│   ├── components/     # React components
│   ├── lib/            # Utilities
│   └── types/          # TypeScript types
└── render.yaml         # Render deployment config
```

## License

Open source — available for personal and educational use.
