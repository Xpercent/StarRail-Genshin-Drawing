//#include <windows.h>
#include <QGuiApplication>
#include <cqui.h>
#include <QString>
#include <fstream>
#include <nlohmann/json.hpp>
#include <QDebug>
#include <QDir>
#include <QRandomGenerator>
#include <iostream>

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
using json = nlohmann::json;

Cqui::Cqui(QObject *parent) : QObject(parent) {

}

void Cqui::re_studentl(QString appPath){
    std::string str_apppath = appPath.toStdString();
    std::ifstream file(str_apppath + "/file/student.json");//student.json
    nlohmann::json jsonList;
    file >> jsonList;
    auto list = jsonList;
    int coutnum = list.size();
    int coutnum2 = coutnum;
    int randomIndex;
    nlohmann::json list2;

    for (int i = 0; i < coutnum; ++i) {
        randomIndex = QRandomGenerator::global()->bounded(coutnum2);
        list2.push_back(list[randomIndex]);
        list.erase(list.begin() + randomIndex);
        coutnum2--;
    }
    std::ofstream o(str_apppath + "/file/studentl.json");
    o << std::setw(4) << list2 << std::endl;
}

void Cqui::ttoj() {
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::ifstream inputFile(str_apppath + "/file/student.txt");

    json jsonArray;// 创建JSON数组
    std::string line;// 逐行读取txt文件
    while (std::getline(inputFile, line)) {
        // 将每一行作为JSON对象的一个元素添加到数组中
        jsonArray.push_back(line);
    }
    inputFile.close();// 关闭txt文件
    std::ofstream outputFile(str_apppath + "/file/student.json");// 将JSON数组写入json文件
    outputFile << jsonArray.dump(4);  // 4用于设置缩进，使输出更易读
    outputFile.close();// 关闭json文件
    re_studentl(appPath);
}



QStringList Cqui::cqui(QString mainUI) {
    QString appPath = QCoreApplication::applicationDirPath();
    QString directoryPath = appPath + "/UI/" + mainUI + "/bgUI";
    std::string str_apppath = appPath.toStdString();
    std::string student_json = str_apppath + "/file/studentl.json";
    std::string var_json = str_apppath + "/file/var.json";
    std::string student = str_apppath + "/file/student.json";


    QStringList Qstr_cqvideo;
    ////
    QStringList video;
    QDir directory(directoryPath);
    QStringList filters;
    filters << "*.mp4";
    QStringList fileList = directory.entryList(filters, QDir::Files);
    foreach (QString file, fileList) {
        video.append(file);
    }
    int listSize = video.size();
    int randomIndex = QRandomGenerator::global()->bounded(listSize);
    QString vid = video[randomIndex];
    Qstr_cqvideo.append(vid);////
    ////
    QString name;
    try{
        json j;
        std::ifstream jfile(var_json);
        jfile >> j;
        int m1 = j.at("m1");
        //std::string cqalgo = j.at("CQALGO");
        std::ifstream file(student_json);
        json data;
        file >> data;
        if (data.empty()) {
            name = "空列表";
        } else {
            name = QString::fromStdString(data[0]);
            data.erase(data.begin());
        }

        std::ofstream outputFile(student_json);
        outputFile << data.dump(4);
        outputFile.close();
        if (data.size() <= m1) {
            re_studentl(appPath);
        }
    }
    catch(...){
        name = "空列表";
    }

    Qstr_cqvideo.append(name);
    //Qstr_cqvideo << mainUI;
    qDebug() << "Converted QString: " << Qstr_cqvideo;
    return Qstr_cqvideo;

}
