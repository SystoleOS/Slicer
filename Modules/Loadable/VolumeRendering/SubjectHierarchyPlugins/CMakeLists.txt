project(qSlicer${MODULE_NAME}SubjectHierarchyPlugins)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "Q_SLICER_${MODULE_NAME_UPPER}_SUBJECT_HIERARCHY_PLUGINS_EXPORT")

set(${KIT}_INCLUDE_DIRECTORIES
  ${vtkSlicerVolumeRenderingModuleMRML_INCLUDE_DIRS}
  ${vtkSlicerVolumeRenderingModuleLogic_INCLUDE_DIRS}
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerSubjectHierarchyModuleWidgets
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerSubjectHierarchyModuleLogic
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/qSlicerVolumesSubjectHierarchyPlugins
  ${Slicer_Libs_INCLUDE_DIRS}
  ${MRML_INCLUDE_DIRS}
  ${vtkAddon_INCLUDE_DIRS}
  ${Slicer_Base_INCLUDE_DIRS}
  ${Slicer_INCLUDE_DIR}
  )

set(${KIT}_SRCS
  qSlicerSubjectHierarchyVolumeRenderingPlugin.cxx
  qSlicerSubjectHierarchyVolumeRenderingPlugin.h
  )

set(${KIT}_MOC_SRCS
  qSlicerSubjectHierarchyVolumeRenderingPlugin.h
  )

set(${KIT}_UI_SRCS
  )

set(${KIT}_RESOURCES
  )

set(${KIT}_TARGET_LIBRARIES
  vtkSlicer${MODULE_NAME}ModuleMRML
  vtkSlicer${MODULE_NAME}ModuleLogic
  qSlicerSubjectHierarchyModuleWidgets
  qSlicerVolumesSubjectHierarchyPlugins
  vtkSlicerSubjectHierarchyModuleLogic
  qMRMLWidgets
  MRMLLogic
  MRMLCore
  vtkAddon
  qSlicerBaseQTGUI
  Qt::Xml
  ${CTK_LIBRARIES}
  ${Slicer_Base_LIBRARIES}
  )

add_definitions(-DCTK_USE_QVTKOPENGLWIDGET -DCTK_HAS_QVTKOPENGLNATIVEWIDGET_H)
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
