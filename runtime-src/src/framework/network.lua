LJJ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\network.luaD    46   9    9  D  isLocalWiFiAvailableNetworkcc M    H6   9    9  D  "isInternetConnectionAvailableNetworkcc �   e6    B X�6 ' 6   B A+ L 6 9 9  D isHostNameReachableNetworkcctostring8network.isHostNameReachable() - invalid hostname %sprintErrorstring	typehostname   L    �6   9    9  D   getInternetConnectionStatusNetworkcc � 	 	 3�  X�'  6 96  B A   X�6 9X�6 96 9 9    D createWithUrlHTTPRequestkCCHTTPRequestMethodPOSTkCCHTTPRequestMethodGETcctostring
upperstringGETcallback  url  method   �  4��6   X�9  X�9' B-  9   ' B999  X�	 9
   BX�	 9
  B9  X�6	 9	BX
�98
 9
::BE
R
�	 9BL  �
startaddFormContentsipairs
extraaddFormFilecontentType	POSTcreateHTTPRequestNeed file datas!filePathfileFieldNameassert					network callback  5url  5datas  5request %fileFieldName $filePath #contentType "
 
 
i data  z   �6  96   B A     X�  X�+ L + L 	trueyestostring
lowerstringt   �  
&N�4  6    BH�6 	 B X�6 9	B X�6 	 B   6 
 B'	 6
 9

 B
&
<FR�6 9 '	 D ; concaturlencodestring=
valuetostring
table	type
pairs												cookie  'arr %  name value   �  3��4  6  9  ' B6  BX&�6  9
 B  X�6  9
 ' B5	 :
=
	-
  :B
=
		:
=

	-
  :B
=
	6
 :B
=
	:
=
	6
  9

:B
=
	9
	<	
ER�L �
valueurldecode	nameexpirecheckintsecure	pathaccessdomain  		trimipairs

splitstringparseTrueFalse cookieString  4cookie 2arr -) ) )_ &item  &parts c  �   D �4   3 =  3 = 3 = 3 = 3	 = 3 =
 3 3 = 3 = 2  �L   parseCookie makeCookieString  uploadFile createHTTPRequest  getInternetConnectionStatus isHostNameReachable "isInternetConnectionAvailable isLocalWiFiAvailable" 6 4 J H k e � � � � � 'Q3SSnetwork parseTrueFalse   