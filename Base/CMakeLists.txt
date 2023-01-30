
include(${Slicer_CMAKE_DIR}/SlicerMacroBuildBaseQtLibrary.cmake)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/QTCore
  ${CMAKE_CURRENT_BINARY_DIR}/QTCore
  )

 set(Slicer_BASE_SUBDIRS
    Logic
  )

 set(qSlicer_BASE_SUBDIRS
    QTCore
    QTGUI
 )

if(Slicer_BUILD_CLI_SUPPORT)
  list(APPEND Slicer_BASE_SUBDIRS
   CLI
  )

  list(APPEND qSlicer_BASE_SUBDIRS
   QTCLI
  )
endif()

if(Slicer_USE_PYTHONQT)
  list(APPEND Slicer_BASE_SUBDIRS
    Python
  )
endif()

foreach(SUBDIR ${Slicer_BASE_SUBDIRS})
  if(NOT Slicer_INSTALL_NO_DEVELOPMENT)
    set(SlicerBase${SUBDIR}_INSTALL_NO_DEVELOPMENT 0)
    add_subdirectory(${SUBDIR})
  endif()
endforeach()

foreach(SUBDIR ${qSlicer_BASE_SUBDIRS})
  if(NOT Slicer_INSTALL_NO_DEVELOPMENT)
    set(qSlicerBase${SUBDIR}_INSTALL_NO_DEVELOPMENT 0)
    add_subdirectory(${SUBDIR})
  endif()
endforeach()


# Since "QTApp" depends on "Modules/Core", the folder is included in the top-level CMakeLists.txt
# after "Modules/Core" folder.
