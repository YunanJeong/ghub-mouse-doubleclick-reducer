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
    if gLastTime == 0 or (gCurTime - gLastTime > IGNORE_INTERVAL_MS) then
      LogNormal()
      GoBack() --TestPress()
      gLastTime = gCurTime
    else
      LogDuplicate()
    end
  end
end

function LogNormal()
  OutputLogMessage("\n{\"LastClick\": %d, \"CurrentClick\": %d, \"Interval\": %d, \"Case\": \"Normal\", \"Count\": %d}",
                  gLastTime, gCurTime, gCurTime-gLastTime, GetCount()
  )
end

function LogDuplicate()
  OutputLogMessage("\n{\"LastClick\": %d, \"CurrentClick\": %d, \"Interval\": %d, \"Case\": \"Duplicate\", \"Comment\": \"Ignore unintentional double-clicks for %dms\"}",
                  gLastTime, gCurTime, gCurTime-gLastTime, IGNORE_INTERVAL_MS
  )
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
