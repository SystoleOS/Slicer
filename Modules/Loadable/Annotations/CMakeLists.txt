#-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16.3...3.19.7 FATAL_ERROR)

#-----------------------------------------------------------------------------
project(Annotations)

#-----------------------------------------------------------------------------
set(MODULE_NAME "Annotations")

string(TOUPPER ${MODULE_NAME} MODULE_NAME_UPPER)

#-----------------------------------------------------------------------------
find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------
add_subdirectory(MRML)
add_subdirectory(Logic)

#-----------------------------------------------------------------------------
set(MODULE_EXPORT_DIRECTIVE "Q_SLICER_QTMODULES_${MODULE_NAME_UPPER}_EXPORT")

# Additional includes - Current_{source,binary} and Slicer_{Libs,Base} already included
set(MODULE_INCLUDE_DIRECTORIES
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_BINARY_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/Logic
  ${CMAKE_CURRENT_BINARY_DIR}/Logic
  ${CMAKE_CURRENT_SOURCE_DIR}/MRML
  ${CMAKE_CURRENT_BINARY_DIR}/MRML
  )

set(GUI_SRCS
  GUI/qSlicerAnnotationModuleSnapShotDialog.cxx
  GUI/qSlicerAnnotationModuleSnapShotDialog.h
  )

set(MODULE_SRCS
  ${GUI_SRCS}
  qSlicerAnnotationsModule.cxx
  qSlicerAnnotationsModule.h
  )

set(MODULE_MOC_SRCS
  qSlicerAnnotationsModule.h
  GUI/qSlicerAnnotationModuleSnapShotDialog.h
  )

set(MODULE_UI_SRCS
  )

set(MODULE_RESOURCES
  Resources/qSlicerAnnotationModule.qrc
  )

set(MODULE_TARGET_LIBRARIES
  ${CTK_LIBRARIES}
  qSlicerBaseQTCore
  qMRMLWidgets
  vtkSlicer${MODULE_NAME}ModuleMRML
  vtkSlicer${MODULE_NAME}ModuleLogic
  Qt::Xml
  )

if (Slicer_USE_PYTHONQT)
  add_compile_definitions(Annotations_USE_PYTHONQT)
  list(APPEND MODULE_INCLUDE_DIRECTORIES ${PYTHONQT_INCLUDE_DIR})
endif()

#-----------------------------------------------------------------------------
slicerMacroBuildLoadableModule(
  NAME ${MODULE_NAME}
  EXPORT_DIRECTIVE ${MODULE_EXPORT_DIRECTIVE}
  INCLUDE_DIRECTORIES ${MODULE_INCLUDE_DIRECTORIES}
  SRCS ${MODULE_SRCS}
  MOC_SRCS ${MODULE_MOC_SRCS}
  UI_SRCS ${MODULE_UI_SRCS}
  TARGET_LIBRARIES ${MODULE_TARGET_LIBRARIES}
  RESOURCES ${MODULE_RESOURCES}
  WITH_GENERIC_TESTS
  )
