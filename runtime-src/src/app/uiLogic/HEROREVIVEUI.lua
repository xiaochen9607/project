LJQ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\uiLogic\HEROREVIVEUI.lua    	K  self   ~    
6     9  +  6 ' B99B K  	nameHEROREVIVEUIdata.Config_UIrequireremoveUIUIManager �   -   9      X�-   9   B 6    9  +  6 ' B99B K  �	nameHEROREVIVEUIdata.Config_UIrequireremoveUIUIManagercallBackparam  �    6     9  6 9 9B 9B6 99+  5
 5	 =B K  	item 	type  �6d   ��������	nameBUYITEMConfig_UIgetRunningScenegetInstanceDirectorcc
addUIUIManager �   $)-   9      X�-   9   - B 6    9  +  6 ' B99B K    �	nameHEROREVIVEUIdata.Config_UIrequireremoveUIUIManagercallBackparam canRevive  � 
 ;c-   6  9 96 9B)   X�6  96 9 9	B 9
B6 ' B99+  5 B2 �-   X�  3 6  96 9 9	B 9
B6 99+  5	 =	= 	= 	B2  �K  K  ��param2
param	fun2 idreviveAllConfig_UI  idV	nameMESSAGEBOXdata.Config_UIrequiregetRunningScenegetInstanceDirectorcc
addUIUIManagerREVIVEITEMConst_genItemTypegetItemNumByIdlocalPlayerGameGlobal			
total param canRevive 9itemNum 2ok  �   +W6   9    9  -  9B -  9' B 9  B6  9+  6	 9
9BK  ��	nameBUYITEMConfig_UIremoveUIUIManagersetStringnumgetChildByNameitemIdgetItemNumByIdlocalPlayerGameGlobalparam view num  �E��Z-   9 B=6  9 6 96
 9

9


 
6 99 6 996 99B5	
 6
 9
	
)  )  )  )� B
=
	6
 9
	
)  )  )  )  B
=
	B3 3 6 	 9 9
' B
5 =B6 	 9 9
' B
5 =B)  3 3	 6
 
 9

 9' B5 =B
6
 
 9

 9' B5 =	B
9
6 ' B 9 9'  B
 B6 ' B 9! 9'  B A6" 9# 9$9%B6 '& B 9' 9'( B5) 9%>>B6 '& B 9' 9'* B5+ 9%>>B 9', B 9- B)  6. 6" 9/908
  X�6. 6" 9/9089162  93 '4 B)  ) M�62  938'5 + B:	 X�:O�6" 96976" 969899
8
  X� 9': B 9-6" 969899
8!';  &BX� 9': B 9- ';  &B6<  9=6" 969>B) 6" 969> ) M�6" 969>86" 96988
  X�6" 96988 X�O� 9'? B 9- B3@ 6A  9B 6" 966 'C B9D B2  �L  � factionWar_buyFixedShopItemapp.event.FactionWarEventaddEventEventManager 
total	died	dumpLogger/reviveuIdrevivedmaxReviveTimesfactionWarProxy_,
splitStringUtilattribute1officialPosfactionConfig_FactionCityJobsetStringnum  
icon2  	iconcreateapp.uiLogic.ICONitemIdgetItemNumByIdlocalPlayerGameGlobalsetNameVisible	headsetDataapp.uiLogic.CharHeadNode2require	hero  Button_4  Button_3    Button_2callBack  Button_1getChildByNamewidgetTouchExtent  borderColorfillColor borderWidthc4fheight
widthActualDesignSize	rectcccreateRectUIManager	viewnew����
*++++++++++,,,,,,,,,,-...........//////////00000011111111111111222222222222224444444456666666888888999999::::;;;;;;;<<<=:AAABBBBBBBCCCCCCCCCCCCCCCCCEEEEEEEEEEEHHHHHHHIIIIIIIJJJJLLLLLLLLLLLLMIPPPPPPPPVWWWWWWWWWWWWYYHEROREVIVEUI self  �view  �param  �logic �rect *�cb1 �cb2 �total �cb3 �cb4 �hero �num �extTimes %�str tmp   i tmp2 reviveMax Z0  i uId getShopInfo1  J   a6   9  BK  removeEventsEventManagerself   {    d6   ' B 3 = 3 = 3 = 2  �L   dispose create 	ctorHEROREVIVEUI
class`caddHEROREVIVEUI   