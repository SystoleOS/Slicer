project(vtkSlicer${MODULE_NAME}ModuleMRML)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "VTK_SLICER_${MODULE_NAME_UPPER}_MODULE_MRML_EXPORT")

include_directories(BEFORE ${vtkTeem_INCLUDE_DIRS})

set(${KIT}_INCLUDE_DIRECTORIES
  ${Slicer_Base_INCLUDE_DIRS}
  )

set(${KIT}_SRCS
  vtkMRMLSequenceBrowserNode.cxx
  vtkMRMLSequenceBrowserNode.h
  )

set(${KIT}_TARGET_LIBRARIES
  ${ITK_LIBRARIES}
  ${MRML_LIBRARIES}
  ${Python3_LIBRARIES}
  SlicerBaseLogic
  )

set(DISABLE_WRAP_PYTHON)
if(NOT Slicer_USE_PYTHONQT)
  set(DISABLE_WRAP_PYTHON DISABLE_WRAP_PYTHON)
  list(APPEND ${KIT}_TARGET_LIBRARIES ${Pyhton3_LIBRARIES})
endif()

#-----------------------------------------------------------------------------
SlicerMacroBuildModuleMRML(
  NAME ${KIT}
  EXPORT_DIRECTIVE ${${KIT}_EXPORT_DIRECTIVE}
  INCLUDE_DIRECTORIES ${${KIT}_INCLUDE_DIRECTORIES}
  SRCS ${${KIT}_SRCS}
  TARGET_LIBRARIES ${${KIT}_TARGET_LIBRARIES}
  ${DISABLE_WRAP_PYTHON}
  )
