-- 5: MOUSE FORWARD SIDE BUTTON
-- 4: MOUSE GOBACK SIDE BUTTON
FXXKED_BUTTON = 4
IGNORE_INTERVAL_MS = 300

gLastEventTime = 0
gEventTime = 0
gCount = 0

function OnEvent(event, arg)
  if event == "MOUSE_BUTTON_PRESSED" and arg == FXXKED_BUTTON then
    gEventTime = GetRunningTime()
    if gLastEventTime == 0 or (gEventTime - gLastEventTime > IGNORE_INTERVAL_MS) then
      LogNormal()
      GoBack() --TestPress()
      gLastEventTime = gEventTime
    else
      LogDuplicate()
    end
  end
end

function LogNormal()
  OutputLogMessage("\n{\"EventTime\": %d, \"LastEventTime\": %d, \"Interval\": %d, \"Case\": \"%s\", \"Contents\": \"%s\"}",
                  gEventTime, gLastEventTime, gEventTime-gLastEventTime, "Normal", tostring(GetCount())
  )
end

function LogDuplicate()
  OutputLogMessage("\n{\"EventTime\": %d, \"LastEventTime\": %d, \"Interval\": %d, \"Case\": \"%s\", \"Contents\": \"%s\"}",
                  gEventTime, gLastEventTime, gEventTime-gLastEventTime, "Duplicate", "Ignore unintentional double-clicks for " .. tostring(IGNORE_INTERVAL_MS) .. "ms"
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
