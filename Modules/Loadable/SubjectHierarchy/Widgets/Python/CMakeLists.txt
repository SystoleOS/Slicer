# Deploy abstract scripted plugin and init file that
# imports all deployed scripted plugins deployed by modules
set(SubjectHierarchyWidgets_PYTHON_SCRIPTS
  __init__
  AbstractScriptedSubjectHierarchyPlugin
  parameterNodeWrapper/__init__.py
  parameterNodeWrapper/guiConnectors.py
  )

set(SubjectHierarchyWidgets_PYTHON_RESOURCES
  )

ctkMacroCompilePythonScript(
  TARGET_NAME SubjectHierarchyWidgets
  SCRIPTS "${SubjectHierarchyWidgets_PYTHON_SCRIPTS}"
  RESOURCES "${SubjectHierarchyWidgets_PYTHON_RESOURCES}"
  DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/SubjectHierarchyPlugins"
  )

# Install python module / resources directory
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
  DESTINATION "${Python3_SITELIB}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
)
