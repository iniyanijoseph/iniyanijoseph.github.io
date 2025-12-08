#{
  let val = read("input01.txt")
  let seperate(x) = (direction: x.slice(0, 1), delta: int(x.slice(1)))
  
  let steps = val.split().map(seperate)
  linebreak()

  {let position = 50
  let count = 0
  for step in steps {
    let positive = position > 0
    let prevposition = position
    if step.direction == "L" {
      position -= step.delta
    } else {
      position += step.delta
    }

    position = calc.rem-euclid(position, 100)
    
    if position == 0{
      count += 1
    }
  }
  linebreak()
  [#count]
  }

  {let position = 50
  let count = 0
  for step in steps {
    let positive = position > 0
    let prevposition = position
    if step.direction == "L" {
      for _ in range(step.delta){
        position -= 1
        position = calc.rem-euclid(position, 100)
        if position == 0 {count += 1}
      }
    } else {
      for _ in range(step.delta){
        position += 1
        position = calc.rem-euclid(position, 100)
        if position == 0 {count += 1}
      }
    }
  }
  linebreak()
  [#count]
}
}
