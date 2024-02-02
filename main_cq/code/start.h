#ifndef START_H
#define START_H
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QString>

class Start : public QObject
{
    Q_OBJECT
public:
    explicit Start(QObject *parent = nullptr);
    QStringList MainUI();
    QStringList Sr_Light();
    int MainDpi();

//signals:
//    void svar(const QString &startvar);
public slots:
    void start();
    //QString MainUI();

};

#endif // MYCLASS_H
