Dim objFSO, scriptPath, batPath
Set objFSO = CreateObject("Scripting.FileSystemObject")
scriptPath = objFSO.GetParentFolderName(WScript.ScriptFullName)
batPath = objFSO.BuildPath(scriptPath, "restart.bat")

Set ws = WScript.CreateObject("WScript.Shell")
ws.Run batPath, 0