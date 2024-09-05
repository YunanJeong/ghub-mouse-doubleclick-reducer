-- 5: MOUSE FORWARD SIDE BUTTON
-- 4: MOUSE GOBACK SIDE BUTTON
FXXKED_BUTTON = 4
IGNORE_INTERVAL_MS = 300

gLastTime = 0
gCurTime = 0
gCount = 0

function OnEvent(event, arg)
  gCurTime = GetRunningTime()
  local interval = gCurTime - gLastTime
  if event == "MOUSE_BUTTON_PRESSED" and arg == FXXKED_BUTTON then
    if gLastTime == 0 or (interval > IGNORE_INTERVAL_MS) then
      Log()
      GoBack() --TestPress()
      gLastTime = gCurTime
    else
      OutputLogMessage("\n> Ignore unintentional double-clicks that occured within %dms(<%dms)", interval, IGNORE_INTERVAL_MS)
    end
  end
end

function Log()
  gCount = gCount + 1
  if gCount == 11 then
    gCount = 1
  end
  OutputLogMessage("\n-----------------------------")
  OutputLogMessage("\n> Last Click    : %d", gLastTime)
  OutputLogMessage("\n> Current Click : %d", gCurTime)
  OutputLogMessage("\n> Count         : %d", gCount)
  OutputLogMessage("\n-----------------------------")
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
