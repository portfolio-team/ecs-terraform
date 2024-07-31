from typing import List, Optional
from datetime import datetime
import api.schemas.task as task_schema

from pydantic import BaseModel, Field


class UserBase(BaseModel):
    first_name: Optional[str] = Field(None, example="TARO")
    last_name: Optional[str] = Field(None, example="TANAKA")

class User(UserBase):
    id: int
    created_at: datetime
    tasks: List[task_schema.Task] = Field(default=[])
    class Config:
        orm_mode = True


class UserCreate(UserBase):
    pass

class UserCreateResponse(UserCreate):
    id: int
    created_at: datetime

    class Config:
        orm_mode = True