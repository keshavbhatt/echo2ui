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
    qFatal("Application crashed!");
}

MainWindow::~MainWindow()
{
    delete ui;
}
