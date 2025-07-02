#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    backend backend;



    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setConnectOptions("MYSQL_OPT_SSL_MODE=DISABLED");
    db.setHostName("localhost");
    db.setPort(3306);
    db.setDatabaseName("mydb");
    db.setUserName("root");
    db.setPassword("Mrmikola1");
    if(!db.open()){
        qDebug() << "FAILED TO OPEN DB" << db.lastError().text();
        return -1;
    }
    else{qDebug() << "Connected to db";}




    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("cppBackend", &backend);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("time", "Main");
    if (engine.rootObjects().isEmpty())
        return -1;



    QSqlQuery show_db("SELECT * FROM user");
    qDebug() << "START OF DB:";
    while(show_db.next()){
        qDebug() << show_db.value("ID") << show_db.value("username").toString() << show_db.value("password").toString();
    }
    return app.exec();
}
