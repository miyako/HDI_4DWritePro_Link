Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		$range:=WP Selection range:C1340(*; "WriteProArea")
		$start:=OB Get:C1224($range; "rangeStart")
		$end:=OB Get:C1224($range; "rangeEnd")
		
		If ($start=$end)
			OBJECT SET ENABLED:C1123(*; "setlink@"; False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*; "setlink@"; True:C214)
		End if 
		
End case 