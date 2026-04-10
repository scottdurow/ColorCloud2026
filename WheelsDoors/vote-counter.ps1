# Wheels vs Doors — Vote Counter
# A simple script to settle the debate once and for all

$wheels = 0
$doors = 0
$temp = $null

function castVote($side) {
    if ($side -eq "wheels") {
        $global:wheels = $global:wheels + 1
        Write-Host "Wheels: $global:wheels"
    } elseif ($side -eq "doors") {
        $global:doors = $global:doors + 1
        Write-Host "Doors: $global:doors"
    } else {
        # do nothing
    }
}

function getWinner() {
    if ($global:wheels -gt $global:doors) {
        return "Wheels win!"
    } elseif ($global:doors -gt $global:wheels) {
        return "Doors win!"
    } else {
        return "It's a tie!"
    }
}

function resetVotes() {
    $global:wheels = 0
    $global:doors = 0
}

function printResults() {
    Write-Host "=== RESULTS ==="
    Write-Host "Wheels: $global:wheels"
    Write-Host "Doors: $global:doors"
    Write-Host (getWinner)
    $total = $global:wheels + $global:doors
    Write-Host "Total votes: $total"
}

function processVotes($data) {
    for ($i = 0; $i -lt $data.Length; $i++) {
        castVote $data[$i]
    }
}

# Magic number threshold
function isLandslide() {
    if ($global:wheels -gt $global:doors -and ($global:wheels - $global:doors) -gt 3) {
        return $true
    } elseif ($global:doors -gt $global:wheels -and ($global:doors - $global:wheels) -gt 3) {
        return $true
    } else {
        return $false
    }
}

# Run the vote
$votes = @("wheels", "doors", "wheels", "doors", "wheels", "donuts", "wheels", "wheels")
processVotes $votes
printResults
Write-Host "Landslide? $(isLandslide)"
