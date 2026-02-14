from pydantic_settings import BaseSettings
from typing import Optional


class Settings(BaseSettings):
    # Database
    database_url: str = "sqlite:///./control_fit.db"
    
    # CORS: en producción poner la URL del frontend (ej. https://tu-app.vercel.app), separadas por coma si hay varias
    cors_origins: str = "http://localhost:3000,http://127.0.0.1:3000"
    
    # JWT
    secret_key: str = "change-this-in-production"
    algorithm: str = "HS256"
    access_token_expire_minutes: int = 30
    
    # AI Services (optional for MVP)
    openai_api_key: Optional[str] = None
    
    # Storage
    photos_storage_path: str = "./storage/photos"
    
    class Config:
        env_file = ".env"
        case_sensitive = False


settings = Settings()
