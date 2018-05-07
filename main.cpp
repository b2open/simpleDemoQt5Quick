#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

#if QT_VERSION >= 0x050700
    qDebug() << "Check Version Qt5: Framework Qt5 supportado";
#else
    qDebug() << "Check Version Qt5: Framework Qt5 não supportado";
    exit(3);
#endif

    qDebug() << "Name: " << QCoreApplication::applicationName();
    qDebug() << "PID:  " << QCoreApplication::applicationPid();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
