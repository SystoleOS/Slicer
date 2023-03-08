project(qSlicer${MODULE_NAME}SubjectHierarchyPlugins)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "Q_SLICER_${MODULE_NAME_UPPER}_SUBJECT_HIERARCHY_PLUGINS_EXPORT")

set(${KIT}_INCLUDE_DIRECTORIES
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerSubjectHierarchyModuleLogic
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerSubjectHierarchyModuleWidgets
  ${qSlicerDICOMLibModuleWidgets_INCLUDE_DIRS}
  ${MRML_INCLUDE_DIRS}
  ${Slicer_Libs_INCLUDE_DIRS}
  ${vtkAddon_INCLUDE_DIRS}
  )

set(${KIT}_SRCS
  qSlicerSubjectHierarchyDICOMPlugin.cxx
  qSlicerSubjectHierarchyDICOMPlugin.h
  )

set(${KIT}_MOC_SRCS
  qSlicerSubjectHierarchyDICOMPlugin.h
  )

set(${KIT}_UI_SRCS
  )

set(${KIT}_RESOURCES
  )


#-----------------------------------------------------------------------------
set(${KIT}_TARGET_LIBRARIES
  vtkSlicerSubjectHierarchyModuleLogic
  qSlicerSubjectHierarchyModuleWidgets
  qSlicerDICOMLibModuleWidgets
  MRMLCore
  MRMLLogic
  qMRMLWidgets
  ${QT_LIBRARIES}
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
