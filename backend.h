#pragma once
#include <QDebug>
#include <QObject>
#include <QSqlQuery>
using namespace std;

class backend: public QObject
{
    Q_OBJECT
    QString username;
    QString password;
    Q_PROPERTY(bool textVisible READ isUserwarVisible NOTIFY textVisibleChanged)
    bool userwarning = false;
    Q_PROPERTY(bool is_logged READ isLoggedVisible NOTIFY LoggedChanged)
    Q_PROPERTY(QString usernam READ Getusernam NOTIFY usernamChanged)
    int TotalMinutes;
private:
    bool isLogged = true;
public:
    backend(QObject  *parent = nullptr): QObject(parent) {};



    bool IsInDB(){
        QSqlQuery q;
        q.prepare("SELECT 1 FROM user WHERE username = :username LIMIT 1;");
        q.bindValue(":username", username);
        if(!q.exec() || !q.next() || (username.size() < 1)){
            return false;
        }
        return true;
    }
    bool IsCorrectPass(){
        QSqlQuery q;
        q.prepare("SELECT password FROM user WHERE username = :username;");
        q.bindValue(":username", username);
        q.exec();
        q.next();
        QString DBpassword = q.value(0).toString();
        if(password == DBpassword){
            return true;
        }
        qDebug() << "Entered password:" << password << "             correct pass:" << DBpassword;
        return false;
    }



    bool ShowLoginWarning(){
        if(!IsInDB() || !IsCorrectPass()){
            userwarning = true;
            emit textVisibleChanged();
            return true;
        }
        userwarning = false;
        return false;
    }



    Q_INVOKABLE void setTotalMinutes(int a){TotalMinutes = a;}
    Q_INVOKABLE int getTotalMinutes(){return TotalMinutes;}
    Q_INVOKABLE void getuser(const QString t) {
        username = t;
        qDebug() << "username:" << username;
    }
    Q_INVOKABLE void getpass(const QString t) {
        password = t;
        qDebug() << "password:" << password;
    }




    Q_INVOKABLE void adduser(){
        QSqlQuery q;
        if(userwarning)
            return;
        qDebug() << "this is username:" << username << "  and this is password" << password;
        q.prepare("INSERT INTO user (username, password) VALUES (:username, :password)");
        q.bindValue(":username", username);
        q.bindValue(":password", password);

        if (!q.exec()) {
            qDebug() << "INSERT FAILED:";
            return;
        }
        isLogged = true;
        emit LoggedChanged();
        emit loginSuccess();
    }
    Q_INVOKABLE void loginuser(){
        if(ShowLoginWarning()){
            return;
        }
        isLogged = true;
        emit LoggedChanged();
        emit loginSuccess();
    }

    bool isUserwarVisible() const { return userwarning; }
    bool isLoggedVisible() const { return isLogged; }
    QString Getusernam() const { return username; }
    signals:
        void textVisibleChanged();
        void LoggedChanged();
        void loginSuccess();
        void usernamChanged();
};
