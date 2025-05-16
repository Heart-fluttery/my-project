"""
author : 이학현
description : 이미지 할 일 리스트 앱에 사용될 로컬 백엔드
date : 2025.05.15
version : 1
"""

from fastapi import FastAPI
from pydantic import BaseModel
import pymysql

app = FastAPI()

class TodoList(BaseModel):
    contents: str
    image: str
    insertdate: str

class TodoListSeq(BaseModel):
    seq: int




def connect():
    conn = pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="qwer1234",
        db="python",
        charset="utf8"
    )
    return conn

@app.get("/select")
async def select():
    # Connection
    conn = connect()
    curs = conn.cursor() # 불러온 걸 다 들고 오기

    # SQL
    sql = "SELECT * FROM imagetodolist"
    curs.execute(sql) # sql화면에서 명령문 입력 후 실행과 동일
    rows = curs.fetchall()
    conn.close()

    # 결과값을 Dictionary로 변환
    result = [{'seq':row[0], 'contents':row[1], 'image':row[2], 'insertdate':row[3]} for row in rows]
    return {'results' : result}


@app.post("/insert")
async def insert(todolist: TodoList):
    # Connection
    conn = connect()
    curs = conn.cursor()

    # SQL
    try:
        sql = "insert into imagetodolist(contents, image, insertdate) values (%s,%s,%s)"
        curs.execute(sql, (todolist.contents, todolist.image, todolist.insertdate))
        conn.commit()
        conn.close()
        return {'result':'OK'}
    except Exception as ex:
        conn.close()
        print("Error :", ex)
        return {'result':'Error'}

@app.post("/delete")
async def delete(todolistSeq: TodoListSeq):
    # Connection
    conn = connect()
    curs = conn.cursor()

    # SQL
    try:
        sql = "delete from imagetodolist where seq = %s"
        curs.execute(sql, (todolistSeq.seq))
        conn.commit()
        conn.close()
        return {'result':'OK'}
    except Exception as ex:
        conn.close()
        print("Error :", ex)
        return {'result':'Error'}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)