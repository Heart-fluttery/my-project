from fastapi import FastAPI, UploadFile, File, Form
from fastapi.responses import Response
import pymysql

app = FastAPI()

def connect():
    return pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="qwer1234",
        db="python",
        charset="utf8"
    )

@app.get("/select")
async def select():
    conn = connect()
    curs = conn.cursor()
    curs.execute("SELECT seq, name, phone, address, relation FROM address ORDER BY name")
    rows = curs.fetchall()
    conn.close()
    result = [{'seq':row[0], 'name':row[1], 'phone':row[2], 'address':row[3], 'relation':row[4], }for row in rows]
    return {'results':result}

@app.get("/view/{seq}")
async def view(seq: int):
    try:
        conn=connect()
        curs=conn.cursor()
        curs.execute("SELECT image FROM address where seq = %s", (seq,))
        row = curs.fetchone()
        conn.close()
        if row and row[0]:
            return Response(
                content=row[0],
                media_type="image/jpeg",
                headers={"Cache-control" : "no-cache, no-store, must-revalidate"}
            )
        else:
            return{"result":"No image found"}
    except Exception as e:
        print("Error :", e)
        return{"result":"Error"}
    
@app.post("/insert") #(...)은 required
async def insert(name: str=Form(...), phone: str=Form(...), address: str=Form(...), relation: str=Form(...), file: UploadFile = File(...)):
    try:
        image_data = await file.read()
        conn = connect()
        curs = conn.cursor()
        sql = "INSERT INTO address (name, phone, address, relation, image) VALUES (%s, %s, %s, %s, %s)"
        curs.execute(sql, (name, phone, address, relation, image_data))
        conn.commit()
        conn.close()
        return {'result':'OK'}
    except Exception as e:
        print("Error:", e)
        return{"result":"Error"}
    
@app.post("/update")
async def update(seq: int = Form(...), name: str = Form(...), phone: str = Form(...), address: str=Form(...), relation: str=Form(...)):
    try:
        conn=connect()
        curs=conn.cursor()
        sql = "UPDATE address SET name=%s, phone=%s, address=%s, relation=%s WHERE seq=%s"
        curs.execute(sql, (name, phone, address, relation, seq))
        conn.commit()
        conn.close()
        return {'result' : 'OK'}
    except Exception as e:
        print("Error :", e)
        return {'result' : 'Error'}
    
@app.post("/update_with_image") #(...)은 required
async def update_with_image(seq: int= Form(...), name: str=Form(...), phone: str=Form(...), address: str=Form(...), relation: str=Form(...), file: UploadFile = File(...)):
    try:
        image_data = await file.read()
        conn = connect()
        curs = conn.cursor()
        sql = "UPDATE address SET name=%s, phone=%s, address=%s, relation=%s, image=%s WHERE seq=%s"
        curs.execute(sql, (name, phone, address, relation, image_data, seq))
        conn.commit()
        conn.close()
        return {'result':'OK'}
    except Exception as e:
        print("Error:", e)
        return{"result":"Error"}

@app.delete("/delete/{seq}")
async def delete(seq: int):
    try:
        conn=connect()
        curs=conn.cursor()
        curs.execute("DELETE FROM address where seq = %s", (seq,))
        conn.commit()
        conn.close()
        return {'rewult':'OK'}
    except Exception as e:
        print("Error:", e)
        return {"result":"Error"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)