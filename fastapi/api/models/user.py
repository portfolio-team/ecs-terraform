from datetime import datetime
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from sqlalchemy.orm import relationship

from api.db import Base

class User(Base):
    __tablename__ = "user"

    id = Column(Integer, primary_key=True)
    first_name = Column(String(1024))
    last_name = Column(String(1024))
    created_at = Column(DateTime, default=datetime.now(), nullable=False)

    tasks = relationship("Task", back_populates="user", cascade="delete")
