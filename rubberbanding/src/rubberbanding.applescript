on alfred_script(q)

  try
    set currentValue to do shell script "defaults read -g NSScrollViewRubberbanding"
  on error sErr
    set currentValue to "1"
  end try

  if currentValue is equal to "0" then
    set sTtl to "Rubber band scrolling is currently disabled"
    set sTxt to "Would you like to enable rubber band scrolling?"
    set sLbl to "Enable"
    set sCmd to "defaults delete -g NSScrollViewRubberbanding"
    set sRet to "Rubber band scrolling has been enabled."
  else if currentValue is equal to "1" then
    set sTtl to "Rubber band scrolling is currently enabled"
    set sTxt to "Would you like to disable rubber band scrolling?"
    set sLbl to "Disable"
    set sCmd to "defaults write -g NSScrollViewRubberbanding -int 0"
    set sRet to "Rubber band scrolling has been disabled."
  end if

  try
    display dialog sTxt buttons {"Cancel", sLbl} default button sLbl with title sTtl
    do shell script sCmd
  on error sErr
    set sRet to ""
  end try

  return sRet

end alfred_script
