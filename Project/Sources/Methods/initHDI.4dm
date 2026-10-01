//%attributes = {"invisible":true}
ARRAY TEXT:C222(TabControl; 0)
ARRAY TEXT:C222(TextTabControl; 0)
ALL RECORDS:C47([SAMPLES:3])
ORDER BY:C49([SAMPLES:3]; [SAMPLES:3]SampleSort:4; >)
SELECTION TO ARRAY:C260([SAMPLES:3]Title:2; TabControl)
SELECTION TO ARRAY:C260([SAMPLES:3]Text:3; TextTabControl)
UNLOAD RECORD:C212([SAMPLES:3])

TabControl:=0
Var1:=TextTabControl{1}
Var2:=TextTabControl{2}
Var3:=TextTabControl{3}
Var4:=TextTabControl{4}
Var5:=TextTabControl{5}