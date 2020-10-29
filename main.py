import logging
import os

from fastapi import FastAPI

logger = logging.getLogger(__name__)
app = FastAPI()

WEBAPP_VALUE = os.environ["WEBAPP_VALUE"]


@app.get("/")
async def index():
    logger.info("in index")
    return {"hello": "world %s" % WEBAPP_VALUE}