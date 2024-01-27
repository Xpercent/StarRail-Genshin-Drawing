#include "varo.h"
#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <QDebug>
#include <QString>
#include <QGuiApplication>
#include <QRandomGenerator>
using json = nlohmann::json;

Varo::Varo(QObject *parent) : QObject(parent)
{
}

void Varo::changesound()
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    std::string sound = jsonData.at("sound");

    if(sound == "on"){
        jsonData["sound"] = "off";
    }
    else{
        jsonData["sound"] = "on";
    }

    std::ofstream outFile(var_json);
    outFile << std::setw(4) << jsonData << std::endl;
    outFile.close();
}

void Varo::changeui(QString nowui)
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    std::string myui = nowui.toStdString();
    jsonData["mainui"] = myui;
    std::ofstream outFile(var_json);
    outFile << std::setw(4) << jsonData << std::endl;
    outFile.close();
}

QString Varo::sound_var()
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    QString sound = QString::fromStdString(jsonData.at("sound"));
    return sound;
}

int Varo::m1_var()
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    int m1 = jsonData.at("m1");
    return m1;
}

void Varo::changem1_var(int m1)
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    jsonData.at("m1") = m1;
    std::ofstream outFile(var_json);
    outFile << std::setw(4) << jsonData << std::endl;
    outFile.close();

}

void Varo::changedpi(int nowdpi)
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    jsonData["dpi"] = nowdpi;
    std::ofstream outFile(var_json);
    outFile << std::setw(4) << jsonData << std::endl;
    outFile.close();
}

int Varo::lighttimer()
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    std::ifstream file(var_json);
    json jsonData;
    file >> jsonData;
    file.close();
    int ltime = jsonData["lightime"];
    return ltime;
}

QStringList Varo::re_sr_light(QStringList new_l,QStringList old_l)
{
    //删除n和o相同部分
    int num = 5 - old_l.length();
    qDebug() << num;
    if (num != 5)
    {
        old_l.removeOne(old_l[0]);
        num++;
    }

    foreach (const QString &element, old_l) {
        new_l.removeOne(element);
    }
    for(num > 0; num--;)
    {
        int listSize = new_l.size();
        int randomIndex = QRandomGenerator::global()->bounded(listSize);
        // 使用随机索引访问QStringList的元素
        QString a = new_l[randomIndex];
        new_l.removeOne(a);
        old_l.append(a);
    }
    return old_l;
}
