LJO@E:\work\dwProject\clientCode\trunk\dwsg\src_noPrint\framework\cc\sdk\Store.lua    6   9     X 6  ' B +  L  +  L  2framework.cc.sdk.Store - cc.Store not exists.printError
Storecc  
 &?-  B  X+ L 6  9  X6 ' B+ L 6   B X6 ' B+ L 6  6  9 9B=6  9 9	  D ΐ$postInitWithTransactionListenersharedStore
Store$Store.init() - invalid listenerfunction	type&Store.init() - store already initprintErrorstoreProvidercc			

checkCCStore listener  ' w   -   B    X +  L  6   9    9  D  ΐgetReceiptVerifyModestoreProvidercccheckCCStore  Λ  *K"-  B  X+ L 6    B X6 9  X6 9  X	6 9  X6 ' B+ L 6   B X+ 6 9	 9
   BK  ΐsetReceiptVerifyModestoreProviderboolean0Store.setReceiptVerifyMode() - invalid modeprintError#CCStoreReceiptVerifyModeServer#CCStoreReceiptVerifyModeDevice!CCStoreReceiptVerifyModeNoneccnumber	typecheckCCStore mode  +isSandbox  + |   1-   B    X +  L  6   9    9  D  ΐgetReceiptVerifyServerUrlstoreProvidercccheckCCStore    +6-  B  X+ L 6    B X6 ' B+ L 6 9 9  BK  ΐsetReceiptVerifyServerUrlstoreProvidercc4Store.setReceiptVerifyServerUrl() - invalid urlprintErrorstring	typecheckCCStore url   s   @-   B    X +  L  6   9    9  D  ΐcanMakePurchasesstoreProvidercccheckCCStore   
 3fE-  B  X+ L 6   B X6 ' B+ L 6    B X6 ' B+ L )   ) M6  8 B X6 ' 	 B+ L Oτ6 9	 9
   B+ L ΐloadProductsstoreProvidercc9Store.loadProducts() - invalid id[#%d] in productsIdstring.Store.loadProducts() - invalid productsId
table,Store.loadProducts() - invalid listenerprintErrorfunction	type			

checkCCStore productsId  4listener  4  i  z   ]-   B    X +  L  6   9    9  B K  ΐcancelLoadProductsstoreProvidercccheckCCStore    &b-  B  X+ L 6  9 9  D ΐisProductLoadedstoreProvidercccheckCCStore productId   Ή  9g-  B  X+ L 6  9  X6 ' B+ L 6   B X6 ' B+ L 6  9 9  D ΐpurchase)Store.purchase() - invalid productIdstring	type&Store.purchase() - store not initprintErrorstoreProvidercc			

checkCCStore productId    o   w-   B    X +  L  6   9    9  B K  ΐrestorestoreProvidercccheckCCStore   
 $@|-  B  X+ L 6  9  X6 ' B+ L 6   B X6 9 B X6 ' B+ L 6  9 9	9 D ΐfinishTransaction4Store.finishTransaction() - invalid transactionstringtransactionIdentifier
table	type/Store.finishTransaction() - store not initprintErrorstoreProvidercc			

checkCCStore transaction  % Ω   +C 4   3  3 = 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 6   X4  7 6 6 9  X4  =6 9= 2  L  paysdkcc finishTransaction restore purchase isProductLoaded cancelLoadProducts loadProducts canMakePurchases setReceiptVerifyServerUrl getReceiptVerifyServerUrl setReceiptVerifyMode getReceiptVerifyMode 	init 
 /"41>6C@[E`]ebugzw|Store *checkCCStore )  