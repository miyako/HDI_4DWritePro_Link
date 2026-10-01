
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		urlSet1:="http://www.sony.com"
		urlSet2:="http://www.4d.com"
		urlGet:=""
		
		
		$Path:=Get 4D folder:C485(Current resources folder:K5:16)+"doc.4wp"
		WriteProArea:=WP Import document:C1318($path)
		
		
End case 

