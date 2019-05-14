#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

# COPIED FROM MATERIALS
from bottle import Bottle, route, run, template, get, post, debug, static_file, request, redirect, response
import time
import random
import string
import logging
import sqlite3
import pandas as pd
import logging.handlers
import hashlib

def md5sum(t):
    return hashlib.md5(t).hexdigest()

log = logging.getLogger('bottle')
log.setLevel('INFO')
h = logging.handlers.TimedRotatingFileHandler(
    'logs/nlog', when='midnight', backupCount=9999)
f = logging.Formatter('%(asctime)s %(levelname)-8s %(message)s')
h.setFormatter(f)
log.addHandler(h)

secretKey = "SDMDSIUDSFYODS&TTFS987f9ds7f8sd6DFOUFYWE&FY"

app = Bottle()

# LOGIN DEFINED
@app.route('/static/:path#.+#', name='static')
def static(path):
    return static_file(path, root='./static')

def checkAuth():
    loginName = request.get_cookie("user", secret=secretKey, default=False)
    log.info(str(loginName) + ' ' + request.method + ' ' +
             request.url + ' ' + request.environ.get('REMOTE_ADDR'))
    userdataframe=getUserDataFrame()
    if len(userdataframe[userdataframe[4]==loginName].values.tolist())!=0:
        return loginName
    else:
        return redirect('/login')

def checkAuthADM():
    loginName = request.get_cookie("user", secret=secretKey, default=False)
    log.info(str(loginName) + ' ' + request.method + ' ' +
             request.url + ' ' + request.environ.get('REMOTE_ADDR'))
    userdataframe=getUserDataFrame()
    if loginName=='admin':
        return loginName
    else:
        return redirect('/profile')

def addUserToDB(x, loginName):
    conn = sqlite3.connect('project.db')
    conn.create_function("md5", 1, md5sum)
    c = conn.cursor()
    c.execute('SELECT * FROM users WHERE username="'+x[4]+'"')
    a=c.fetchall()
    if len(a)==0:
        c.execute('INSERT INTO users VALUES(?,?,?,?,?,md5(?),?,?,?,?,?)',x)
        conn.commit()
        conn.close()
        return 'User succesfully added to Database'
    else:
        conn.commit()
        conn.close()
        return redirect('/login-in-use')

def updateUserinDB(column, value):
    loginName = request.get_cookie("user", secret=secretKey, default=False)
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('UPDATE users SET '+column+'="'+value+'" WHERE username="'+loginName+'"')
    conn.commit()
    conn.close()
    return 'Info succesfully updated'

def addOpinionToDB(review, rating, username, film_name):
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    date_added = str(time.asctime(time.localtime(time.time())))
    c.execute('SELECT id_user FROM users WHERE username='+'"'+username+'"')
    id_user = c.fetchall()[0][0]
    c.execute('SELECT id_film FROM films WHERE title='+'"'+film_name+'"')
    id_film = c.fetchall()[0][0]
    c.execute('SELECT id_user, id_film FROM opinions')
    pairs=c.fetchall()

    pair_count=0
    for i in pairs:
        if i==(id_user, id_film):
            pair_count+=1
            break
    if pair_count>0:
        return 'You have already reviewed this film'
    else:
        y=(None, id_user, id_film, review, rating, date_added)
        c.execute('INSERT INTO opinions VALUES(?,?,?,?,?,?)',y)
        conn.commit()
        conn.close()
        return 'Opinion succesfully added to database'

def getOpinionDataFrame():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('SELECT * FROM opinions')
    listOfResults=c.fetchall()
    opinions_dataframe = pd.DataFrame(listOfResults)
    conn.commit()
    opinions_dataframe.columns=['id_opinion', 'id_user', 'id_film', 'opinion_text', 'film_rating', 'date_added']
    opinions_dataframe.index=opinions_dataframe.index+1
    return opinions_dataframe

def getFilmDataFrame():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('SELECT * FROM films')
    listOfResults=c.fetchall()
    film_dataframe = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    film_dataframe.columns=['id_film','name','pl_title','title','description','year','time','genre','poster_url','director','writer','stars']
    film_dataframe.index=film_dataframe.index+1
    return film_dataframe

