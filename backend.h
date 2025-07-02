#pragma once
#include <QDebug>
#include <QObject>
#include <QSqlQuery>

class backend: public QObject
{
    Q_OBJECT
    QString username;
    QString password;
    Q_PROPERTY(bool textVisible READ isUserwarVisible NOTIFY textVisibleChanged)
    bool userwarning = false;
    Q_PROPERTY(bool is_logged READ isLoggedVisible NOTIFY LoggedChanged)
private:
    bool isLogged = false;
public:
    backend(QObject  *parent = nullptr): QObject(parent) {};

    Q_INVOKABLE void massege(){
        qDebug() << "MASSAGE";
    }

    Q_INVOKABLE void getuser(const QString t) {
        QSqlQuery q;
        q.prepare("SELECT 1 FROM user WHERE username = :username LIMIT 1;");
        q.bindValue(":username", t);
        if(!q.exec() || q.next() || (t.size() < 1)){
            if(!userwarning)
                userwarning = true;
            emit textVisibleChanged();
            return;
        }
        if(userwarning)
            userwarning = false;
        emit textVisibleChanged();
        username = t;
        qDebug() << "username:" << username;
    }



    Q_INVOKABLE void getpass(const QString t) {
        password = t;
        qDebug() << "password:" << t;
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
        }
    }

    bool isUserwarVisible() const { return userwarning; }
    bool isLoggedVisible() const { return isLogged; }
    signals:
        void textVisibleChanged();
        void LoggedChanged();
};
