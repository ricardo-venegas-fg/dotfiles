function greenConsoleText($text) {
    $ESC = [char]27;
    return "$ESC[32m$($text)$ESC[0m"
  }
  
  function redConsoleText($text) {
    $ESC = [char]27;
    return "$ESC[91m$($text)$ESC[0m"
  }
   
  function Prompt {
    $lastExitCodeBeforePrompt = $global:LASTEXITCODE
    $new = 0
    $modified = 0
    $deleted = 0
    $prompt = ""
    $statusList = (git status -s)
    if ($global:LASTEXITCODE -eq 0) {
      git status -s | 
      foreach { $_.Trim().Split(" ")[0] } | 
      foreach { 
        if ($_ -eq "??") {
          $new = $new + 1
        }
        else {
          if ($_ -eq "D") { $deleted = $deleted + 1 }
          else { $modified = $modified + 1 }
        }
      }
      $currentBranch = (git branch --list | Where { $_.StartsWith("*") }).Split(" ", 2)[1]
      if ($new -ne 0 -or $modified -ne 0 -or $deleted -ne 0) {
        $prompt = redConsoleText(" ($currentBranch +$new ~$modified -$deleted)")
      }
      else {
        $prompt = redConsoleText(" ($currentBranch)")
      }
    }
    $global:LASTEXITCODE = $lastExitCodeBeforePrompt
    "[$(greenConsoleText(get-location))$prompt]`r`nPWSH>"
  }