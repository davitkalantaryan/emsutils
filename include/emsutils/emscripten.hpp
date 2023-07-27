//
// file:			emscripten.hpp
// path:			include/emsutils/emscripten.hpp
// created on:		2022 Feb 09
// created by:		Davit Kalantaryan (davit.kalantaryan@gmail.com)
//

#pragma once

#include <emsutils/export_symbols.h>
#include <cinternal/disable_compiler_warnings.h>
#include <string>
#include <cinternal/undisable_compiler_warnings.h>

#ifdef CPPUTILS_EMSCRIPTEN_IS_USED
#include <emscripten/emscripten.h>
#endif

namespace emsutils {

typedef void (*FsSyncClbk)(void*);

extern "C" EMSUTILS_EXPORT void  get_base_url_str2(const char* a_hint, char* a_buff, int a_bufLen);
EMSUTILS_EXPORT ::std::string  get_base_url_str(const ::std::string& a_hint);
EMSUTILS_EXPORT void mount_idbfs_file_system(const char* a_cpcMountPoint, const FsSyncClbk& a_clbk, void* a_pData);
EMSUTILS_EXPORT void fs_sync(void);

}  // namespace emsutils {
