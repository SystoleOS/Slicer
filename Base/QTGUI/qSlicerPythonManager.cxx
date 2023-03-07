/*=auto=========================================================================

 Portions (c) Copyright 2005 Brigham and Women's Hospital (BWH)
 All Rights Reserved.

 See COPYRIGHT.txt
 or http://www.slicer.org/copyright/copyright.txt for details.

 Program:   3D Slicer

=========================================================================auto=*/

// Qt includes
#include <QDebug>
#include <QVariant>

// Slicer includes
#include "qSlicerApplication.h"
#include "qSlicerPythonManager.h"
#include "vtkSlicerConfigure.h"

//-----------------------------------------------------------------------------
qSlicerPythonManager::qSlicerPythonManager(QObject* _parent) : Superclass(_parent)
{
}

//-----------------------------------------------------------------------------
qSlicerPythonManager::~qSlicerPythonManager() = default;

//-----------------------------------------------------------------------------
void qSlicerPythonManager::preInitialization()
{
  Superclass::preInitialization();
}

//-----------------------------------------------------------------------------
void qSlicerPythonManager::executeInitializationScripts()
{
  qSlicerApplication* app = qSlicerApplication::application();
  if (!app)
    {
    return;
    }

  // Evaluate application script
  this->executeFile(QString(Slicer_PYTHON_BIN_DIR)+"/slicer/slicerqt.py");
}

//-----------------------------------------------------------------------------
void qSlicerPythonManager::eventBrokerScriptHandler(const char *script, void *clientData)
{
  Q_UNUSED(script);
  Q_UNUSED(clientData);
}
