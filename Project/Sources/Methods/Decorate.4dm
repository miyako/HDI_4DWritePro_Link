//%attributes = {"invisible":true}
#DECLARE($part : Integer)

var $i; $total; $rnd : Integer
var $row; $col; $range : Object

Case of 
	: ($part=1)  // create table
		
		WPArea:=WP New:C1317
		
		WPrange:=WP Text range:C1341(WPArea; wk start text:K81:165; wk end text:K81:164)
		
		WPtable:=WP Insert table:C1473(WPrange; wk replace:K81:177; wk exclude from range:K81:181)
		
		
		ARRAY TEXT:C222($_Names; 0)
		APPEND TO ARRAY:C911($_Names; "Alpha")
		APPEND TO ARRAY:C911($_Names; "Bravo")
		APPEND TO ARRAY:C911($_Names; "Charlie")
		APPEND TO ARRAY:C911($_Names; "Delta")
		APPEND TO ARRAY:C911($_Names; "Two strings, 'Hello' and 'there'")
		APPEND TO ARRAY:C911($_Names; "Foxtrot")
		APPEND TO ARRAY:C911($_Names; "Golf")
		APPEND TO ARRAY:C911($_Names; "Hotel")
		APPEND TO ARRAY:C911($_Names; "India")
		APPEND TO ARRAY:C911($_Names; "Juliett")
		
		$total:=0
		
		$row:=WP Table append row:C1474(WPtable; ""; Localized string("Decorate_Name"); Localized string("Decorate_Date"); Localized string("Decorate_Value"))
		
		For ($i; 1; 10)
			$rnd:=(Random:C100*1000)+Random:C100%1000
			$total:=$total+$rnd
			
			$row:=WP Table append row:C1474(WPtable; _pictures{$i}; $_Names{$i}; Current date:C33+(Random:C100%100); $rnd)
		End for 
		
		$row:=WP Table append row:C1474(WPtable; ""; Localized string("Decorate_Total"); ""; $total)
		
	: ($part=2) & (Not:C34(OB Is empty:C1297(WPtable)))  // decorate table
		
		WP SET ATTRIBUTES:C1342(WPtable; wk table align:K81:200; wk center:K81:99)
		WP SET ATTRIBUTES:C1342(WPtable; wk border style:K81:29; wk solid:K81:115)
		WP SET ATTRIBUTES:C1342(WPtable; wk border width:K81:39; 4)
		
		WP SET ATTRIBUTES:C1342(WPtable; wk border color left:K81:35; 0x002040A0)
		WP SET ATTRIBUTES:C1342(WPtable; wk border color right:K81:36; 0x002040A0)
		WP SET ATTRIBUTES:C1342(WPtable; wk border color top:K81:37; 0x0040A0D0)
		WP SET ATTRIBUTES:C1342(WPtable; wk border color bottom:K81:38; 0x0040A0D0)
		
		WP SET ATTRIBUTES:C1342(WPtable; wk font family:K81:65; "Arial")
		WP SET ATTRIBUTES:C1342(WPtable; wk font size:K81:66; 16)
		WP SET ATTRIBUTES:C1342(WPtable; wk text color:K81:64; 0x00606060)
		
	: ($part=3) & (Not:C34(OB Is empty:C1297(WPtable)))  // decorate columns
		
		$col:=WP Table get columns:C1476(WPtable; 1; 1)  // icon
		WP SET ATTRIBUTES:C1342($col; wk width:K81:45; "40pt")
		
		$col:=WP Table get columns:C1476(WPtable; 2; 1)  //name
		WP SET ATTRIBUTES:C1342($col; wk width:K81:45; "150pt")
		
		$col:=WP Table get columns:C1476(WPtable; 3; 1)  // date
		WP SET ATTRIBUTES:C1342($col; wk width:K81:45; "100pt")
		WP SET ATTRIBUTES:C1342($col; wk text align:K81:49; wk center:K81:99)
		
		$col:=WP Table get columns:C1476(WPtable; 4; 1)  // value
		WP SET ATTRIBUTES:C1342($col; wk width:K81:45; "80pt")
		//WP SET ATTRIBUTES($col;wk text align;wk right)
		$row:=WP Table get rows:C1475(WPtable; 12; 1)
		
		
	: ($part=4) & (Not:C34(OB Is empty:C1297(WPtable)))  // decorate rows
		
		$row:=WP Table get rows:C1475(WPtable; 1; 1)
		
		WP SET ATTRIBUTES:C1342($row; wk font bold:K81:68; wk true:K81:174)
		WP SET ATTRIBUTES:C1342($row; wk text color:K81:64; 0x00404040)
		WP SET ATTRIBUTES:C1342($row; wk text align:K81:49; wk center:K81:99)
		WP SET ATTRIBUTES:C1342($row; wk height:K81:46; "32pt")
		WP SET ATTRIBUTES:C1342($row; wk vertical align:K81:9; wk center:K81:99)
		WP SET ATTRIBUTES:C1342($row; wk background color:K81:20; 0x00E0F0FF)
		
		$row:=WP Table get rows:C1475(WPtable; 12; 1)
		
		WP SET ATTRIBUTES:C1342($row; wk font bold:K81:68; wk true:K81:174)
		WP SET ATTRIBUTES:C1342($row; wk text color:K81:64; 0x00404040)
		WP SET ATTRIBUTES:C1342($row; wk height:K81:46; "36pt")
		WP SET ATTRIBUTES:C1342($row; wk vertical align:K81:9; wk center:K81:99)
		WP SET ATTRIBUTES:C1342($row; wk background color:K81:20; 0x00E0E0E0)
		
		
	: ($part=5) & (Not:C34(OB Is empty:C1297(WPtable)))  // decorate cells
		
		$range:=WP Table get cells:C1477(WPtable; 4; 2; 1; 10)  // starting at cell 4-2, take 1 col - 10 rows
		WP SET ATTRIBUTES:C1342($range; wk text color:K81:64; 0x00303080)
		WP SET ATTRIBUTES:C1342($range; wk background color:K81:20; 0x00E0E0E0)
		
		$range:=WP Table get cells:C1477(WPtable; 4; 12; 1; 1)  // starting at cell 4-12, take 1 col - 1 row  (last cell)
		WP SET ATTRIBUTES:C1342($range; wk text color:K81:64; 0x002020A0)
		WP SET ATTRIBUTES:C1342($range; wk background color:K81:20; 0x00C0C0C0)
		WP SET ATTRIBUTES:C1342($range; wk font size:K81:66; 20)
		
End case 


OBJECT SET ENABLED:C1123(*; "btnHTML"; True:C214)

