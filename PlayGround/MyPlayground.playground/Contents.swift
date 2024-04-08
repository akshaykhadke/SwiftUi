import UIKit

var greeting = "Hello, playground"
let movie = """
hi
how
are
you
"""
let filename = "paris.jpg"

print(greeting.uppercased())
print(filename.hasSuffix(".jpg"))
print(filename.hasPrefix("par"))

let dict = ["History":100,"math": 60,"test":"kkjd"] as [String : Any]

let result = dict["english",default: 0]

let amount = Int(102.94)

enum Mood {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

Mood.happy


enum Mood1: Int {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

Mood1.happy
Mood1.sleepy.rawValue

enum Delay {
    case seconds(Int)
    case milliseconds(Int)
    case microseconds(Int)
    case nanoseconds(Int)
}

Delay.seconds(1)
