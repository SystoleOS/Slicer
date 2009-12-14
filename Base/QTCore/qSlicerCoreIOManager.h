/*=auto=========================================================================

 Portions (c) Copyright 2005 Brigham and Women's Hospital (BWH) 
 All Rights Reserved.

 See Doc/copyright/copyright.txt
 or http://www.slicer.org/copyright/copyright.txt for details.

 Program:   3D Slicer

=========================================================================auto=*/

#ifndef __qSlicerCoreIOManager_h
#define __qSlicerCoreIOManager_h

// qCTK includes
#include <qCTKPimpl.h>

#include "qSlicerBaseQTCoreWin32Header.h"

class vtkMRMLScene; 
class qSlicerCoreIOManagerPrivate;

class Q_SLICER_BASE_QTCORE_EXPORT qSlicerCoreIOManager
{

public:
  qSlicerCoreIOManager();
  virtual ~qSlicerCoreIOManager();

  virtual void printAdditionalInfo(); 
  
  // Description:
  // Set MRML scene
  void setMRMLScene(vtkMRMLScene* mrmlScene);

  // Description:
  // Load/Import scene
  void loadScene(const QString& filename);
  void importScene(const QString& filename);

  // Description:
  // Close scene
  void closeScene();
  
  // Description:
  // Get the file type using the extension
  QString fileTypeFromExtension(const QString& extension);

private:
  QCTK_DECLARE_PRIVATE(qSlicerCoreIOManager);
};

#endif

