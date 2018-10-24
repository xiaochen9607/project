#ifndef __A_STAR_H__
#define __A_STAR_H__

#include "cocos2d.h"
#include "AstarNode.h"
#include "GameUtil.h"
//#include "AstarConstant.h"
USING_NS_CC;

#define COST_HORIZONTAL 5
#define COST_VERTICAL 5
#define COST_DIAGONAL 7
#define min(a,b) ((a) < (b) ? (a) : (b))
#define max(a,b) ((a) > (b) ? (a) : (b))
class Astar
{
public:
	Astar();
	~Astar();
	enum AstarStatic
	{
		DIR_UP = 0,
		DIR_LEFT = 1,
		DIR_RIGHT = 2,
		DIR_DOWN = 3,
		DIR_TOPLEFT = 4,
		DIR_TOPRIGHT = 5,
		DIR_DOWNRIGHT = 6,
		DIR_DOWNLEFT = 7,
	};
	struct point
	{
		int x;
		int y;
	};
	static Astar* create(Value& map,int mapWidth, int mapHeight, Value& startPt, Value& endPt, Value& extBlock, int blockCnt);
	bool init(Value& map, int mapWidth, int mapHeight, Value& startPt, Value& endPt, Value& extBlock, int blockCnt);
	void reset(Value& startPt, Value& endPt, Value& extBlock, int blockCnt);
	void reset(point& startPt, point& endPt);
	void initMap();
	std::list<AstarNode*> find(bool fourDir);
	Value findPath(bool fourDir);
	void getAroundNode(std::vector<AstarNode*> &arrNode,int x, int y);
	void getAroundNode(std::vector<AstarNode*> &arrNode, int x, int y, bool fourDir);
	bool isWalkable(int x, int y);
	bool getWalkable(int x, int y);
	int getGValue(AstarNode* currentNode, AstarNode* node);
	int getHValue(AstarNode* endNode, AstarNode* node);
	void findAndSort(AstarNode* node);
	void insertAndSort(AstarNode* node);
	void createPath(std::list<AstarNode*> &path, int xStart, int yStart);
private:
	bool m_bFullSearch;
	point m_startPoint;
	point m_endPoint;
	int m_MapStartX;
	int m_MapStartY;
	
	int m_MapInitH;
	int m_MapInitW;

	bool m_bFound;
	
	std::list<AstarNode*> m_OpenList;
	std::list<AstarNode*> m_CloseList;

	std::vector<std::vector<int>> m_arrMap;
	int m_nMapWidth;	//地图列数
	int m_nMapHeigh; //地图行数
	//std::vector<point> m_ArrBlock; //地图中的额外障碍
	std::vector<point> m_ArrBlock;
	int m_nBlockCnt;
	std::vector<std::vector<AstarNode*>> m_MapNode;
	int m_nNodeCnt;


	double cost;
};

#endif