def getUserDataFrame():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('SELECT * FROM users')
    listOfResults=c.fetchall()
    users_dataframe = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    return users_dataframe

def getUserInfo(login):
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute("SELECT * FROM users WHERE username='"+login+"'")
    listOfResults=c.fetchall()
    conn.commit()
    conn.close()
    return listOfResults

def getUserOpinionDataFrame():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('''SELECT a.id_user, a.id_film, a.opinion_text, a.film_rating, a.date_added, b.username, b.avatar_url
    FROM opinions as a
    JOIN users as b on a.id_user = b.id_user''')
    listOfResults=c.fetchall()
    joineddf = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    joineddf.columns=['id_user', 'id_film','opinion_text','film_rating','date_added','username','avatar_url']
    return joineddf

def getUserOpinionFilmDataFrame():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('''SELECT a.id_user, a.id_film, a.opinion_text, a.film_rating, a.date_added, b.username, b.avatar_url, c.name, c.poster_url, c.year, b.about_you
    FROM opinions as a
    JOIN users as b on a.id_user = b.id_user
    JOIN films as c on a.id_film = c.id_film''')
    listOfResults=c.fetchall()
    joineddf = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    joineddf.columns=['id_user', 'id_film','opinion_text','film_rating','date_added','username','avatar_url', 'name', 'poster_url','year','about_you']
    return joineddf

def getMostActiveUsers():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('''SELECT DISTINCT COUNT(a.id_user) as activity, b.username
    FROM opinions as a
    JOIN users as b on a.id_user = b.id_user
    GROUP BY b.username
    ORDER BY activity desc''')
    listOfResults=c.fetchall()
    activity_dataframe = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    return activity_dataframe

def getAvgRate1():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('''SELECT AVG(a.film_rating), b.name
    FROM opinions as a
    JOIN films as b on a.id_film = b.id_film
    GROUP BY name
    ORDER BY AVG(a.film_rating) desc''')
    listOfResults=c.fetchall()
    avg_dataframe1 = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    return avg_dataframe1

def getAvgRate2():
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('''SELECT AVG(a.film_rating), b.name
    FROM opinions as a
    JOIN films as b on a.id_film = b.id_film
    GROUP BY name
    ORDER BY AVG(a.film_rating)''')
    listOfResults=c.fetchall()
    avg_dataframe2 = pd.DataFrame(listOfResults)
    conn.commit()
    conn.close()
    return avg_dataframe2

