#ifndef VER_H
#define VER_H
//#include <nlohmann/json.hpp>
#include <QObject>
#include <QString>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QMap>


class Ver: public QObject
{
    Q_OBJECT
public:
    explicit Ver(QObject *parent = nullptr);
signals:
    //void QStrVideoL(const QStringList &stringList);
    void myver(const QMap<QString,QVariant> &v);
public slots:
    void ver();

};

#endif // VER_H
