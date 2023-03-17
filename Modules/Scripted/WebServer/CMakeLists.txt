#-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16.3...3.19.7 FATAL_ERROR)

#-----------------------------------------------------------------------------
project(WebServer)

#-----------------------------------------------------------------------------
set(MODULE_NAME "WebServer")

string(TOUPPER ${MODULE_NAME} MODULE_NAME_UPPER)

#-----------------------------------------------------------------------------
find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------
set(MODULE_PYTHON_SCRIPTS
  ${MODULE_NAME}.py
  ${MODULE_NAME}Lib/__init__
  ${MODULE_NAME}Lib/DICOMRequestHandler.py
  ${MODULE_NAME}Lib/SlicerRequestHandler.py
  ${MODULE_NAME}Lib/StaticPagesRequestHandler.py
  )

set(MODULE_PYTHON_RESOURCES
  Resources/Icons/WebServer.svg  # source: Google Material Icon set (api_black_24dp.svg)
  Resources/docroot/index.html
  Resources/docroot/browse.html
  Resources/docroot/favicon.ico
  Resources/docroot/package.json
  Resources/docroot/images/3DSlicer-DesktopIcon.png
  Resources/docroot/ServerTests/glMatrix-0.9.5.min.js
  Resources/docroot/ServerTests/index.html
  Resources/docroot/ServerTests/threeDCube.html
  Resources/docroot/ServerTests/timecube.html
  Resources/docroot/ServerTests/webgl-utils.js
  Resources/docroot/stylesheets/application.css
  )

#-----------------------------------------------------------------------------
slicerMacroBuildScriptedModule(
  NAME ${MODULE_NAME}
  SCRIPTS ${MODULE_PYTHON_SCRIPTS}
  RESOURCES ${MODULE_PYTHON_RESOURCES}
  WITH_GENERIC_TESTS
  )