def getmostPopularFilms(id_user):
    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE projekt AS
    SELECT b.name, a.id_opinion, a.id_user, b.title, b.year,
    CASE
        WHEN id_user='''+id_user+''' THEN 1
        WHEN id_user<>'''+id_user+''' THEN 0
        WHEN id_user IS NULL THEN 0
    END as count
    FROM films as b
    LEFT JOIN opinions as a on a.id_film=b.id_film
    UNION ALL
    SELECT b.name, a.id_opinion, a.id_user, b.title, b.year,
    CASE
        WHEN id_user='''+id_user+''' THEN 1
        WHEN id_user<>'''+id_user+''' THEN 0
        WHEN id_user IS NULL THEN 0
    END
    FROM opinions as a
    LEFT JOIN films as b on a.id_film=b.id_film
    WHERE a.id_user IS NULL''')
    c.execute('''SELECT name, COUNT(id_opinion) as zliczenie, SUM(count) as suma, title, year
    FROM projekt
    GROUP BY name
    HAVING suma=0
    ORDER BY zliczenie desc''')
    a=c.fetchall()
    c.execute('''DROP TABLE projekt''')
    conn.commit()
    conn.close()
    return a

@app.route('/sign_out')
@app.route('/sign_out/')
def sign_out():
    response.set_cookie("user", False, secret=secretKey)
    redirect('/')

@app.route('/login')
@app.route('/login/')
@app.route('/login', method='POST')
@app.route('/login/', method='POST')
def login():

    loginName = request.get_cookie("user", secret=secretKey, default=False)

    if loginName!=False:
        return template('base.tpl',base=''' <div class="jumbotron background-field" style="margin-bottom: 0px">
                                            <div class='container' style="padding-top:250px; padding-bottom:258px; margin-bottom: 135px">
                                            <center><h3>You are already logged in!</h3></center>
                                            </div></div>''', loginName=loginName)

    # rating = request.forms.get('rating')
    # review = request.forms.get('review')

    userdataframe = getUserDataFrame()
    loginName1 = request.forms.get('login_name', default='')
    password = request.forms.get('password', default='')
    if userdataframe[userdataframe[4]==loginName1].shape[0]!=0 and md5sum(bytes(password,'utf-8'))==userdataframe[userdataframe[4]==loginName1][5].values.tolist()[0] and loginName1!='admin':
        response.set_cookie("user", loginName1, secret=secretKey)
# # CCHANGED ADDRESS FROM INDEX TO CHOOSE
        redirect('/choose')
        return True
    elif loginName1=='admin' and md5sum(bytes(password,'utf-8'))==userdataframe[userdataframe[4]==loginName1][5].values.tolist()[0]:
        response.set_cookie("user", loginName1, secret=secretKey)
        redirect('/admin')
        return True
    else:
#         # OTHER TEMPLATE
        return template('index_login', loginName=loginName)

# STILL COPIED FROM MATERIALS, CCHANGED WEBSITE ADDRESS, REDIRECTED TO CHOOSING FILM, OTHER TEMPLATE OF WEBSITE - INDEX CHOOSE
@app.route('/choose')
@app.route('/choose', method='POST')
@app.route('/choose/')
@app.route('/choose/', method='POST')
@app.route('/choose/<message>')
@app.route('/choose/<message>', method='POST')
def index_choose(message=''):

    film_dataframe = getFilmDataFrame()
    film_cards = film_dataframe.values.tolist()
    loginName = checkAuth()

    return template('index_choose', film_dataframe=film_dataframe, film_cards=film_cards, loginName = loginName)

# OTHER ROUTES

# HOME PAGE
@app.route('/')
def index():

    loginName = request.get_cookie("user", secret=secretKey, default=False)

    return template('index',loginName=loginName)

@app.route('/welcome')
@app.route('/welcome/')
@app.route('/welcome', method='POST')
@app.route('/welcome/', method='POST')
def welcome():
    loginName = request.get_cookie("user", secret=secretKey, default=False)
    name = request.forms.get('name')
    surname = request.forms.get('surname')
    email = request.forms.get('email')
    login = request.forms.get('login')
    if request.forms.get('psw')!=None:
        psw = bytes(request.forms.get('psw'),'utf-8')
    else:
        psw = request.forms.get('psw')
    gender = request.forms.get('gender')
    date = request.forms.get('date')
    time_registered = time.time()

    userInfo = (None,name, surname, email, login, psw, gender, date, str(time.asctime(time.localtime(time_registered))), 'https://image.flaticon.com/icons/svg/126/126486.svg', 'No description has been set yet')
    addUserToDB(userInfo, loginName)

    return template('index_welcome', loginName=loginName)

#REGISTERING PAGE
@app.route('/register')
@app.route('/register/')
@app.route('/register', method='POST')
@app.route('/register/', method='POST')
def index_register():

    loginName = request.get_cookie("user", secret=secretKey, default=False)
    return template('index_register', loginName=loginName)

@app.route('/film/<film_name>')
@app.route('/film/<film_name>', method='POST')
@app.route('/film/<film_name>/')
@app.route('/film/<film_name>/', method='POST')
def index_film(film_name):

    loginName = checkAuth()

    film_dataframe = getFilmDataFrame()
    film_id = film_dataframe[film_dataframe.title==film_name].id_film.values.tolist()[0]
    film_info = film_dataframe[film_dataframe.title==film_name].values.tolist()[0]
    rating = request.forms.get('rating')
    review = request.forms.get('review')

    joineddf = getUserOpinionDataFrame()
    joineddf = joineddf[joineddf.id_film==film_id]
    opinion_username = joineddf.username.values.tolist()
    opinion_text = joineddf.opinion_text.values.tolist()
    film_rating = joineddf.film_rating.values.tolist()
    date_added = joineddf.date_added.values.tolist()
    avatar_url = joineddf.avatar_url.values.tolist()
    modal_title=''
    modal_text=''


    if rating!=None or review!=None:
        if addOpinionToDB(review, rating, loginName, film_name)=='You have already reviewed this film':
            modal_title='Oops!'
            modal_text='Seems that you have already reviewed this film. You can see it and also others in your profile.'

    return template('index_film', film_info=film_info, modal_title=modal_title, modal_text=modal_text,
    loginName = loginName, film_name=film_name, film_dataframe = film_dataframe, rating=rating, review=review, opinion_username=opinion_username, opinion_text=opinion_text,
    film_rating=film_rating, avatar_url=avatar_url, date_added=date_added, joineddf=joineddf, film_id = film_id)


@app.route('/admin')
@app.route('/admin/')
def index_admin():
    loginName = checkAuthADM()
    film_dataframe = getFilmDataFrame()
    number_of_films = len(film_dataframe)
    opinions_dataframe = getOpinionDataFrame()
    number_of_opinions = len(opinions_dataframe)
    users_dataframe = getUserDataFrame()
    number_of_users = len(users_dataframe)
    activity_dataframe = getMostActiveUsers()
    activity = activity_dataframe.values.tolist()
    avg_dataframe1 = getAvgRate1()
    most_liked = avg_dataframe1.values.tolist()
    avg_dataframe2 = getAvgRate2()
    most_disliked = avg_dataframe2.values.tolist()

    for i in most_disliked:
        i[0]=round(i[0],2)

    for i in most_liked:
        i[0]=round(i[0],2)

    return template('index_admin', number_of_films=number_of_films, film_dataframe=film_dataframe, opinions_dataframe=opinions_dataframe,
    number_of_opinions=number_of_opinions, users_dataframe=users_dataframe, number_of_users=number_of_users,activity=activity,
    avg_dataframe1=avg_dataframe1, avg_dataframe2=avg_dataframe2, most_liked=most_liked, most_disliked=most_disliked, loginName=loginName)

@app.route('/profile')
@app.route('/profile', method='POST')
@app.route('/profile/')
@app.route('/profile/', method='POST')
def index_profile():
    loginName = checkAuth()
    userinfo=list(getUserInfo(loginName)[0])
    name=['id','name','surname','mail','login','psw','gender', 'date','date_added','url','description']
    joineddf = getUserOpinionFilmDataFrame()
    joined = joineddf[joineddf.username==loginName].values.tolist()
    if len(joined)>3:
        joined=joined[-3:]
    popularfilmlist=getmostPopularFilms(str(userinfo[0]))
    if len(popularfilmlist)>10:
        popularfilmlist=popularfilmlist[0:10]
    return template('index_profile', joineddf=joineddf,joined=joined, loginName=loginName, userinfo=userinfo, popularfilmlist=popularfilmlist)


@app.route('/profile/edit')
@app.route('/profile/edit', method='POST')
@app.route('/profile/edit/')
@app.route('/profile/edit/', method='POST')
def index_edit():
    loginName = checkAuth()
    users_dataframe = getUserDataFrame()
    user_info = users_dataframe[users_dataframe[4]==loginName].values.tolist()[0]
    avatar_url = request.forms.get('img_url')
    name = request.forms.get('name')
    surname = request.forms.get('surname')
    birthdate = request.forms.get('birthdate')
    login = request.forms.get('login')
    email = request.forms.get('email')
    about = request.forms.get('about')
    change_dict = {"avatar_url":avatar_url, "name":name, "surname":surname, "birthdate":birthdate, "login":login, "email":email, "about_you":about}
    for i in change_dict:
        if change_dict[i]!=None:
            updateUserinDB(i, change_dict[i])
    return template('index_edit', loginName=loginName, user_info=user_info, users_dataframe=users_dataframe)


@app.route('/profile/reviews')
@app.route('/profile/reviews', method='POST')
@app.route('/profile/reviews/')
@app.route('/profile/reviews/', method='POST')
def index_reviews():
    loginName = checkAuth()
    joineddf = getUserOpinionFilmDataFrame()
    joined = joineddf[joineddf.username==loginName].values.tolist()
    rating = request.forms.get('rating')
    review = request.forms.get('review')
    return template('index_reviews',loginName=loginName, joined=joined, joineddf=joineddf, rating=rating, review=review)

@app.route('/password-change')
@app.route('/password-change', method='POST')
@app.route('/password-change/')
@app.route('/password-change/', method='POST')
def index_editreviews():
    loginName = checkAuth()
    passinfo =''
    userdataframe = getUserDataFrame()
    if request.forms.get("psw0")==None or request.forms.get("psw1")==None or request.forms.get("psw2")==None:
        psw0=request.forms.get("psw0")
        psw1=request.forms.get("psw1")
        psw2=request.forms.get("psw2")
    else:
        psw0=md5sum(bytes(request.forms.get("psw0"),'utf-8'))
        psw1=md5sum(bytes(request.forms.get("psw1"),'utf-8'))
        psw2=md5sum(bytes(request.forms.get("psw2"),'utf-8'))
    if psw0==userdataframe[userdataframe[4]==loginName][5].values.tolist()[0] and psw1==psw2:
        updateUserinDB('password',psw1)
        redirect('/profile')
        return True
    elif (psw0!=userdataframe[userdataframe[4]==loginName][5].values.tolist()[0] or psw1!=psw2) and psw1!=None and psw2!=None and psw0!=None:
        passinfo='Oops, something went wrong.'
        return template('index_password', loginName=loginName, passinfo=passinfo)
    else:
        return template('index_password', loginName=loginName, passinfo=passinfo)

@app.route('/profile/reviews/edit/<id_user>/<id_film>')
@app.route('/profile/reviews/edit/<id_user>/<id_film>', method='POST')
@app.route('/profile/reviews/edit/<id_user>/<id_film>/')
@app.route('/profile/reviews/edit/<id_user>/<id_film>/', method='POST')
def index_editreviews(id_user, id_film):
    loginName = checkAuth()
    joineddf = getUserOpinionFilmDataFrame()
    joined = joineddf[joineddf.username==loginName].values.tolist()
    if joined[0][0]==int(id_user):
        rating = request.forms.get('rating')
        review = request.forms.get('review')
        if review=='' and rating==None:
            redirect('/profile/reviews')
        elif type(review)==type('') and type(rating)==type(''):
            conn = sqlite3.connect('project.db')
            c = conn.cursor()
            c.execute('UPDATE opinions SET opinion_text="'+review+'", film_rating='+rating+' WHERE id_user='+id_user+' AND id_film='+id_film)
            conn.commit()
            conn.close()
            redirect('/profile/reviews')
        return template('index_editreview',loginName=loginName, joined=joined, joineddf=joineddf, rating=rating, review=review)
    else:
        return '''<h1> You don't have permission to access this site</h1>'''

@app.route('/delete-review/<id_user>/<id_film>')
@app.route('/delete-review/<id_user>/<id_film>/')
def delete_review(id_user, id_film):

    conn = sqlite3.connect('project.db')
    c = conn.cursor()
    c.execute('DELETE FROM opinions WHERE id_user='+id_user+' AND id_film='+id_film)
    conn.commit()
    conn.close()

    redirect('/profile/reviews')
    return True

@app.route('/login-in-use')
def login_in_use():
    loginName = request.get_cookie("user", secret=secretKey, default=False)
    return template('base.tpl',base=''' <div class="jumbotron background-field" style="margin-bottom: 0px">
                                        <div class='container' style="padding-top:250px; padding-bottom:258px; margin-bottom: 135px">
                                        <center><h3>This username alrady exists. Register unsuccessful.
                                        <a href="/register">Click here to try again</a></h3></center>
                                        </div></div>''', loginName=loginName)

app.run(host='localhost', port=12345, reloader=True, debug=True)
