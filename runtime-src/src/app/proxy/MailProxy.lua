LJL@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\proxy\MailProxy.lua*   )  =  K  mailTimeself   C  -   9 BL  �newMailProxy self  proxy  v   %)  =  6 9 9BK  !send_getPlayerSomeInfoChangeloginProxyGameGlobalmailTimeself  	 � 
 9,-   9 6 96 9B 9 B 9B6 9 9 6	 	  9
 B AK  �handlersendMsggameSocketGameGlobalfinishaddInt!MODULE_MAIL_getAllPlayerMailMODULE_MAILmsgTypecreateMsgModule self  type  msg 	 � 
 2V34  :  X"�) )   X�U�4  <88= 88=88=88=88=88=X�6  9  6 '		 B9
5 =BK  mailInfo  getAllPlayerMailapp.event.MailProxyEventrequiresendEventEventManagersenderName
title	time	bGet
bReadid 			
self  3arr  3mailArr 1index !i   � 
 7L-   9 6 96 9B 9 B 9B6 9 9 6	 	  9
 B AK  �handlersendMsggameSocketGameGlobalfinishaddInt%MODULE_MAIL_getOneMailDetailInfoMODULE_MAILmsgTypecreateMsgModule self  id  msg 	 �  I�S:	  X�K  4  := :=:=:=:=:=:=:=4  =:
  X�:
=	:	
 X�6  9:	' B)  ) M�6 
 98' + B9	4
  <
	6	  B	H�98<FR�O�6  9  6 '	 B95 =BK  mailInfo  getOneMailDetailInfoapp.event.MailProxyEventrequiresendEventEventManager
pairs_,
splitStringUtil
vipLvawardscontent
titlesenderName	time	bGet
bRead	typeid����		

self  Jarr  JmailTable Dawards1Arr    i awards2Arr   k v   � 
 7t-   9 6 96 9B 9 B 9B6 9 9 6	 	  9
 B AK  �handlersendMsggameSocketGameGlobalfinishaddIntMODULE_MAIL_recMailRewardMODULE_MAILmsgTypecreateMsgModule self  id  msg 	 � 	!8{:	  X�6   96 9 9B 9B-  99+  5 BX�6	  9
  6 ' B95 =BK  �results  recMailRewardapp.event.MailProxyEventrequiresendEventEventManager idb	nameMESSAGEBOXgetRunningScenegetInstanceDirectorcc
addUIUIManager UIConfig self  "arr  " �    O�6  999 X�= X�9 X�= X	�9 X�= X�9	 X�=
 5 9 =9 =9 =9
 =	L   mailArmy	armymailBattlebattlemailSystemsystemmailPersonalpersonalmailTypeInt	mailConfig_GameData	self  !mailType  !num  !n_type mailUnRead  � 
	 0�-   9 6 96 9B 9B6 9 9 6   9	 B+  + BK  �handlersendMsggameSocketGameGlobalfinishMODULE_MAIL_getNoReadNumMODULE_MAILmsgTypecreateMsgModule self  msg 	 � 
  8�4  := :=:=:=:= := := := 6  9	  6
 '	 B95 =BK  mailUnReadNum  getNoReadNumapp.event.MailProxyEventrequiresendEventEventManagermailArmymailPersonalmailSystemmailBattle	armypersonalsystembattle		










self  arr  mailUnRead  � 
 "W�-   9 6 96 9B 9 B 9 B 9 B 9B6 9 9 6		   9 B	 AK  �handlersendMsggameSocketGameGlobalfinishaddStringMODULE_MAIL_writeMailMODULE_MAILmsgTypecreateMsgModule self  #recvName  #title  #content  #msg 	 � 	  �6   9  6 ' B94 :>BK  writeMailapp.event.MailProxyEventrequiresendEventEventManagerself  arr   � 
	 .�-   9 6 96 9B 9B6 9 9 6   9	 B AK  �handlersendMsggameSocketGameGlobalfinish%MODULE_MAIL_getFactionMemberNameMODULE_MAILmsgTypecreateMsgModule self  msg 	 � 	  �6   9  6 ' B95 =BK  members  getFactionMemberNameapp.event.MailProxyEventrequiresendEventEventManagerself  arr   � 
 :�-   9 6 96 9B 9 B 9B6 9 9 6	 	  9
 B AK  �handlersendMsggameSocketGameGlobalfinishaddString!MODULE_MAIL_removePlayerMailMODULE_MAILmsgTypecreateMsgModule self  strId  msg 	 � 	  �6   9  6 ' B95 =BK  arr  removePlayerMailapp.event.MailProxyEventrequiresendEventEventManagerself  arr   � 
 =�-   9 6 96 9B 9 B 9B6 9 9 6	 	  9
 B AK  �handlersendMsggameSocketGameGlobalfinishaddInt$MODULE_MAIL_onekeyAcqMailRewardMODULE_MAILmsgTypecreateMsgModule self  mailType  msg 	 � 	 $�:	  X�6   9  6 ' B95 =BX�6  96	 9
BK  mailAcquireNoneConfig_LanguageaddMessageFloatMessagearr  onekeyAcqMailRewardapp.event.MailProxyEventrequiresendEventEventManagerself  arr   j   
�9    X�6 99  B+  =  K  unscheduleGlobalscheduler_scheduleself   �  0 8\ �6   ' B 6 ' B6 ' B6 ' B3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 2  �L   dispose $MODULE_MAIL_onekeyAcqMailReward send_onekeyAcqMailReward !MODULE_MAIL_removePlayerMail send_removePlayerMail %MODULE_MAIL_getFactionMemberName send_getFactionMemberName MODULE_MAIL_writeMail send_writeMail MODULE_MAIL_getNoReadNum send_getNoReadNum setMailNoReadNum MODULE_MAIL_recMailReward send_recMailReward %MODULE_MAIL_getOneMailDetailInfo send_getOneMailDetailInfo !MODULE_MAIL_getAllPlayerMail send_getAllPlayerMail refreshMailCnt create 	ctorapp.utils.StringUtildata.Config_UIapp.control.MsgrequireMailProxy
class)%1,J3QLqSyt�{��������������������������MailProxy 5MsgModule 2UIConfig /  