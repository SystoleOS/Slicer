cmake_minimum_required(VERSION 3.16.3...3.19.7 FATAL_ERROR)

#-----------------------------------------------------------------------------
project(ACPCTransform)

#-----------------------------------------------------------------------------
set(MODULE_NAME ACPCTransform)

find_package(Slicer REQUIRED)
include(${Slicer_USE_FILE})

#-----------------------------------------------------------------------------

#
# SlicerExecutionModel
#
find_package(SlicerExecutionModel REQUIRED)
include(${SlicerExecutionModel_USE_FILE})

link_directories(${Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR})

#-----------------------------------------------------------------------------
SEMMacroBuildCLI(
  NAME ${MODULE_NAME}
  LOGO_HEADER ${Slicer_SOURCE_DIR}/Resources/NAMICLogo.h
  ADDITIONAL_SRCS
    vtkPrincipalAxesAlign.cxx
  TARGET_LIBRARIES
    ModuleDescriptionParser
    ${ITK_LIBRARIES}
    vtkTeem
    MRMLCore
    SlicerBaseCLI
    ${VTK_LIBRARIES}
    vtkSlicerMarkupsModuleMRML
  INCLUDE_DIRECTORIES
    ${Slicer_Base_INCLUDE_DIRS}
    ${vtkTeem_INCLUDE_DIRS}
    ${MRML_INCLUDE_DIRS}
    ${vtkITK_INCLUDE_DIRS}
    ${SlicerBaseCLI_SOURCE_DIR}
    ${SlicerBaseCLI_BINARY_DIR}
    ${Slicer_INSTALL_QTLOADABLEMODULES_INCLUDE_DIR}/vtkSlicerMarkupsModuleMRML
    ${vtkAddon_INCLUDE_DIRS}
  INSTALL_RUNTIME_DESTINATION ${Slicer_INSTALL_CLIMODULES_BIN_DIR}
  INSTALL_LIBRARY_DESTINATION ${Slicer_INSTALL_CLIMODULES_LIB_DIR}
  INSTALL_ARCHIVE_DESTINATION ${Slicer_INSTALL_CLIMODULES_LIB_DIR}
  )

set_target_properties(${MODULE_NAME}Lib PROPERTIES
  INSTALL_RPATH
  "${Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR}")

#-----------------------------------------------------------------------------
if(BUILD_TESTING)
  add_subdirectory(Testing)
endif()
