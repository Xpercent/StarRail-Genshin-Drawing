#ifndef VARO_H
#define VARO_H

#include <QObject>
#include <QString>
class Varo: public QObject
{
    Q_OBJECT
public:
    explicit Varo(QObject *parent = nullptr);

// signals:
//     void svar(const QString &varovar);


public slots:
    QString sound_var();
    int m1_var();
    void changem1_var(int);
    void changesound();
    void changeui(QString);
    void changedpi(int);
    int lighttimer();
    QStringList re_sr_light(QStringList,QStringList);
};

#endif // VARO_H
