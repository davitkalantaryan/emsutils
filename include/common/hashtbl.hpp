//
// file:			hashtbl.hpp
// path:			include/common/hashtbl.hpp
// created on:		2017 Jul 21
// created by:		Davit Kalantaryan (davit.kalantaryan@gmail.com)
//

#ifndef COMMON_HASHTBL_HPP
#define COMMON_HASHTBL_HPP

#include <cpputils_internal_header.h>
#include <stdint.h>
#include <stddef.h>
#ifdef CPPUTILS_CPP_11_DEFINED
#include <functional>
#else
#endif

#define DEFAULT_TABLE_SIZE	64

namespace common { namespace hashtbl {


template <typename KeyType,typename DataType=int>
class Funcs
{
public:
	static size_t	DefaultHash(const KeyType& key);
	static bool		DefaultFind(void* clbkData,const KeyType& key, const DataType& data);
	static bool		DefaultFindVoid(void* clbkData,const KeyType& key);
public:
#ifdef CPPUTILS_CPP_11_DEFINED
	typedef std::function<size_t(const KeyType& key)> Hash;
	typedef std::function<bool(void* clbkData,const KeyType& key, const DataType& data)> Find;
	typedef std::function<bool(void* clbkData,const KeyType& key)> FindVoid;
#else
	typedef size_t (*Hash)(const KeyType& key);
	typedef bool (*Find)(void* clbkData,const KeyType& key, const DataType& data);
	typedef bool (*Find)(void* clbkData,const KeyType& key);
#endif
};


template <typename KeyType,typename DataType>
class Base
{
public:
	struct HashItem;
	class  iterator;
public:
	
	Base(size_t tableSize= DEFAULT_TABLE_SIZE, typename Funcs<KeyType,DataType>::Hash a_funcHash=&Funcs<KeyType,DataType>::DefaultHash);
	virtual ~Base();

	iterator	AddEntryEvenIfExists(const KeyType& key, const DataType& data);
    iterator	AddEntry(const KeyType& key, const DataType& data);
	iterator	AddOrReplaceEntry(const KeyType& key, const DataType& data);
	iterator	AddEntryWithKnownHash(const KeyType& key,const DataType& a_data, size_t a_hashVal);
	iterator	FindEntry(const KeyType& key,size_t* corespondingHash=CPPUTILS_NULL,
						  void*clbkData=CPPUTILS_NULL,typename Funcs<KeyType,DataType>::Find a_fnc=&Funcs<KeyType,DataType>::DefaultFind);
    bool		RemoveEntry(const KeyType& key);
	void		RemoveEntry(iterator entry);

protected:
	const typename Funcs<KeyType,DataType>::Hash	m_funcHash;
	HashItem**		m_pTable;
	size_t			m_unRoundedTableSizeMin1;
	HashItem*		m_pFirstItem;
	
public:
	struct HashItem {
		friend class Base;
	protected:
        HashItem(const KeyType& key, const DataType& data);
		virtual ~HashItem();
	public:
		const KeyType key; DataType data;
	};
	
	class iterator{
	public:
		iterator& operator++();
		iterator& operator++(int);
		HashItem* operator->();
		operator HashItem*();
		
	private:
		friend class Base;
		iterator(HashItem* a_pItem);
		HashItem* m_pItem;
	}static const s_endIter;
};


struct VoidPtrKey{
	const void*	key;
	size_t		keyLen;
	bool operator==(const VoidPtrKey& aM)const;
};



template <typename KeyType>
class Base<KeyType,void>
{
public:
	struct HashItem;
	class  iterator;
public:
	
	Base(size_t tableSize= DEFAULT_TABLE_SIZE, typename Funcs<KeyType>::Hash a_funcHash=&Funcs<KeyType>::DefaultHash);
	virtual ~Base();

    iterator	AddEntry(const KeyType& key);
	iterator	AddEntryWithKnownHash(const KeyType& key,size_t a_hashVal);
	iterator	FindEntry(const KeyType& key,size_t* corespondingHash=CPPUTILS_NULL,
						  void*clbkData=CPPUTILS_NULL,typename Funcs<KeyType>::FindVoid a_fnc=&Funcs<KeyType>::DefaultFindVoid);
    bool		RemoveEntry(const KeyType& key);
	void		RemoveEntry(iterator entry);

protected:
	const typename Funcs<KeyType>::Hash	m_funcHash;
	HashItem**		m_pTable;
	size_t			m_unRoundedTableSizeMin1;
	HashItem*		m_pFirstItem;
	
public:
	struct HashItem {
		friend class Base;
	protected:
        HashItem(const KeyType& key);
		virtual ~HashItem();
	public:
		const KeyType key;
	};
	
	class iterator{
	public:
		iterator& operator++();
		iterator& operator++(int);
		HashItem* operator->();
		operator HashItem*();
		
	private:
		friend class Base;
		iterator(HashItem* a_pItem);
		HashItem* m_pItem;
	}static const s_endIter;
};



template <typename DataType>
class HashTbl : public Base<VoidPtrKey,DataType>{};

template <typename KeyType>
class Map : public Base<KeyType,void>{};


}}  // namespace common { namespace hashtbl {


#ifndef COMMON_HASHTBL_IMPL_HPP
#include "hashtbl.impl.hpp"
#endif



#endif  // #ifndef COMMON_HASHTBL_HPP
