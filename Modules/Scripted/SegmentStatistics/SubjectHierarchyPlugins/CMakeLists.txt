set(${MODULE_NAME}SubjectHierarchyPlugins_PYTHON_SCRIPTS
  ${MODULE_NAME}SubjectHierarchyPlugin
  )

set(${MODULE_NAME}SubjectHierarchyPlugins_PYTHON_RESOURCES
  )

ctkMacroCompilePythonScript(
  TARGET_NAME ${MODULE_NAME}SubjectHierarchyPlugins
  SCRIPTS "${${MODULE_NAME}SubjectHierarchyPlugins_PYTHON_SCRIPTS}"
  RESOURCES "${${MODULE_NAME}SubjectHierarchyPlugins_PYTHON_RESOURCES}"
  DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/SubjectHierarchyPlugins"
  )

# Install python module / resources directory
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
  DESTINATION "${Python3_SITELIB}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
)
