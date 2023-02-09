project(vtkSlicer${MODULE_NAME}ModuleLogic)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "VTK_SLICER_${MODULE_NAME_UPPER}_LOGIC_EXPORT")

set(${KIT}_INCLUDE_DIRECTORIES
  ${vtkSlicerSegmentationsModuleMRML_INCLUDE_DIRS}
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerTerminologiesModuleLogic
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerMarkupsModuleMRML
  ${Slicer_Libs_INCLUDE_DIRS}
  )

set(${KIT}_SRCS
  vtkSlicer${MODULE_NAME}ModuleLogic.cxx
  vtkSlicer${MODULE_NAME}ModuleLogic.h
  vtkSlicerSegmentationGeometryLogic.cxx
  vtkSlicerSegmentationGeometryLogic.h
  vtkImageGrowCutSegment.cxx
  vtkImageGrowCutSegment.h
  FibHeap.cxx
  )

set(${KIT}_TARGET_LIBRARIES
  vtkSlicer${MODULE_NAME}ModuleMRML
  vtkSlicerTerminologiesModuleLogic
  vtkSlicerMarkupsModuleMRML
  vtkITK
  )

set(DISABLE_WRAP_PYTHON DISABLE_WRAP_PYTHON)
if (Slicer_USE_PYTHONQT)
  set(DISABLE_WRAP_PYTHON)
  list(APPEND ${KIT}_TARGET_LIBRARIES ${Python3_LIBRARIES})
endif()

#-----------------------------------------------------------------------------
SlicerMacroBuildModuleLogic(
  NAME ${KIT}
  EXPORT_DIRECTIVE ${${KIT}_EXPORT_DIRECTIVE}
  INCLUDE_DIRECTORIES ${${KIT}_INCLUDE_DIRECTORIES}
  SRCS ${${KIT}_SRCS}
  TARGET_LIBRARIES ${${KIT}_TARGET_LIBRARIES}
  ${DISABLE_WRAP_PYTHON}
  )
