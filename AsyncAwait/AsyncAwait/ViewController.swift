//
//  ViewController.swift
//  AsyncAwait
//
//  Created by Prabhat Pankaj on 22/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            await process()
        }
    }

    // ASYNC AWAIT

    //Async stands for asynchronous and can be seen as a method attribute making it clear that a method performs asynchronous work

    //Await is the keyword to be used for calling async methods.
    // MainActor

    // will help you make sure your UI is always updated on the main thread.
    // TASK
    //A unit of asynchronous work.

    func fetchNumbers() async -> [Int] {
        return [2,3,4,6,78,89]
    }
    
    func fetchNumber() async -> Int {
        Int.random(in: 1...10)
    }

    func calculateTotal(for numbers: [Int]) async -> Int {
        let total = numbers.reduce(0, +)
        return total
    }

    func printOutput(output: Int) async -> String {
         return "The output is \(output)"
    }

    func process() async {
        //async let firstPhoto = downloadPhoto(named: photoNames[0])
// Calling Asynchronous Functions in Parallel. To call an asynchronous function and let it run in parallel with code around it, write async in front of let when you define a constant, and then write await each time you use the constant.
        async let number1 =  fetchNumber()
        async let number2 =  fetchNumber()
        async let number3 =  fetchNumber()
        let numbers = await [number1, number2, number3]

        //let numbers = await fetchNumbers()
        print(numbers)
        let total = await calculateTotal(for: numbers)
        print(total)
        let output = await printOutput(output: total)
        print(output)
        
    }
}

