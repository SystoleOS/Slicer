project(qSlicerBaseQTApp)

#
# See CMake/SlicerMacroBuildBaseQtLibrary.cmake for details
#

set(KIT_export_directive "Q_SLICER_BASE_QTAPP_EXPORT")

# Additional directories to include
set(KIT_include_directories
  ${qSlicerBaseQTCore_SOURCE_DIR}
  ${qSlicerBaseQTCore_BINARY_DIR}
  ${qSlicerBaseQTGUI_SOURCE_DIR}
  ${qSlicerBaseQTGUI_BINARY_DIR}
  ${qSlicerModulesCore_SOURCE_DIR}
  ${qSlicerModulesCore_BINARY_DIR}
  )

# Source files
set(KIT_SRCS
  qSlicerAboutDialog.cxx
  qSlicerAboutDialog.h
  qSlicerApplicationHelper.cxx
  qSlicerApplicationHelper.h
  qSlicerErrorReportDialog.cxx
  qSlicerErrorReportDialog.h
  qSlicerMainWindow.cxx
  qSlicerMainWindow.h
  )

# Headers that should run through moc
set(KIT_MOC_SRCS
  qSlicerAboutDialog.h
  qSlicerApplicationHelper.h
  qSlicerErrorReportDialog.h
  qSlicerMainWindow.h
  )

# UI files
set(KIT_UI_SRCS
  Resources/UI/qSlicerAboutDialog.ui
  Resources/UI/qSlicerErrorReportDialog.ui
  Resources/UI/qSlicerMainWindow.ui
  )

# Additional Target libraries (Qt libs already included)
set(KIT_target_libraries
  # ${QT_LIBRARIES} # Not needed: All dependencies are transitively satisfied by other targets
  qSlicerModulesCore
  )

if(Slicer_BUILD_CLI_SUPPORT)
  list(APPEND KIT_target_libraries
    qSlicerBaseQTCLI
    )
endif()

# Resources
set(KIT_resources
  )

if(Slicer_USE_PYTHONQT)
  set(WRAP_PYTHONQT WRAP_PYTHONQT)
endif()

SlicerMacroBuildBaseQtLibrary(
  NAME ${PROJECT_NAME}
  EXPORT_DIRECTIVE ${KIT_export_directive}
  INCLUDE_DIRECTORIES ${KIT_include_directories}
  SRCS ${KIT_SRCS}
  MOC_SRCS ${KIT_MOC_SRCS}
  UI_SRCS ${KIT_UI_SRCS}
  TARGET_LIBRARIES ${KIT_target_libraries}
  RESOURCES ${KIT_resources}
  ${WRAP_PYTHONQT}
  )

# --------------------------------------------------------------------------
# Install ui_headers
# --------------------------------------------------------------------------
# ui_header files are generated in build time and are not listed by
# the globbing mechanims in the Slicer build macros. Here we list them and make
# the installation explicit
if(NOT DEFINED ${PROJECT_NAME}_INSTALL_NO_DEVELOPMENT)
  set(${PROJECT_NAME}_INSTALL_NO_DEVELOPMENT ON)
endif()
if(NOT ${PROJECT_NAME}_INSTALL_NO_DEVELOPMENT)
  set(ui_headers
    "${CMAKE_CURRENT_BINARY_DIR}/ui_qSlicerMainWindow.h"
    "${CMAKE_CURRENT_BINARY_DIR}/ui_qSlicerErrorReportDialog.h"
    "${CMAKE_CURRENT_BINARY_DIR}/ui_qSlicerAboutDialog.h")
  install(
    FILES ${ui_headers}
    DESTINATION ${Slicer_INSTALL_INCLUDE_DIR}/${PROJECT_NAME} COMPONENT Development)
endif()

# --------------------------------------------------------------------------
if(BUILD_TESTING)
  add_subdirectory(Testing)
endif()

