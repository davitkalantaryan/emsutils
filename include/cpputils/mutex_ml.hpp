//
// file:			mutex_ml.hpp
// path:			include/cpputils/mutex_ml.cpp
// created on:		2021 Nov 08
// created by:		Davit Kalantaryan (davit.kalantaryan@gmail.com)
//

#ifndef CPPUTILS_CPPUTILS_MUTEX_ML_HPP
#define CPPUTILS_CPPUTILS_MUTEX_ML_HPP


#include <cpputils_internal_header.h>
#include <stddef.h>
#ifdef CPPUTILS_CPP_11_DEFINED
#include <mutex>
#endif


namespace cpputils {

class CPPUTILS_DLL_PRIVATE mutex_ml_p;

class CPPUTILS_EXPORT mutex_ml
{
public:
	mutex_ml(const mutex_ml&) = delete;
	mutex_ml& operator=(const mutex_ml&) = delete;
	mutex_ml();
	~mutex_ml();

	void lock();
	void unlock();

	size_t numberOfLocksInThisThread()const;

#ifdef CPPUTILS_CPP_11_DEFINED
	::std::mutex& std_mutex()const;
#endif

private:
	mutex_ml_p* const m_mutex_ml_data_ptr;
};

}  // namespace cpputils {


#endif  // #ifndef CPPUTILS_CPPUTILS_MUTEX_ML_HPP