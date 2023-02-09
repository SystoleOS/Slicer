#-----------------------------------------------------------------------------
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/SegmentEditorEffects.__init__.py.in
  ${CMAKE_BINARY_DIR}/${Slicer_QTSCRIPTEDMODULES_LIB_DIR}/SegmentEditorEffects/__init__.py
  )

#-----------------------------------------------------------------------------
set(SegmentEditorEffects_PYTHON_SCRIPTS
  AbstractScriptedSegmentEditorEffect
  AbstractScriptedSegmentEditorLabelEffect
  AbstractScriptedSegmentEditorPaintEffect
  AbstractScriptedSegmentEditorAutoCompleteEffect
  SegmentEditorDrawEffect
  SegmentEditorFillBetweenSlicesEffect
  SegmentEditorGrowFromSeedsEffect
  SegmentEditorHollowEffect
  SegmentEditorIslandsEffect
  SegmentEditorLevelTracingEffect
  SegmentEditorLogicalEffect
  SegmentEditorMarginEffect
  SegmentEditorMaskVolumeEffect
  SegmentEditorSmoothingEffect
  SegmentEditorThresholdEffect
  )

set(SegmentEditorEffects_PYTHON_RESOURCES
  Resources/Icons/Draw.png
  Resources/Icons/FillBetweenSlices.png
  Resources/Icons/GrowFromSeeds.png
  Resources/Icons/Hollow.png
  Resources/Icons/Islands.png
  Resources/Icons/LevelTracing.png
  Resources/Icons/Logical.png
  Resources/Icons/Margin.png
  Resources/Icons/MaskVolume.png
  Resources/Icons/Smoothing.png
  Resources/Icons/Threshold.png
  )

ctkMacroCompilePythonScript(
  TARGET_NAME SegmentEditorEffects
  SCRIPTS "${SegmentEditorEffects_PYTHON_SCRIPTS}"
  RESOURCES "${SegmentEditorEffects_PYTHON_RESOURCES}"
  DESTINATION_DIR "${CMAKE_CURRENT_BINARY_DIR}/SegmentEditorEffects"
  )

# Install python module / resources directory
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
  DESTINATION "${Python3_SITELIB}" COMPONENT RuntimeLibraries
  FILES_MATCHING
  PATTERN "*.py"
  PATTERN "*.pyc"
)
