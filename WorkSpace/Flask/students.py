# -*- coding: utf-8 -*-
'''
author : 김상범
Description: 파이썬 백엔드 with flask
date : 2025 - 05 -14
'''

from flask import Flask, jsonify, request
import joblib
import pymysql
import json

app=Flask(__name__)
app.config['JSON_AS_ASCII'] = False # for utf-8

def connection():
    # MYSQL Connection (저기의 host는 db위치)
    conn = pymysql.connect(
        host='127.0.0.1',
        user = 'root',
        password='qwer1234',
        db='education',
        charset='utf8'
    )
    return conn

@app.route("/select")
def select():
    conn = connection()
    curs = conn.cursor()

    # SQL 문장
    sql = "SELECT scode, sname, sdept, sphone FROM student"
    curs.execute(sql)
    rows = curs.fetchall()
    conn.close()
    result = []
    for row in rows:
        tempDict = {
            'code': row[0],
            'name': row[1],
            'dept': row[2],
            'phone': row[3]
        }
        result.append(tempDict)
    return jsonify({'result':result})



@app.route("/insert") #http://127.0.0.1/insert?code=__&name=__&dept=__&phone__
def insert():
    # Request Get
    code = request.args.get("code")
    name = request.args.get("name")
    dept = request.args.get("dept")
    phone = request.args.get("phone")

    # conn & cursor
    conn = connection()
    curs = conn.cursor()

    # SQL
    try:
        sql = 'insert into student(scode, sname, sdept, sphone) values(%s,%s,%s,%s)'
        curs.execute(sql,(code,name,dept,phone))
    except:
        return jsonify([{'result':'error'}])
    else:
        return jsonify([{'result':'OK'}])
    finally:
        conn.commit()

@app.route("/update") #http://127.0.0.1/update?code=__&name=__&dept=__&phone__
def update():
    # Request Get
    code = request.args.get("code")
    name = request.args.get("name")
    dept = request.args.get("dept")
    phone = request.args.get("phone")

    # conn & cursor
    conn = connection()
    curs = conn.cursor()

    # SQL
    try:
        sql = 'update student set sname=%s, sphone=%s, sdept=%s where scode=%s'
        curs.execute(sql,(name,phone,dept,code))
    except:
        return jsonify([{'result':'error'}])
    else:
        return jsonify([{'result':'OK'}])
    finally:
        conn.commit()


@app.route("/delete") #http://127.0.0.1/delete?code=__
def delete():
    # Request Get
    code = request.args.get("code")

    # conn & cursor
    conn = connection()
    curs = conn.cursor()

    # SQL
    try:
        sql = 'delete from student where scode=%s'
        curs.execute(sql,(code))
    except:
        return jsonify([{'result':'error'}])
    else:
        return jsonify([{'result':'OK'}])
    finally:
        conn.commit()



if __name__ == "__main__":
    app.run(host='127.0.0.1', port=5000, debug=True)