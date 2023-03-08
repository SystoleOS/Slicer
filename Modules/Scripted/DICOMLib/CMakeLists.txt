cmake_minimum_required(VERSION 3.0)

project(DICOMLib)

find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------
set(MODULE_NAME DICOMLib)
string(TOUPPER ${MODULE_NAME} MODULE_NAME_UPPER)

#-----------------------------------------------------------------------------
add_subdirectory(Logic)
add_subdirectory(Widgets)
add_subdirectory(SubjectHierarchyPlugins)

#-----------------------------------------------------------------------------
set(MODULE_PYTHON_SCRIPTS
  __init__.py
  DICOMBrowser.py
  DICOMExportScalarVolume.py
  DICOMExportScene.py
  DICOMPlugin.py
  DICOMPluginSelector.py
  DICOMProcesses.py
  DICOMRecentActivityWidget.py
  DICOMSendDialog.py
  DICOMUtils.py
  )

set(MODULE_PYTHON_RESOURCES
  Resources/DICOM/dcmtk/storescu-seg.cfg
  )

#-----------------------------------------------------------------------------
slicerMacroBuildScriptedModule(
  NAME ${MODULE_NAME}
  SCRIPTS ${MODULE_PYTHON_SCRIPTS}
  RESOURCES ${MODULE_PYTHON_RESOURCES}
  WITH_SUBDIR
  )

#-----------------------------------------------------------------------------
if(BUILD_TESTING)
#  add_subdirectory(Testing)
endif()
