#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <QGuiApplication>
#include <windows.h>
#include <start.h>
#include <random>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
using json = nlohmann::json;
using namespace std;

Start::Start(QObject *parent) : QObject(parent)
{
}

void Start::start()
{
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string folderPath = str_apppath + "/file"; // Replace with the actual folder path
    const std::string files[] = { "student.json", "student.txt", "studentl.json" };
    for (const auto& file : files) {
        std::ifstream infile(folderPath + "/" + file);
        if (!infile.good()) {
            std::ofstream outfile(folderPath + "/" + file);
            outfile.close();
            //std::cout << "File " << file << " created." << std::endl;
        }
    }
    std::ifstream infile(folderPath + "/student.txt");
    std::stringstream buffer;
    buffer << infile.rdbuf();
    if (buffer.str().empty()) {
        std::ofstream outfile(folderPath + "/student.txt");
        if (outfile.is_open()) {
            outfile << "张三" << std::endl << "李四" << std::endl << "王五" << std::endl << "YX";
                                     outfile.close();
        }
    }
}
int Start::MainDpi()
{
    QStringList MT_UI;
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    json j;
    std::ifstream jfile(var_json);
    jfile >> j;
    int maindpi = j.at("dpi");
    return maindpi;
    //qDebug() << "Converted QString: " << mainUI;
}

QStringList Start::MainUI()
{
    QStringList MT_UI;
    QString appPath = QCoreApplication::applicationDirPath();
    std::string str_apppath = appPath.toStdString();
    std::string var_json = str_apppath + "/file/var.json";
    json j;
    std::ifstream jfile(var_json);
    jfile >> j;
    std::string mainui = j.at("mainui");
    QString mainUI = QString::fromStdString(mainui);
    MT_UI << mainUI;
    if (mainui == "or")
    {
        std::vector<QString> myList = {"Gstopui","Srtopui"};
        auto seed = static_cast<unsigned>(std::chrono::system_clock::now().time_since_epoch().count());
        std::mt19937 mt(seed);
        std::uniform_int_distribution<int> dist(0, myList.size() - 1);
        int randomIndex = dist(mt);
        mainUI = myList[randomIndex];
    }
    MT_UI << mainUI;
    return MT_UI;
    //qDebug() << "Converted QString: " << mainUI;
}
QStringList Start::Sr_Light()
{
    QString appPath = QCoreApplication::applicationDirPath();
    QString directoryPath = appPath + "/UI/Srtopui/L";

    QStringList new_l;

    QDir directory(directoryPath);
    QStringList filters;
    filters << "*.png";
    QStringList fileList = directory.entryList(filters, QDir::Files);
    foreach (QString file, fileList) {
        new_l.append(file);
    }
    return new_l;

}





