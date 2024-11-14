#include "MyWindow.h"
#include <QPushButton>
#include <QVBoxLayout>

MyWindow::MyWindow(QWidget *parent) : QMainWindow(parent) {
    auto *button = new QPushButton("Click Me!", this);
    auto *layout = new QVBoxLayout;

    layout->addWidget(button);
    auto *centralWidget = new QWidget(this);
    centralWidget->setLayout(layout);

    setCentralWidget(centralWidget);
}

