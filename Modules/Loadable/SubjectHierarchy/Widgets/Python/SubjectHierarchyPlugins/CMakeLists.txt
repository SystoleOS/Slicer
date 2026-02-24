
# Deploy abstract scripted plugin and init file that
# imports all deployed scripted plugins deployed by modules
set(SubjectHierarchyPlugins_PYTHON_SCRIPTS
  __init__
  AbstractScriptedSubjectHierarchyPlugin
  )

set(SubjectHierarchyPlugins_PYTHON_RESOURCES
  )

# Ensure the destination directory exists at configure time so that
# ctkMacroCompilePythonScript's get_filename_component(... REALPATH) call
# can resolve the path correctly (realpath() requires existing dirs on Linux).
file(MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/${Slicer_QTSCRIPTEDMODULES_LIB_DIR}/SubjectHierarchyPlugins")

ctkMacroCompilePythonScript(
  TARGET_NAME ${MODULE_NAME}SubjectHierarchyPlugins
  SCRIPTS "${SubjectHierarchyPlugins_PYTHON_SCRIPTS}"
  RESOURCES "${SubjectHierarchyPlugins_PYTHON_RESOURCES}"
  DESTINATION_DIR ${CMAKE_BINARY_DIR}/${Slicer_QTSCRIPTEDMODULES_LIB_DIR}/SubjectHierarchyPlugins
  INSTALL_DIR ${Slicer_INSTALL_QTSCRIPTEDMODULES_LIB_DIR}/SubjectHierarchyPlugins
  NO_INSTALL_SUBDIR
  )
