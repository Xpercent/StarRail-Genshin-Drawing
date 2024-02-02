#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <cqui.h>
#include <ver.h>
#include <start.h>
#include <varo.h>
#include <QIcon>
#include <QSurfaceFormat>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

#endif
    QGuiApplication app(argc, argv);
    /////

    ///---
    qmlRegisterType<Start>("start", 1, 0, "Start");
    qmlRegisterType<Cqui>("cqui", 1, 0, "Cqui");
    qmlRegisterType<Ver>("verof", 1, 0, "Ver");
    qmlRegisterType<Varo>("varof", 1, 0, "Varo");
    ///---
    ///
    // QSurfaceFormat format;
    // format.setSamples(4);  // 设置抗锯齿级别
    // QSurfaceFormat::setDefaultFormat(format);
    ///
    QQmlApplicationEngine engine;
    //------------------------

    QString appPath = QCoreApplication::applicationDirPath();//当前目录
    app.setWindowIcon(QIcon(appPath + "\\UI\\icon.png"));
    engine.rootContext()->setContextProperty("appPath",appPath);//当前目录

    Start start;

    QStringList MT_UI = start.MainUI();
    int mainDpi = start.MainDpi();
    QStringList SR_LIGHT = start.Sr_Light();
    engine.rootContext()->setContextProperty("mainUI",MT_UI[1]);
    engine.rootContext()->setContextProperty("trueUI",MT_UI[0]);
    engine.rootContext()->setContextProperty("mainDpi",mainDpi);
    engine.rootContext()->setContextProperty("sr_Light",SR_LIGHT);
   // qDebug() << SR_LIGHT;
    //------------------------
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}
