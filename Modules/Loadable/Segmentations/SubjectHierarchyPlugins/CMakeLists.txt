project(qSlicer${MODULE_NAME}SubjectHierarchyPlugins)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "Q_SLICER_${MODULE_NAME_UPPER}_PLUGINS_EXPORT")

set(${KIT}_INCLUDE_DIRECTORIES
  ${vtkSlicerSegmentationsModuleMRML_INCLUDE_DIRS}
  ${vtkSlicerSegmentationsModuleLogic_INCLUDE_DIRS}
  ${qSlicerSegmentationsModule_INCLUDE_DIRS}
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerSubjectHierarchyModuleWidgets
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerSubjectHierarchyModuleLogic
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerTerminologiesModuleWidgets
  ${qMRMLWidgets_INCLUDE_DIRS}
  ${MRML_INCLUDE_DIRS}
  ${vtkAddon_INCLUDE_DIRS}
  ${Slicer_Libs_INCLUDE_DIRS}
  ${Slicer_Base_INCLUDE_DIRS}
  )

set(${KIT}_SRCS
  qSlicerSubjectHierarchySegmentationsPlugin.cxx
  qSlicerSubjectHierarchySegmentationsPlugin.h
  qSlicerSubjectHierarchySegmentsPlugin.cxx
  qSlicerSubjectHierarchySegmentsPlugin.h
  )

set(${KIT}_MOC_SRCS
  qSlicerSubjectHierarchySegmentationsPlugin.h
  qSlicerSubjectHierarchySegmentsPlugin.h
  )

set(${KIT}_UI_SRCS
  )

set(${KIT}_RESOURCES
  Resources/${KIT}.qrc
  )

set(${KIT}_TARGET_LIBRARIES
  vtkSlicerSegmentationsModuleMRML
  vtkSlicerSegmentationsModuleLogic
  qSlicerSubjectHierarchyModuleWidgets
  vtkSlicerSubjectHierarchyModuleLogic
  qSlicerTerminologiesModuleWidgets
  qMRMLWidgets
  MRMLLogic
  MRMLCore
  vtkAddon
  Qt::Xml
  ${Slicer_Base_LIBRARIES}
  ${CTK_LIBRARIES}
  )

link_directories(${Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR})

#-----------------------------------------------------------------------------
SlicerMacroBuildModuleQtLibrary(
  NAME ${KIT}
  EXPORT_DIRECTIVE ${${KIT}_EXPORT_DIRECTIVE}
  FOLDER "Module-${MODULE_NAME}"
  INCLUDE_DIRECTORIES ${${KIT}_INCLUDE_DIRECTORIES}
  SRCS ${${KIT}_SRCS}
  MOC_SRCS ${${KIT}_MOC_SRCS}
  UI_SRCS ${${KIT}_UI_SRCS}
  TARGET_LIBRARIES ${${KIT}_TARGET_LIBRARIES}
  RESOURCES ${${KIT}_RESOURCES}
  WRAP_PYTHONQT
  )
