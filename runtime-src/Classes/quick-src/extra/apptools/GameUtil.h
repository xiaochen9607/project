#ifndef __SOCKET_MANAGER_H__
#define __SOCKET_MANAGER_H__

#include "cocos2d.h"
//#include "Astar.h"

USING_NS_CC;

class Astar;
class GameUtil
{
public:
	static GameUtil* getInstance();

	GameUtil();
	~GameUtil();
	static double getSystemTime();
	void bindAstar(Value& map,int mapWidth, int mapHeight, Value& startPt, Value& endPt, Value& extBlock, int blockCnt);
	void aStarReset( Value& startPt, Value& endPt, Value& extBlock, int blockCnt);
	Value aStarFind(bool fourDir);
private:
	static Astar *m_aStar;
};

#endif