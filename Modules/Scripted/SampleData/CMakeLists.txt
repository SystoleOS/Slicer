cmake_minimum_required(VERSION 3.16.3...3.19.7 FATAL_ERROR)

#-----------------------------------------------------------------------------
project(SampleData)

#-----------------------------------------------------------------------------
set(MODULE_NAME SampleData)

#-----------------------------------------------------------------------------
find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------
set(MODULE_PYTHON_SCRIPTS
  ${MODULE_NAME}.py
  )

set(MODULE_PYTHON_RESOURCES
  Resources/Icons/BaselineVolume.png
  Resources/Icons/CTACardio.png
  Resources/Icons/CTCardioSeq.png
  Resources/Icons/CTPCardioSeq.png
  Resources/Icons/CTChest.png
  Resources/Icons/CTLiver.png
  Resources/Icons/DTIBrain.png
  Resources/Icons/DTIVolume.png
  Resources/Icons/dwi.png
  Resources/Icons/DZ-CBCT.png
  Resources/Icons/MRBrainTumor1.png
  Resources/Icons/MRBrainTumor2.png
  Resources/Icons/MRHead.png
  Resources/Icons/MRProstate.png
  Resources/Icons/Panoramix-cropped.png
  Resources/Icons/PreDentalSurgery.png
  Resources/Icons/CTBrain.png
  Resources/Icons/TinyPatient.png
  )

#-----------------------------------------------------------------------------
slicerMacroBuildScriptedModule(
  NAME ${MODULE_NAME}
  SCRIPTS ${MODULE_PYTHON_SCRIPTS}
  RESOURCES ${MODULE_PYTHON_RESOURCES}
  WITH_GENERIC_TESTS
  )

#-----------------------------------------------------------------------------
if(BUILD_TESTING)

  # Register the unittest subclass in the main script as a ctest.
  # Note that the test will also be available at runtime.
  slicer_add_python_unittest(SCRIPT ${MODULE_NAME}.py)

endif()
