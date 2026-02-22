cmake_minimum_required(VERSION 3.16.3...3.19.7 FATAL_ERROR)

#-----------------------------------------------------------------------------
project(Transforms)

#-----------------------------------------------------------------------------
set(CMAKE_CXX_STANDARD "17")

#-----------------------------------------------------------------------------
find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

# UseSlicer.cmake resets Slicer_INSTALL_QTLOADABLEMODULES_SHARE_DIR to empty
# when Slicer_QTLOADABLEMODULES_SHARE_DIR is unset (standalone build). Restore.
if(NOT Slicer_INSTALL_QTLOADABLEMODULES_SHARE_DIR)
  set(Slicer_INSTALL_QTLOADABLEMODULES_SHARE_DIR
    "./share/Slicer-${Slicer_VERSION}/qt-loadable-modules")
endif()
# UseSlicer.cmake also resets Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR to empty
# when Slicer_QTLOADABLEMODULES_LIB_DIR is unset (standalone build). Restore.
if(NOT Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR)
  set(Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR
    "./lib/Slicer-${Slicer_VERSION}/qt-loadable-modules")
endif()

#-----------------------------------------------------------------------------
set(MODULE_NAME Transforms)

string(TOUPPER ${MODULE_NAME} MODULE_NAME_UPPER)

#-----------------------------------------------------------------------------
add_subdirectory(Logic)
add_subdirectory(MRMLDM)
add_subdirectory(Widgets)
add_subdirectory(SubjectHierarchyPlugins)

#-----------------------------------------------------------------------------
set(MODULE_EXPORT_DIRECTIVE "Q_SLICER_QTMODULES_${MODULE_NAME_UPPER}_EXPORT")

# Additional includes - Current_{source,binary} and Slicer_{Libs,Base} already included
set(MODULE_INCLUDE_DIRECTORIES
  ${CMAKE_CURRENT_SOURCE_DIR}/Logic
  ${CMAKE_CURRENT_BINARY_DIR}/Logic
  ${CMAKE_CURRENT_SOURCE_DIR}/SubjectHierarchyPlugins
  ${CMAKE_CURRENT_BINARY_DIR}/SubjectHierarchyPlugins
  ${qSlicerSubjectHierarchyModuleWidgets_INCLUDE_DIRS}
  ${CMAKE_CURRENT_SOURCE_DIR}/Widgets
  ${CMAKE_CURRENT_BINARY_DIR}/Widgets
  )

set(MODULE_SRCS
  qSlicer${MODULE_NAME}Module.cxx
  qSlicer${MODULE_NAME}Module.h
  qSlicer${MODULE_NAME}ModuleWidget.cxx
  qSlicer${MODULE_NAME}ModuleWidget.h
  qSlicer${MODULE_NAME}Reader.cxx
  qSlicer${MODULE_NAME}Reader.h
  )

set(MODULE_MOC_SRCS
  qSlicer${MODULE_NAME}Module.h
  qSlicer${MODULE_NAME}ModuleWidget.h
  qSlicer${MODULE_NAME}Reader.h
  )

set(MODULE_UI_SRCS
  Resources/UI/qSlicer${MODULE_NAME}ModuleWidget.ui
  )

set(MODULE_TARGET_LIBRARIES
  vtkSlicer${MODULE_NAME}ModuleMRMLDisplayableManager
  vtkSlicer${MODULE_NAME}ModuleLogic
  qSlicer${MODULE_NAME}ModuleWidgets
  qSlicer${MODULE_NAME}SubjectHierarchyPlugins
  )

set(MODULE_RESOURCES
  Resources/qSlicer${MODULE_NAME}Module.qrc
  )

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
  LINK_DIRECTORIES ${EXTRA_MODULE_LIB_DIRS}
  )

#-----------------------------------------------------------------------------
if(BUILD_TESTING)
  add_subdirectory(Testing)
endif()
