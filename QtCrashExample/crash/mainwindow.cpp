#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QRandomGenerator>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    qInfo()<<"Launched"<<QRandomGenerator::global()->generate();
    QList<int>intList;
    intList << 3 << 4 << 5;
    //creates an "index out of range assert fail" to crashes application
    qDebug()<<intList.at(4);
}

MainWindow::~MainWindow()
{
    delete ui;
}
