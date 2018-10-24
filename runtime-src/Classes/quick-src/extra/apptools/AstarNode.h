#ifndef __ASTAR_NODE_H__
#define __ASTAR_NODE_H__
#include "cocos2d.h"
USING_NS_CC;
class AstarNode
{
public:
	AstarNode();
	~AstarNode();

	static AstarNode* create(int x, int y);
	void reset(int x, int y);
public:
	int x, y;
	int g, h, f;
	AstarNode* m_ParentNode;
	bool m_bInOpen;
	bool m_bInClose;
};


#endif // !__ASTAR_NODE_H__
