# Character Actions
$attack = {
    param($target) 
    $this.Name + ", a " + $this.Class + ", attacks " + $target.Name + ", a " + $target.Class + "!"
    $target.Damage($this.Attack_Level)
}

$damage = {
    param($damage_value)
    $this.Health -= $damage_value
    $this.Name + "'s health is now " + $this.Health + "`n"
}


# Add your statements below

[string[]]$classes = "Fighter", "Magician","Ranger"

$player = New-Object -TypeName PSCustomObject
$player | Add-Member -MemberType NoteProperty -Name "Name" -Value "Nicholas"
$player | Add-Member -MemberType NoteProperty -Name "Health" -Value 25
$player | Add-Member -MemberType NoteProperty -Name "Attack_Level" -Value 5
$player | Add-Member -MemberType NoteProperty -Name "Class" -Value $classes[0]

$enemy_1 = [PSCustomObject]@{
  Name = "Enemy #1"
  Health = 10
  Attack_Level = 4
  Class = $classes[1]
}

$enemy_2 = [PSCustomObject]@{
  Name = "Enemy #2"
  Health = 15
  Attack_Level = 3
  Class = $classes[2]
}

$characters = $player, $enemy_1, $enemy_2
$characters.ForEach({ 
  $PSItem | Add-Member -MemberType ScriptMethod -Name "Attack" -Value {
    param($target) 
    $this.Name + ", a " + $this.Class + ", attacks " + $target.Name + ", a " + $target.Class + "!"
    $target.Damage($this.Attack_Level)
    }
  $PSItem | Add-Member -MemberType ScriptMethod -Name "Damage" -Value {
    param($damage_value)
    $this.Health -= $damage_value
    $this.Name + "'s health is now " + $this.Health + "`n"
    }
  })

# Add your statements above

# Sample Battle Scenario
Write-Host Hello, $player.Name!
Write-Host There are ($characters.Count - 1) enemies!
Write-Host Start round!`n
$player.Attack($enemy_1)
$enemy_1.Attack($player)
$enemy_2.Attack($player)
$player.Attack($enemy_2)
Write-Host End round!
