from pydantic import BaseModel, Field, field_validator
from datetime import date, datetime
from typing import Optional


class DailyLogBase(BaseModel):
    date: date
    
    @field_validator('date', mode='before')
    @classmethod
    def parse_date(cls, v):
        """Parse date string to date object without timezone conversion"""
        if isinstance(v, str):
            # Si es string, parsear directamente sin timezone
            # date.fromisoformat() parsea YYYY-MM-DD correctamente sin timezone
            try:
                return date.fromisoformat(v)
            except ValueError:
                # Si falla, intentar parsear otros formatos comunes
                try:
                    # Intentar parsear como datetime y extraer solo la fecha
                    dt = datetime.fromisoformat(v.replace('Z', '+00:00'))
                    return dt.date()
                except ValueError:
                    raise ValueError(f"Invalid date format: {v}. Expected YYYY-MM-DD")
        return v
    weight: Optional[float] = Field(None, gt=0, description="Weight in kg")
    sleep_hours: Optional[float] = Field(None, ge=0, le=24, description="Sleep hours")
    training_done: bool = False
    calories: Optional[int] = Field(None, ge=0, description="Calories consumed")
    calories_source: Optional[str] = Field(None, pattern="^(manual|estimated)$")
    notes: Optional[str] = None


class DailyLogCreate(DailyLogBase):
    pass


class DailyLogUpdate(BaseModel):
    date: Optional[date] = None
    
    @field_validator('date', mode='before')
    @classmethod
    def parse_date(cls, v):
        """Parse date string to date object without timezone conversion"""
        if v is None:
            return None
        if isinstance(v, str):
            # Si es string, parsear directamente sin timezone
            try:
                return date.fromisoformat(v)
            except ValueError:
                try:
                    dt = datetime.fromisoformat(v.replace('Z', '+00:00'))
                    return dt.date()
                except ValueError:
                    raise ValueError(f"Invalid date format: {v}. Expected YYYY-MM-DD")
        return v
    weight: Optional[float] = Field(None, gt=0)
    sleep_hours: Optional[float] = Field(None, ge=0, le=24)
    training_done: Optional[bool] = None
    calories: Optional[int] = Field(None, ge=0)
    calories_source: Optional[str] = Field(None, pattern="^(manual|estimated)$")
    notes: Optional[str] = None


class DailyLogResponse(DailyLogBase):
    id: int
    user_id: int
    created_at: datetime
    updated_at: Optional[datetime] = None

    class Config:
        from_attributes = True
