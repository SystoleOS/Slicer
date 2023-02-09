project(qSlicer${MODULE_NAME}SubjectHierarchyPlugins)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "Q_SLICER_${MODULE_NAME_UPPER}_SUBJECT_HIERARCHY_PLUGINS_EXPORT")

set(${KIT}_INCLUDE_DIRECTORIES
  ${qSlicerSubjectHierarchyModuleWidgets_INCLUDE_DIRS}
  ${vtkSlicerSubjectHierarchyModuleLogic_INCLUDE_DIRS}
  ${qSlicerTerminologiesModuleWidgets_INCLUDE_DIRS}
  ${vtkSlicerTerminologiesModuleLogic_INCLUDE_DIRS}
  ${vtkSegmentationCore_INCLUDE_DIRS}
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerSubjectHierarchyModuleWidgets
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerTerminologiesModuleWidgets
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerTerminologiesModuleLogic
  ${qMRMLWidgets_INCLUDE_DIRS}
  ${MRML_INCLUDE_DIRS}
  ${vtkAddon_INCLUDE_DIRS}
  ${Slicer_Base_INCLUDE_DIRS}
  ${Slicer_Libs_INCLUDE_DIRS}
  )

set(${KIT}_SRCS
  qSlicerSubjectHierarchy${MODULE_NAME}Plugin.cxx
  qSlicerSubjectHierarchy${MODULE_NAME}Plugin.h
  )

set(${KIT}_MOC_SRCS
  qSlicerSubjectHierarchy${MODULE_NAME}Plugin.h
  )

set(${KIT}_UI_SRCS
  )

set(${KIT}_RESOURCES
  Resources/${KIT}.qrc
  )

link_directories(${Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR})

#-----------------------------------------------------------------------------
set(${KIT}_TARGET_LIBRARIES
  qSlicerSubjectHierarchyModuleWidgets
  vtkSlicerSubjectHierarchyModuleLogic
  qSlicerTerminologiesModuleWidgets
  qMRMLWidgets
  MRMLLogic
  MRMLCore
  Qt::Core
  Qt::Gui
  ${VTK_LIBRARIES}
  ${vtkAddon_LIBRARIES}
  ${Slicer_Base_LIBRARIES}
  ${Slicer_LIBRARIES}
  ${CTK_LIBRARIES}
  )

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
