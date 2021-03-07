

#include <common/hashtbl.hpp>


int main()
{
	{
		common::hashtbl::Base<int,int> aHash;
		
		aHash.AddEntry(1,1);
		aHash.AddEntryEvenIfExists(1,1);
	}
	
	{
		int a=1;
		common::hashtbl::HashTbl<int> aHash;
		
		aHash.AddEntry({&a,4},1);
		aHash.AddEntryEvenIfExists({&a,4},1);
		aHash.FindEntry({&a,4});
	}
	
	{
		common::hashtbl::Map<int> aHash;
		
		size_t unHash;
		aHash.AddEntry(1);
		
		aHash.FindEntry(2,&unHash);
		aHash.AddEntryWithKnownHash(2,unHash);
	}
	
	return 0;
}
