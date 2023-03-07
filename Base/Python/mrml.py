""" This module loads all the classes from the MRML library into its
namespace."""

# HACK Ideally constant from vtkSlicerConfigure should be wrapped,
#      that way the following try/except could be avoided.
try:
    from MRMLCLIPython import *
except:
    pass

from MRMLCorePython import *
from MRMLDisplayableManagerPython import *
from MRMLLogicPython import *
