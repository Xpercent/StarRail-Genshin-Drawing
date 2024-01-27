#ifndef CQUI_H
#define CQUI_H
#include <QObject>
#include <QStringList>
#include <QString>
class Cqui : public QObject
{
    Q_OBJECT

public:
    explicit Cqui(QObject *parent = nullptr);

signals:

public slots:
    QStringList cqui(QString);
    void re_studentl(QString);
    void ttoj();

};

#endif // CQUI_H


