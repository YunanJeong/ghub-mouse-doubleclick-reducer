-- 5: MOUSE FORWARD SIDE BUTTON
-- 4: MOUSE GOBACK SIDE BUTTON
FXXKED_BUTTON = 4
IGNORE_INTERVAL_MS = 300 -- Optimize this milliseconds, while monitoring logs

gLastEventTime = 0
gEventTime = 0
gCount = 0

function OnEvent(event, arg)
  if event == "MOUSE_BUTTON_PRESSED" and arg == FXXKED_BUTTON then
    gEventTime = GetRunningTime()
    if gLastEventTime == 0 or (gEventTime - gLastEventTime > IGNORE_INTERVAL_MS) then
      log("Normal", getCount())
      goBack() --testPress()
      gLastEventTime = gEventTime
    else
      log("Duplicate", "Ignore unintentional double-clicks within " .. tostring(IGNORE_INTERVAL_MS) .. "ms")
    end
  end
end

function log(case, contents)
  OutputLogMessage("\n{\"EventTime\": %d, \"Interval\": %d, \"Case\": \"%s\", \"Contents\": \"%s\"}",
                  gEventTime, gEventTime-gLastEventTime, tostring(case), tostring(contents)
  )
end

function getCount()
  gCount = gCount + 1
  if gCount == 11 then
    gCount = 1
  end
  return gCount
end

function goBack()
  PressKey("lalt")
  Sleep(50)
  PressKey("left")
  Sleep(50)
  ReleaseKey("lalt")
  Sleep(50)
  ReleaseKey("left")
  Sleep(50)
end

function testPress()
    PressKey(tostring(0))  
    Sleep(50)            
    ReleaseKey(tostring(0)) 
end
