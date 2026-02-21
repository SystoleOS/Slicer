################################################################################
#
#  Program: 3D Slicer
#
#  Copyright (c) Kitware Inc.
#
#  See COPYRIGHT.txt
#  or http://www.slicer.org/copyright/copyright.txt for details.
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#  This file was originally developed by Jean-Christophe Fillion-Robin, Kitware Inc.
#  and was partially funded by NIH grant 3P41RR013218-12S1
#
################################################################################

#
# SlicerMacroBuildModuleWidgets
#

macro(SlicerMacroBuildModuleWidgets)
  set(options
    WRAP_PYTHONQT
    NO_INSTALL
    )
  set(oneValueArgs
    NAME
    EXPORT_DIRECTIVE
    FOLDER
    )
  set(multiValueArgs
    SRCS
    MOC_SRCS
    UI_SRCS
    INCLUDE_DIRECTORIES
    LINK_DIRECTORIES
    TARGET_LIBRARIES
    RESOURCES
    )
  cmake_parse_arguments(MODULEWIDGETS
    "${options}"
    "${oneValueArgs}"
    "${multiValueArgs}"
    ${ARGN}
    )

  if(MODULEWIDGETS_UNPARSED_ARGUMENTS)
    message(FATAL_ERROR "Unknown keywords given to SlicerMacroBuildModuleWidgets(): \"${MODULEWIDGETS_UNPARSED_ARGUMENTS}\"")
  endif()

  list(APPEND MODULEWIDGETS_INCLUDE_DIRECTORIES
    ${Slicer_Libs_INCLUDE_DIRS}
    ${Slicer_Base_INCLUDE_DIRS}
    ${Slicer_ModuleLogic_INCLUDE_DIRS}
    ${Slicer_ModuleMRML_INCLUDE_DIRS}
    ${Slicer_ModuleWidgets_INCLUDE_DIRS}
    )

  # In the superbuild Slicer_GUI_LIBRARY is set (e.g. qSlicerBaseQTApp) and
  # carries CTK transitively. In a system install it is empty; fall back to
  # the actual provider of qSlicerWidget and add CTKVisualizationVTKCore
  # explicitly since the transitive chain is broken.
  # qSlicerBaseQTCore must also be listed explicitly: --as-needed prevents
  # resolving qSlicerObject symbols transitively through qSlicerBaseQTGUI.
  if(Slicer_GUI_LIBRARY)
    list(APPEND MODULEWIDGETS_TARGET_LIBRARIES
      ${Slicer_GUI_LIBRARY}
      )
  else()
    list(APPEND MODULEWIDGETS_TARGET_LIBRARIES
      qSlicerBaseQTCore
      qSlicerBaseQTGUI
      CTKVisualizationVTKCore
      )
  endif()

  if(NOT Slicer_SUPERBUILD)
    list(APPEND MODULEWIDGETS_LINK_DIRECTORIES
      ${Slicer_Libs_LIBRARY_DIRS}
      ${Slicer_Base_LIBRARY_DIRS}
      ${CTK_LIBRARY_DIRS}
      )
    if(DEFINED Slicer_HOME AND DEFINED Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR)
      list(APPEND MODULEWIDGETS_LINK_DIRECTORIES
        "${Slicer_HOME}/${Slicer_INSTALL_QTLOADABLEMODULES_LIB_DIR}"
        )
    endif()
    # Allow callers to inject extra library search paths for inter-module deps
    # (e.g. when one standalone module depends on another module's libraries).
    if(DEFINED EXTRA_MODULE_LIB_DIRS)
      list(APPEND MODULEWIDGETS_LINK_DIRECTORIES ${EXTRA_MODULE_LIB_DIRS})
    endif()
  endif()

  if(NOT DEFINED MODULEWIDGETS_FOLDER AND DEFINED MODULE_NAME)
    set(MODULEWIDGETS_FOLDER "Module-${MODULE_NAME}")
  endif()
  if(NOT "${MODULEWIDGETS_FOLDER}" STREQUAL "")
    set_target_properties(${lib_name} PROPERTIES FOLDER ${MODULEWIDGETS_FOLDER})
  endif()

  set(MODULEWIDGETS_WRAP_PYTHONQT_OPTION)
  if(MODULEWIDGETS_WRAP_PYTHONQT)
    set(MODULEWIDGETS_WRAP_PYTHONQT_OPTION "WRAP_PYTHONQT")
  endif()
  set(MODULEWIDGETS_NO_INSTALL_OPTION)
  if(MODULEWIDGETS_NO_INSTALL)
    set(MODULEWIDGETS_NO_INSTALL_OPTION "NO_INSTALL")
  endif()

  #-----------------------------------------------------------------------------
  # Translation
  #-----------------------------------------------------------------------------
  if(Slicer_BUILD_I18N_SUPPORT)
    set(TS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Resources/Translations/")

    include(SlicerMacroTranslation)
    SlicerMacroTranslation(
      SRCS ${MODULEWIDGETS_SRCS}
      UI_SRCS ${MODULEWIDGETS_UI_SRCS}
      TS_DIR ${TS_DIR}
      TS_BASEFILENAME ${MODULEWIDGETS_NAME}
      TS_LANGUAGES ${Slicer_LANGUAGES}
      QM_OUTPUT_DIR_VAR QM_OUTPUT_DIR
      QM_OUTPUT_FILES_VAR QM_OUTPUT_FILES
      )
    set_property(GLOBAL APPEND PROPERTY Slicer_QM_OUTPUT_DIRS ${QM_OUTPUT_DIR})

  else()
    set(QM_OUTPUT_FILES )
  endif()

  # --------------------------------------------------------------------------
  # Build library
  # --------------------------------------------------------------------------
  SlicerMacroBuildModuleQtLibrary(
    NAME ${MODULEWIDGETS_NAME}
    EXPORT_DIRECTIVE ${MODULEWIDGETS_EXPORT_DIRECTIVE}
    FOLDER ${MODULEWIDGETS_FOLDER}
    INCLUDE_DIRECTORIES ${MODULEWIDGETS_INCLUDE_DIRECTORIES}
    LINK_DIRECTORIES ${MODULEWIDGETS_LINK_DIRECTORIES}
    SRCS ${MODULEWIDGETS_SRCS} ${QM_OUTPUT_FILES}
    MOC_SRCS ${MODULEWIDGETS_MOC_SRCS}
    UI_SRCS ${MODULEWIDGETS_UI_SRCS}
    TARGET_LIBRARIES ${MODULEWIDGETS_TARGET_LIBRARIES}
    RESOURCES ${MODULEWIDGETS_RESOURCES}
    ${MODULEWIDGETS_WRAP_PYTHONQT_OPTION}
    ${MODULEWIDGETS_NO_INSTALL_OPTION}
    )

  set_property(GLOBAL APPEND PROPERTY SLICER_MODULE_WIDGET_TARGETS ${MODULEWIDGETS_NAME})

  #-----------------------------------------------------------------------------
  # Update Slicer_ModuleWidgets_INCLUDE_DIRS
  #-----------------------------------------------------------------------------
  set(Slicer_ModuleWidgets_INCLUDE_DIRS
    ${Slicer_ModuleWidgets_INCLUDE_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    CACHE INTERNAL "Slicer Module widgets includes" FORCE)

endmacro()
