# Authentication of Gmail
$Username = "notification.email@gmail.com"
$Password= "password"

$emailDestination = "Destination of send email" 
$date =  Get-Date -format "dd.MM.yyyy HH:mm"
$msg = "Body of email."
function Send-ToEmail([string]$email){
    $message = new-object Net.Mail.MailMessage
    $message.From = $Username
    $message.To.Add($email)
    $message.Subject = "Email title"
    $message.Body = "
    Date: $date
    $msg    
    "
    $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com","587")
    $smtp.EnableSSL = $true
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)
    $smtp.send($message)
 }
Send-ToEmail -email $emailDestination
