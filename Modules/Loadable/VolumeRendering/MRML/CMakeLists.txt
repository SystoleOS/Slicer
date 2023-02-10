project(vtkSlicer${MODULE_NAME}ModuleMRML)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "VTK_SLICER_${MODULE_NAME_UPPER}_MODULE_MRML_EXPORT")

include(FindPkgConfig)
pkg_check_modules(jsoncpp REQUIRED jsoncpp)

set(${KIT}_INCLUDE_DIRECTORIES
  ${jsoncpp_INCLUDE_DIRS}
  ${vtkSlicerMarkupsModuleMRML_SOURCE_DIR}
  ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerMarkupsModuleMRML
  )

set(${KIT}_SRCS
  vtkMRMLCPURayCast${MODULE_NAME}DisplayNode.cxx
  vtkMRMLCPURayCast${MODULE_NAME}DisplayNode.h
  vtkMRMLGPURayCast${MODULE_NAME}DisplayNode.cxx
  vtkMRMLGPURayCast${MODULE_NAME}DisplayNode.h
  vtkMRMLMulti${MODULE_NAME}DisplayNode.cxx
  vtkMRMLMulti${MODULE_NAME}DisplayNode.h
  vtkMRMLShaderPropertyNode.cxx
  vtkMRMLShaderPropertyNode.h
  vtkMRMLShaderPropertyStorageNode.cxx
  vtkMRMLShaderPropertyStorageNode.h
  vtkMRMLVolumePropertyNode.cxx
  vtkMRMLVolumePropertyNode.h
  vtkMRMLVolumePropertyStorageNode.cxx
  vtkMRMLVolumePropertyStorageNode.h
  vtkMRML${MODULE_NAME}DisplayNode.cxx
  vtkMRML${MODULE_NAME}DisplayNode.h
  )

set(${KIT}_TARGET_LIBRARIES
  ${ITK_LIBRARIES}
  ${jsoncpp_LIBRARIES}
  ${mrml_LIBRARIES}
  vtkSlicerMarkupsModuleMRML
  )

set(DISABLE_WRAP_PYTHON DISABLE_WRAP_PYTHON)
if(Slicer_USE_PYTHONQT)
  set(DISABLE_WRAP_PYTHON)
  list(APPEND ${KIT}_TARGET_LIBRARIES
    ${Python3_LIBRARIES}
  )
endif()


link_directories(${Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR})

#-----------------------------------------------------------------------------
SlicerMacroBuildModuleMRML(
  NAME ${KIT}
  EXPORT_DIRECTIVE ${${KIT}_EXPORT_DIRECTIVE}
  INCLUDE_DIRECTORIES ${${KIT}_INCLUDE_DIRECTORIES}
  SRCS ${${KIT}_SRCS}
  TARGET_LIBRARIES ${${KIT}_TARGET_LIBRARIES}
  ${DISABLE_WRAP_PYTHON}
  )
