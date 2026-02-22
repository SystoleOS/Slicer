
if(BUILD_TESTING)
  # Code specific to Slicer testing is added here.

endif()

#
# Test templates - Common to both Slicer and the extensions
#

set(Slicer_PYTHON_MODULE_TEST_TEMPLATES_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  CACHE INTERNAL "Path to python test templates directory.")

# Install the file so that project building against the 'installed tree' can reference it.
# Note: use CMAKE_CURRENT_SOURCE_DIR — the template is a source file and is never
# copied to CMAKE_CURRENT_BINARY_DIR when BUILD_TESTING is OFF.
if(NOT Slicer_INSTALL_NO_DEVELOPMENT)
  install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/qSlicerModuleGenericTest.py.in
    DESTINATION ${Slicer_INSTALL_SHARE_DIR}/test-templates COMPONENT Development
    )
endif()
