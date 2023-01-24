

#ifndef itkFactoryRegistration_h
#define itkFactoryRegistration_h

#include "itkFactoryRegistrationConfigure.h"

#ifdef SLICER_USE_SLICERITK
#include "itkNamespace.h"
#endif

namespace itk {

ITKFactoryRegistration_EXPORT void itkFactoryRegistration();
}

#endif
