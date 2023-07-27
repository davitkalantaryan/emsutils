//
// repo:			emsutils
// file:			export_symbols.h
// path:			include/emsutils/export_symbols.h
// created on:		2022 Sep 21
// created by:		Davit Kalantaryan (davit.kalantaryan@gmail.com)
//

#ifndef EMSUTILS_INCLUDE_EMSUTILS_EXPORT_SYMBOLS_H
#define EMSUTILS_INCLUDE_EMSUTILS_EXPORT_SYMBOLS_H

#include <cinternal/internal_header.h>

#ifndef EMSUTILS_EXPORT
#if defined(EMSUTILS_COMPILING_SHARED_LIB)
#define EMSUTILS_EXPORT CPPUTILS_DLL_PUBLIC
#elif defined(EMSUTILS_USING_STATIC_LIB_OR_OBJECTS)
#define EMSUTILS_EXPORT
#elif defined(EMSUTILS_LOAD_FROM_DLL)
#define EMSUTILS_EXPORT CPPUTILS_IMPORT_FROM_DLL
#else
#define EMSUTILS_EXPORT CPPUTILS_DLL_PRIVATE
#endif
#endif


#endif  // #ifndef EMSUTILS_INCLUDE_EMSUTILS_EXPORT_SYMBOLS_H
