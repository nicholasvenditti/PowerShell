Write-Host "Greetings, $Env:USERNAME!"
Write-Host "Whatever number you start with, I will morph it into 10 through the powers of mathematics!`n"

[Int]$original_number = Read-Host -Prompt "Type a number, any number"
$final_number = $original_number

$final_number = $final_number + 5
$final_number *= 3
$final_number -= 15
$final_number /= $original_number
$final_number += 7

$number_is_10 = $final_number -eq 10
Write-Host "The number is equal to 10: $number_is_10."
Write-Host "The final number is $final_number."
