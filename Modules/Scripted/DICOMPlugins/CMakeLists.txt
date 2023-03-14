cmake_minimum_required(VERSION 3.16.3...3.19.7 FATAL_ERROR)

#-----------------------------------------------------------------------------
project(DICOMPlugins)

#-----------------------------------------------------------------------------
find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------
set(MODULE_NAME DICOMPlugins)

#-----------------------------------------------------------------------------
set(MODULE_PYTHON_SCRIPTS
  DICOMEnhancedUSVolumePlugin.py
  DICOMGeAbusPlugin.py
  DICOMImageSequencePlugin.py
  DICOMScalarVolumePlugin.py
  DICOMVolumeSequencePlugin.py
  DICOMSlicerDataBundlePlugin.py
  )

set(MODULE_PYTHON_RESOURCES
  )

#-----------------------------------------------------------------------------
slicerMacroBuildScriptedModule(
  NAME ${MODULE_NAME}
  SCRIPTS ${MODULE_PYTHON_SCRIPTS}
  RESOURCES ${MODULE_PYTHON_RESOURCES}
  )
