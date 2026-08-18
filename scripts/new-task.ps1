param(
  [Parameter(Mandatory = $true)]
  [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9._-]*$')]
  [string]$TaskId,

  [Parameter(Mandatory = $true)]
  [ValidatePattern('^[a-z0-9][a-z0-9-]*$')]
  [string]$TaskSlug
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$taskDir = Join-Path $root "tasks/active/$TaskId"

if (Test-Path $taskDir) {
  throw "Task already exists: $taskDir"
}

New-Item -ItemType Directory -Path $taskDir -Force | Out-Null
$templateDir = Join-Path $root 'tasks/templates'

$templateNames = @('brief.md', 'plan.md', 'result.md', 'review.md')

$templateNames | ForEach-Object {
  $templatePath = Join-Path $templateDir $_
  $content = Get-Content -Raw -LiteralPath $templatePath
  $content = $content.Replace('{{TASK_ID}}', $TaskId).Replace('{{TASK_SLUG}}', $TaskSlug)
  Set-Content -LiteralPath (Join-Path $taskDir $_) -Value $content -NoNewline
}

Write-Output "Created task $TaskId at $taskDir"
