brute_force_protection.ps1
# =================================================================
# Project: Brute Force Protection System
# Prepared by: Yaqoob Haider & Safi Ullah Khan
# =================================================================

Clear-Host
$line = "===================================================="
Write-Host $line -ForegroundColor Cyan
Write-Host "    BRUTE FORCE PROTECTION SYSTEM - ACTIVE DEPLOYMENT    " -ForegroundColor Cyan
Write-Host $line -ForegroundColor Cyan

# Define Secure Admin Credentials
$AdminUser = "admin"
$AdminPass = "1234"

# Policy Configuration
$MaxAttempts = 3
$Attempts = 0

# Authentication Loop
while ($Attempts -lt $MaxAttempts) {
    $Remaining = $MaxAttempts - $Attempts
    Write-Host "`n[Attempt $($Attempts + 1) of $MaxAttempts] - $Remaining attempts remaining." -ForegroundColor Yellow
    
    $User = Read-Host "Enter Username"
    $Pass = Read-Host "Enter Password"

    # Credential Verification
    if ($User -eq $AdminUser -and $Pass -eq $AdminPass) {
        Write-Host "`n[SUCCESS] Login Successful! Welcome back, $AdminUser." -ForegroundColor Green
        break
    } else {
        $Attempts++
        if ($Attempts -lt $MaxAttempts) {
            Write-Host "[WARNING] Invalid Credentials! Please try again." -ForegroundColor Magenta
        }
    }
}

# Account Lockout Phase
if ($Attempts -eq $MaxAttempts) {
    Write-Host "`n$line" -ForegroundColor Red
    Write-Host "CRITICAL ALERT: 3 FAILED ATTEMPTS DETECTED!" -ForegroundColor Red
    Write-Host "SECURITY ACTION: YOUR ACCOUNT IS NOW LOCKED." -ForegroundColor Red
    Write-Host "$line" -ForegroundColor Red
}
