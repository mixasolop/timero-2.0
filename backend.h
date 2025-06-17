#pragma once
#include <QDebug>
#include <QObject>

class backend: public QObject
{
    Q_OBJECT
    QString username;
    QString password;
    Q_PROPERTY(bool textVisible READ isUserwarVisible NOTIFY textVisibleChanged)
    bool userwarning = false;
public:
    backend(QObject  *parent = nullptr): QObject(parent) {};
    Q_INVOKABLE void getuser(const QString t) {
        if(t == "Vlada Holas"){
            if(!userwarning){
                userwarning = true;
            }
            emit textVisibleChanged();
            return;
        }
        if(t != "mixa"){
            if(userwarning){
                userwarning = false;
            }
            emit textVisibleChanged();
            username = t;
            qDebug() << "your user name:" << username;
        }
    }
    Q_INVOKABLE void getpass(const QString t) {
        username = t;
        qDebug() << "your password:" << t;}
    bool isUserwarVisible() const { return userwarning; }

    signals:
        void textVisibleChanged();
};
