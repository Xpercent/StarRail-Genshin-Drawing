#ifndef VER_H
#define VER_H

#include <QObject>
#include <QString>
class Ver: public QObject
{
    Q_OBJECT
public:
    explicit Ver(QObject *parent = nullptr);
signals:
    //void QStrVideoL(const QStringList &stringList);
    void myver(const QString &v);
public slots:
    void ver();
};

#endif // VER_H
