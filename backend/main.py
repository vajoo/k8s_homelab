from fastapi import FastAPI, APIRouter
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()
router = APIRouter(prefix="/api")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@router.get("/")
def read_root():
    return {"message": "Hello, World!", "hostname": os.getenv("HOSTNAME")}


app.include_router(router)