#include "ver.h"
#include <Windows.h>
#include <urlmon.h>
#include <fstream>
#include <QThread>
#include <iostream>
#include <QDebug>
#include <QString>
#include <QCoreApplication>

#pragma comment(lib, "urlmon.lib")

Ver::Ver(QObject *parent) : QObject(parent)
{
}

void Ver::ver()
{
    QThread* thread = new QThread(this);
    this->moveToThread(thread);
    connect(thread, &QThread::finished, thread, &QThread::deleteLater);
    thread->start();

    QString appPath = QCoreApplication::applicationDirPath();
    QString url = "https://gitcode.net/yyx2216/genshin-prays-for-class-qml/-/raw/master/ver.json?inline=false";
    QString filePath = appPath + "/Updown/ver.json";

    connect(thread, &QThread::started, [=]() {
        try{
            QStringList verlist;

            HRESULT hr = CoInitialize(NULL); // 初始化COM库
            hr = URLDownloadToFile(NULL, url.toStdWString().c_str(), filePath.toStdWString().c_str(), 0, NULL);
            CoUninitialize();

            QFile file(filePath);
            file.open(QIODevice::ReadOnly | QIODevice::Text);
            QByteArray jsonData = file.readAll();
            file.close();
            QJsonDocument jsonDocument =  QJsonDocument::fromJson(jsonData);
            //QJsonObject jsonObject = jsonDocument.object();
            QMap<QString,QVariant> qmap = jsonDocument.toVariant().toMap();

            emit myver(qmap);
            thread->quit();

        }
        catch(...){}
    });
}


