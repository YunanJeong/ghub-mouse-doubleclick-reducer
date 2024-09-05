-- 5: MOUSE FORWARD SIDE BUTTON
-- 4: MOUSE GOBACK SIDE BUTTON
FXXKED_BUTTON = 4
gLastTime = "none"
gCurTime = "none"
gCount = 0

function OnEvent(event, arg)
  gCurTime = GetDate()
  if event == "MOUSE_BUTTON_PRESSED" and arg == FXXKED_BUTTON then -- arg4번: 뒤로가기 물리버튼
    if gLastTime == "-1" or (gCurTime ~= gLastTime) then
      Log()
      GoBack() --TestPress()
      gLastTime = gCurTime
    end
  end
end

function Log()
  gCount = gCount + 1
  if gCount == 11 then
    gCount = 1
  end
  OutputLogMessage("\n-----------------------------")
  OutputLogMessage("\n> Last Click    : %s", gLastTime)
  OutputLogMessage("\n> Current Click : %s", gCurTime)
  OutputLogMessage("\n> goBack count  : %s", tostring(gCount))
  OutputLogMessage("\n-----------------------------")
end

function GoBack()
  PressKey("lalt") -- 뒤로가기 버튼 누르기
  Sleep(50)
  PressKey("left")
  Sleep(50)
  ReleaseKey("lalt") -- 뒤로가기 버튼 떼기
  Sleep(50)
  ReleaseKey("left")
  Sleep(50)
end

function TestPress()
    PressKey(tostring(0))  
    Sleep(50)            
    ReleaseKey(tostring(0)) 
end
