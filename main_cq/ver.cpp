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

            std::ifstream jsonFile(filePath.toStdString());  // Convert QString to std::string
            nlohmann::json jsonData;
            jsonFile >> jsonData;


            try {
                verlist << QString::fromStdString(jsonData.at("v"));
            } catch (...) {
                verlist << "0";
            }
            try {
                verlist << QString::fromStdString(jsonData.at("asay"));
            } catch (...) {
                 verlist << "基于QML和C++开发\n版本:2023/1/12\n\nXpercent工作室制作\n\n贡献名单: YX\n\n未经允许,禁止转载！\n\n\n\n\n\n\n联系YX ↓";
            }
            try {
                verlist << QString::fromStdString(jsonData.at("otheradd"));
            } catch (...) {
                verlist << "";
            }



            emit myver(verlist);
            thread->quit();

        }
        catch(...){}
    });
}


