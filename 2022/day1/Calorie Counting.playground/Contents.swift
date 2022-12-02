import UIKit

func caloriesOfElfWithMostLineByLine() -> Int {
    var mostCalories: Int = 0
    
    let filePath = Bundle.main.path(forResource:"input", ofType: "txt")
    
    guard let file = freopen(filePath, "r", stdin) else {
        return 0
    }
    
    defer {
        fclose(file)
    }
    read
    var tempCalorieCounter: Int = 0
    while let line = readLine() {
        guard let calorieValue = Int(line) else {
            if tempCalorieCounter > mostCalories {
                mostCalories = tempCalorieCounter
            }
            
            tempCalorieCounter = 0
            continue
        }
        
        tempCalorieCounter += calorieValue
    }
    
    return mostCalories
}

func caloriesOfElfWithMostReduce() -> Int {
    let filePath = Bundle.main.path(forResource:"input", ofType: "txt")
    
    let result = Result {
        try String(contentsOfFile: filePath.unsafelyUnwrapped, encoding: .utf8)
    }
    
    guard let input = try? result.get() else {
        return 0
    }
    
    return input.components(
        separatedBy: "\n\n"
    ).compactMap({
        return $0.components(
            separatedBy: "\n"
        ).compactMap({
            Int($0)
        }).reduce(0, +)
        
    }).max() ?? 0
    
}

func sumOfTopThree() -> Int {
    let filePath = Bundle.main.path(forResource:"input", ofType: "txt")
    
    let result = Result {
        try String(contentsOfFile: filePath.unsafelyUnwrapped, encoding: .utf8)
    }
    
    guard let input = try? result.get() else {
        return 0
    }
    
    return input.components(
        separatedBy: "\n\n"
    ).compactMap({
        return $0.components(
            separatedBy: "\n"
        ).compactMap({
            Int($0)
        }).reduce(0, +)
        
    }).sorted(
        by: {$0 > $1}
    )[0...2].reduce(0, +)
}

print(caloriesOfElfWithMostLineByLine())

print(caloriesOfElfWithMostReduce())

print(sumOfTopThree())
