set(SegmentStatisticsPlugins_PYTHON_SCRIPTS
  __init__
  SegmentStatisticsPluginBase
  LabelmapSegmentStatisticsPlugin
  ScalarVolumeSegmentStatisticsPlugin
  ClosedSurfaceSegmentStatisticsPlugin
  )

set(SegmentStatisticsPlugins_PYTHON_RESOURCES
  )

ctkMacroCompilePythonScript(
  TARGET_NAME SegmentStatisticsPlugins
  SCRIPTS "${SegmentStatisticsPlugins_PYTHON_SCRIPTS}"
  RESOURCES "${SegmentStatisticsPlugins_PYTHON_RESOURCES}"
  DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/SegmentStatisticsPlugins"
  )

# Install python module / resources directory
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
  DESTINATION "${Python3_SITELIB}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
)
