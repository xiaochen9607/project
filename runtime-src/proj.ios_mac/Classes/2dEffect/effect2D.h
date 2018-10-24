#ifndef __effect2D__
#define __effect2D__
#include "ensLightningBoltNode.h"
class effect2D: public ClightningBoltNode
{
public:
	effect2D(void);
	~effect2D(void);
	static effect2D* createLightning();
};
#endif
