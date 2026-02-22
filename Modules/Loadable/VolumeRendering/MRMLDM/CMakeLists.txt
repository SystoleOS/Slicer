project(vtkSlicer${MODULE_NAME}ModuleMRMLDisplayableManager)

set(KIT ${PROJECT_NAME})

set(${KIT}_EXPORT_DIRECTIVE "VTK_SLICER_${MODULE_NAME_UPPER}_MODULE_MRMLDISPLAYABLEMANAGER_EXPORT")

set(${KIT}_INCLUDE_DIRECTORIES
  ${vtkSlicer${MODULE_NAME}ModuleLogic_INCLUDE_DIRS}
  ${vtkSlicer${MODULE_NAME}ModuleMRML_INCLUDE_DIRS}
  )

set(displayable_manager_SRCS
  vtkMRMLVolumeRenderingDisplayableManager.cxx
  )

SlicerConfigureDisplayableManagerObjectFactory(
  TARGET_NAME ${KIT}
  SRCS "${displayable_manager_SRCS}"
  EXPORT_MACRO "${${KIT}_EXPORT_DIRECTIVE}"
  EXPORT_HEADER "${KIT}Export.h"
  OUTPUT_SRCS_VAR displayable_manager_instantiator_SRCS
  )

set(${KIT}_SRCS
  ${displayable_manager_instantiator_SRCS}
  ${displayable_manager_SRCS}
  )

set(${KIT}_VTK_LIBRARIES
  VTK::RenderingVolume
  )
# VTK 9.x uses OpenGL2 backend exclusively; prefer the explicit target over the
# VTK_RENDERING_BACKEND variable which may not be set in standalone builds.
if(TARGET VTK::RenderingVolumeOpenGL2)
  list(APPEND ${KIT}_VTK_LIBRARIES VTK::RenderingVolumeOpenGL2)
elseif(DEFINED VTK_RENDERING_BACKEND AND VTK_RENDERING_BACKEND)
  list(APPEND ${KIT}_VTK_LIBRARIES VTK::RenderingVolume${VTK_RENDERING_BACKEND})
endif()

set(${KIT}_TARGET_LIBRARIES
  vtkSlicer${MODULE_NAME}ModuleLogic
  vtkSlicer${MODULE_NAME}ModuleMRML
  ${MRML_LIBRARIES}
  ${ITK_LIBRARIES}
  ${${KIT}_VTK_LIBRARIES}
  )

#-----------------------------------------------------------------------------
SlicerMacroBuildModuleLogic(
  NAME ${KIT}
  EXPORT_DIRECTIVE ${${KIT}_EXPORT_DIRECTIVE}
  INCLUDE_DIRECTORIES ${${KIT}_INCLUDE_DIRECTORIES}
  SRCS ${${KIT}_SRCS}
  TARGET_LIBRARIES ${${KIT}_TARGET_LIBRARIES}
  )
