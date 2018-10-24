local TYPOSaddress={} -- empty address
TYPOSaddress.Street="Green Street"
TYPOSaddress.StreetNumber=120
TYPOSaddress.AptNumber="2b"
TYPOSaddress.City="C town"
TYPOSaddress.State="Castro"
TYPOSaddress.Country="EN"
 
print(TYPOSaddress.StreetNumber, TYPOSaddress["AptNumber"])