#include "ver.h"
#include <Windows.h>
#include <urlmon.h>
#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <QThread>
#include <QDebug>
#include <QString>
#include <QCoreApplication>
#include <QQmlApplicationEngine>
#pragma comment(lib, "urlmon.lib")

Ver::Ver(QObject *parent) : QObject(parent)
{
}

void Ver::ver()
{
    QThread* thread = new QThread(this);
    this->moveToThread(thread);

    connect(thread, &QThread::started, [=]() {
        try{
            HRESULT hr = CoInitialize(NULL); // 初始化COM库

            QString appPath = QCoreApplication::applicationDirPath();
            QString url = "https://gitcode.net/yyx2216/genshin-prays-for-class-qml/-/raw/master/ver.json?inline=false";
            QString filePath = appPath + "/Updown/ver.json";

            hr = URLDownloadToFile(NULL, url.toStdWString().c_str(), filePath.toStdWString().c_str(), 0, NULL);

            CoUninitialize();

            if (SUCCEEDED(hr))
            {
                std::ifstream jsonFile(filePath.toStdString());  // Convert QString to std::string
                nlohmann::json jsonData;
                jsonFile >> jsonData;

                QString v = QString::fromStdString(jsonData.at("v"));
                emit myver(v);
            }
            thread->quit();
        }
        catch(...){
        }
    });

    connect(thread, &QThread::finished, thread, &QThread::deleteLater);
    thread->start();
}
