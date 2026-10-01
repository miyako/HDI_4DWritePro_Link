Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$vers:=Application version:C493
		
		If ($vers<"1640")  //1640 means 16 R4   1601 means 16.1
			
			<>Quit:=True:C214
			OBJECT SET TITLE:C194(*; "BtnDemo"; "Quit 4D")
			OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
			
		Else 
			If (Is license available:C714(4D Write license:K44:2)#True:C214)
				OBJECT SET TITLE:C194(*; "BtnDemo"; "Quit 4D")
				OBJECT SET VISIBLE:C603(*; "TxtLicence"; True:C214)
				OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
				<>Quit:=True:C214
			Else 
				<>Quit:=False:C215
				
			End if 
			
			
		End if 
		
End case 
