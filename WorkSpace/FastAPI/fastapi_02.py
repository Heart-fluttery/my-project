from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def rea_root():
    return {"message" : "Hello, World!"}

@app.get("/items/{item_id}")
async def read_item(item_id: int, query_param: str = None):
    return {"item_id" : item_id, "query_param" : query_param}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)