$Path:=Get 4D folder:C485(Data folder:K5:33)+"export.html"
WP EXPORT DOCUMENT:C1337(WriteProArea; $path; wk web page complete:K81:2; wk normal:K81:7)

OPEN URL:C673($Path)
