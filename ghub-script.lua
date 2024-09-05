-- 5: MOUSE FORWARD SIDE BUTTON
-- 4: MOUSE GOBACK SIDE BUTTON
FXXKED_BUTTON = 4
IGNORE_INTERVAL_MS = 300

gLastTime = 0
gCurTime = 0
gCount = 0

function OnEvent(event, arg)
  if event == "MOUSE_BUTTON_PRESSED" and arg == FXXKED_BUTTON then
    gCurTime = GetRunningTime()
    OutputLogMessage("\n{\"LastClick\": %d, \"CurrentClick\": %d, \"Interval\": %d}", gLastTime, gCurTime, gCurTime-gLastTime)
    if gLastTime == 0 or (gCurTime - gLastTime > IGNORE_INTERVAL_MS) then
      OutputLogMessage("\n> Normal Case. Count: %d", GetCount())
      GoBack() --TestPress()
      gLastTime = gCurTime
    else
      OutputLogMessage("\n> Duplicate Case. Ignore unintentional double-clicks for %dms", IGNORE_INTERVAL_MS)
    end
  end
end

function GetCount()
  gCount = gCount + 1
  if gCount == 11 then
    gCount = 1
  end
  return gCount
end

function GoBack()
  PressKey("lalt")
  Sleep(50)
  PressKey("left")
  Sleep(50)
  ReleaseKey("lalt")
  Sleep(50)
  ReleaseKey("left")
  Sleep(50)
end

function TestPress()
    PressKey(tostring(0))  
    Sleep(50)            
    ReleaseKey(tostring(0)) 
end
