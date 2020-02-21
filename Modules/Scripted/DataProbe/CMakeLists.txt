cmake_minimum_required(VERSION 3.0)

project(DataProbe)

find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------
set(MODULE_NAME DataProbe)

#-----------------------------------------------------------------------------
set(MODULE_PYTHON_SCRIPTS
  ${MODULE_NAME}.py
  ${MODULE_NAME}Lib/__init__.py
  ${MODULE_NAME}Lib/SliceViewAnnotations.py
  ${MODULE_NAME}Lib/DataProbeUtil.py
  )

set(MODULE_PYTHON_RESOURCES
  Resources/Icons/SlicerAdvancedGear-Small.png
  ${MODULE_NAME}Lib/Resources/UI/settings.ui
  )

#-----------------------------------------------------------------------------
slicerMacroBuildScriptedModule(
  NAME ${MODULE_NAME}
  SCRIPTS ${MODULE_PYTHON_SCRIPTS}
  RESOURCES ${MODULE_PYTHON_RESOURCES}
  WITH_GENERIC_TESTS
  )

#-----------------------------------------------------------------------------
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
  DESTINATION "${Slicer_INSTALL_QTSCRIPTEDMODULES_LIB_DIR}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
  PATTERN "*.png"
  PATTERN "*.ui"
  PATTERN "CMakeFiles" EXCLUDE
  PATTERN "ITKFactoryRegistration" EXCLUDE
  PATTERN "compile_*_python_scripts.py" EXCLUDE
)
