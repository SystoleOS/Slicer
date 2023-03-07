
set(Slicer_PYTHON_SCRIPTS
  slicer/__init__.py
  slicer/logic.py
  slicer/parameterNodeWrapper/__init__.py
  slicer/parameterNodeWrapper/default.py
  slicer/parameterNodeWrapper/guiCreation.py
  slicer/parameterNodeWrapper/guiConnectors.py
  slicer/parameterNodeWrapper/parameterInfo.py
  slicer/parameterNodeWrapper/parameterPack.py
  slicer/parameterNodeWrapper/serializers.py
  slicer/parameterNodeWrapper/types.py
  slicer/parameterNodeWrapper/util.py
  slicer/parameterNodeWrapper/validators.py
  slicer/parameterNodeWrapper/wrapper.py
  slicer/ScriptedLoadableModule.py
  slicer/slicerqt.py
  slicer/testing.py
  slicer/util.py
  mrml.py
  vtkAddon.py
  vtkITK.py
  vtkSegmentationCore.py
  vtkTeem.py
  )

set(Slicer_PYTHON_MODULES_CONFIG "
# slicer libs
'mrml',
'vtkAddon',
'vtkSegmentationCore',
'qMRMLWidgetsPythonQt',
# slicer base libs
'logic',
'qSlicerBaseQTCorePythonQt',
'qSlicerBaseQTGUIPythonQt',
'qSlicerBaseQTAppPythonQt'"
  )

if(Slicer_BUILD_CLI_SUPPORT)
  list(APPEND Slicer_PYTHON_SCRIPTS
    slicer/cli
    )
  set(Slicer_PYTHON_MODULES_CONFIG "${Slicer_PYTHON_MODULES_CONFIG},
# CLI logic (Slicer_BUILD_CLI_SUPPORT:ON)
'qSlicerBaseQTCLIPython',
'qSlicerBaseQTCLIPythonQt',
"
  )
endif()

configure_file(
  slicer/kits.py.in
  ${CMAKE_CURRENT_BINARY_DIR}/slicer/kits.py
  @ONLY
  )

list(APPEND Slicer_PYTHON_SCRIPTS ${CMAKE_CURRENT_BINARY_DIR}/slicer/kits.py)

set(Slicer_PYTHON_RESOURCES
  )

if(Slicer_USE_SimpleITK)
  list(APPEND Slicer_PYTHON_SCRIPTS
    sitkUtils
    )
endif()

ctkMacroCompilePythonScript(
  TARGET_NAME SlicerBase
  SCRIPTS "${Slicer_PYTHON_SCRIPTS}"
  RESOURCES "${Slicer_PYTHON_RESOURCES}"
  DESTINATION_DIR ${Slicer_BINARY_DIR}/bin/Python
  )

# Install python module / resources directory
install(DIRECTORY "${Slicer_BINARY_DIR}/bin/Python/"
  DESTINATION "${Python3_SITELIB}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
)

# Install python module / resources directory
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
  DESTINATION "${Python3_SITELIB}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
)
