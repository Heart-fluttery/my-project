"""
author : 이학현
description : 학생 리스트 앱에 사용될 로컬 백엔드
date : 2025.05.15
version : 1
"""

from fastapi import FastAPI
from pydantic import BaseModel
import pymysql

app = FastAPI()

class Student(BaseModel):
    code: str
    name: str
    dept: str
    phone: str
    address: str

class StudentCode(BaseModel):
    code: str




def connect():
    conn = pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="qwer1234",
        db="education",
        charset="utf8"
    )
    return conn

@app.get("/select")
async def select():
    # Connection
    conn = connect()
    curs = conn.cursor() # 불러온 걸 다 들고 오기

    # SQL
    sql = "SELECT * FROM student"
    curs.execute(sql) # sql화면에서 명령문 입력 후 실행과 동일
    rows = curs.fetchall()
    conn.close()

    # 결과값을 Dictionary로 변환
    result = [{'code':row[0], 'name':row[1], 'dept':row[2], 'phone':row[3],'address': "" if row[4] == None else row[4]} for row in rows]
    return {'results' : result}


@app.post("/insert")
async def insert(student: Student):
    # Connection
    conn = connect()
    curs = conn.cursor()

    # SQL
    try:
        sql = "insert into student(scode, sname, sdept, sphone, saddress) values (%s,%s,%s,%s,%s)"
        curs.execute(sql, (student.code, student.name, student.dept, student.phone, student.address))
        conn.commit()
        conn.close()
        return {'result':'OK'}
    except Exception as ex:
        conn.close()
        print("Error :", ex)
        return {'result':'Error'}

@app.post("/update")
async def update(student: Student):
    # Connection
    conn = connect()
    curs = conn.cursor()

    # SQL
    try:
        sql = "update student set sname=%s, sdept=%s, sphone=%s, saddress=%s where scode=%s"
        curs.execute(sql, (student.name, student.dept, student.phone, student.address, student.code))
        conn.commit()
        conn.close()
        return {'result':'OK'}
    except Exception as ex:
        conn.close()
        print("Error :", ex)
        return {'result':'Error'}

@app.post("/delete")
async def delete(studentCode: StudentCode):
    # Connection
    conn = connect()
    curs = conn.cursor()

    # SQL
    try:
        sql = "delete from student where scode = %s"
        curs.execute(sql, (studentCode.code))
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