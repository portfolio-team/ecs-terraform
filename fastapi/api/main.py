from fastapi import FastAPI
from api.routers import task, done, health_check

app = FastAPI()
app.include_router(health_check.router)
app.include_router(task.router)
app.include_router(done.router)