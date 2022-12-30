//
//  Local Server.swift
//  Day-12-Local Server
//
//  Created by Apple  on 27/12/22.
//

import PlaygroundSupport
import Kitura

struct ToDo: Codable {
    var id: String
    var title: String
    var completed: Bool
}


struct localServer{
    
    let router = Router()

    // Create a to-do item
    router.post("/todos") { request, response, next in
        guard let body = request.body else {
            try response.status(.badRequest).end()
            return
        }

        do {
            let todo = try body.decode(ToDo.self)
            // Save the to-do item to a database or file
            try response.status(.created).end()
        } catch {
            try response.status(.badRequest).end()
        }

        next()
    }

    // Read all to-do items
    router.get("/todos") { request, response, next in
        // Retrieve the to-do items from the database or file
        let todos = [ToDo]()
        try response.send(json: todos).end()

        next()
    }

    // Read a single to-do item
    router.get("/todos/:id") { request, response, next in
        guard let id = request.parameters["id"] else {
            try response.status(.badRequest).end()
            return
        }

        // Retrieve the to-do item from the database or file
        let todo = ToDo()
        try response.send(json: todo).end()

        next()
    }

    // Update a to-do item
    router.patch("/todos/:id") { request, response, next in
        guard let id = request.parameters["id"], let body = request.body else {
            try response.status(.badRequest).end()
            return
        }

        do {
            let updates = try body.decode(ToDoUpdates.self)
            // Update the to-do item in the database or file
            try response.status(.noContent).end()
        } catch {
            try response.status(.badRequest).end()
        }

        next()
    }

    // Delete a to-do item
    router.delete("/todos/:id") { request, response, next in
        guard let id = request.parameters["id"] else {
            try response.status(.badRequest).end()
            return
        }

        // Delete the to-do item from the database or file
        try response.status(.noContent).end()

        next()
    }

}
