LJJ@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\app\UpdateManager.lua9    6   9    9  D  createLayerColorcc    .	+ 6  96  X6  96  X6  96  X
6  96  X6  96  X+ K  PLATFORM_OS_MACPLATFORM_OS_ANDROIDPLATFORM_OS_WINDOWSPLATFORM_OS_IPADtargetPlatformPLATFORM_OS_IPHONEccself  support  ×  'h6  94  6  BH6 96
  B
' B
  X	6	 6 B			 X	6	 
	 X	6	 6 B		
 X		 	 	<	6	  9		+
  <
	FRáK  
tableboolean
value	type	.luatostring	findstring
pairsloadedpackageself  (already_files %allLuaInMem $     key var  pos  r   	$&	  X  9  B  9 BK  removeFromParentreloadLuaFiles	self  
bool_need_reload  
 þ 
 rÒF"  9  B6 999 XXg6 999 X-  9 B  9 B' 6 9	9
 X6 9'  B X6 9	9 X6 9'  B X6 9'  B -   9- 	 &	BX46 999 X.6 999 XX'6 999 X-  9BX6 999 X-  9+ BX6 999 X
6   BH FRþ-  9BK  À À
pairsERROR_UPDATINGUPDATE_FINISHEDswitchSceneALREADY_UP_TO_DATEERROR_PARSE_MANIFESTERROR_DOWNLOAD_MANIFESTsetString	%d%%Manifest file: %d%%MANIFEST_IDVersion file: %d%%formatstringVERSION_IDAssetsManagerExStaticgetPercentgetAssetIdUPDATE_PROGRESSIONERROR_NO_LOCAL_MANIFESTEventCodeEventAssetsManagerExccgetEventCode					






    "update_label _strCheck self event  seventCode oassetId )percent &strInfo %S  k  v     !]¨1='  6 9 X' 6 95 =B 9	6
 9
  9 B9   9	 B	9			 	B A  9  B6
 9 9B 9B6
 9 9 ' & B7 6  9B6  9B 9B  X  9 BX3 6
 9 96 	 B6
 9 9B 9B 9	 )
 B6  9 B2  K  update&addEventListenerWithFixedPrioritygetEventDispatcherDirector!EventListenerAssetsManagerEx switchSceneisLoadedgetLocalManifestretainamproject.manifestcreateAssetsManagerExgetWritablePathgetInstanceFileUtilsaddChildheight
widthgetContentSizepccsetPosition	text 	sizenewTTFLabeldisplayæ£æµèµæº....iosplatformdeviceæ£æµæ´æ°....																



788888889999999999999;;;;==self  ^_strCheck \update_label 
Rwrite_path 6onUpdateEvent listener  ¾  2zq'  -  ' &6 9 9B 9 B  X6 9 9B 9 B X
6 9 9B 9' B 6 9	 B6
  BH FRþ X4  L À
pairsdecode	jsonsrc/project.manifestgetStringFromFileisFileExistgetInstanceFileUtilsccproject.manifest										write_path self  3_file_string 1_path ._file_data $
  k  v    ç  	2-   9   	   X )-   9  )È   X $-   9  )Ï   X '  -  9&  6 9-  9B6 - BH FRþ6 -  9B6 - 9	B X
-  9
BXX -    9  B K  ÀÀ ÀswitchSceneupdateLayerEXversiontonumber
pairsresponsedecode	jsonstatusTextHttp Status Code:statusreadyState				xhr local_version_data self statusString remote_version_data   k  v   new_version_num  §
   ~%  9  B6 9 9B6 9=99' & 9	'
  +	 B+  3  9	 B 9B2  K  	sendregisterScriptHandler GET	open/version.txtchannelnewVersionUrl#XMLHTTPREQUEST_RESPONSE_STRINGresponseTypenewXMLHttpRequestccgetLocalVersionData	"####$$$%%self  !local_version_data xhr version_file_url new_version_data 
onReadyStateChange 	 Ü 	 	  ª  9  6 96 9B  9 6 9)  )  )  B A  9 )d B  9 BK  checkUpdateStatussetOpacityc3bccsetColorheight
widthdisplaysetContentSizeself   !   
²9  D newself   ²   &N ½6   ' 3 B 6 9 9B 9B6 9 9B 9B3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  L   create 	ctor checkUpdateStatus getLocalVersionData updateLayerEX switchScene reloadLuaFiles updateLayergetWritablePathFileUtilsgetWinSizegetInstanceDirectorcc UpdateManager
class	#/&n1q¨°ªµ²¼¼UpdateManager "winSize write_path   