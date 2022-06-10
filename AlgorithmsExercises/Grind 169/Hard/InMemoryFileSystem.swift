//
//  InMemoryFileSystem.swift
//  AlgorithmsExercises
//  Created by hg on 05/07/2022.
//
//  |Design In-Memory File System|
//  |Hash Table|Design|
//  Design an in-memory file system to simulate the following functions:
//  ls:
//    Given a path in string format.
//    If it is a file path, return a list that only contains this file's name.
//    If it is a directory path, return the list of file and directory names in this directory.
//    Your output (file and directory names together) should be in lexicographic order.
//  mkdir:
//    Given a directory path that does not exist, you should make a new directory according to the path.
//    If the middle directories in the path don't exist either, you should create them as well.
//    This function has void return type.
//  addContentToFile:
//    Given a file path and file content in string format.
//    If the file doesn't exist, you need to create that file containing given content.
//    If the file already exists, you need to append given content to original content.
//    This function has void return type.
//  readContentFromFile:
//    Given a file path, return its content in string format.
//
//  Alt solution: Use RBT instead of Dictionary
//

import Foundation

fileprivate protocol FSNode {
    var name: String { get }
}

class InMemoryFileSystem {
    
    private class Folder: FSNode {
        var name: String
        var items: [String: FSNode]
        
        init(name: String, items: [String: FSNode]) {
            self.name = name
            self.items = items
        }
    }
    
    private class File: FSNode {
        var name: String
        var content: String
        
        init(name: String, content: String) {
            self.name = name
            self.content = content
        }
    }
    
    private let root: Folder
    
    init() {
        self.root = Folder(name: "/", items: [:])
    }
    
    func ls(_ path: String) -> [String] {
        let components = path.components(separatedBy: "/").dropFirst()
        var node: FSNode = root
        
        for component in components {
            if let folder = node as? Folder, let nextFolder = folder.items[component] {
                node = nextFolder
            }
            else {
                return [node.name]
            }
        }
        
        if let folder = node as? Folder {
            return folder.items.values.map { $0.name }.sorted()
        }
        
        return []
    }
    
    func mkdir(_ path: String) {
        let components = path.components(separatedBy: "/").dropFirst()
        var folder = root
        
        for component in components {
            if let nextNode = folder.items[component] {
                if let nextFolder = nextNode as? Folder {
                    folder = nextFolder
                }
                else {
                    return
                }
            }
            else {
                let newFolder = Folder(name: component, items: [:])
                folder.items[component] = newFolder
                folder = newFolder
            }
        }
    }
    
    func addContentToFile(_ filePath: String, content: String) {
        let components = filePath.components(separatedBy: "/").dropFirst()
        var node: FSNode = root
        
        for component in components {
            if let folder = node as? Folder, let nextNode = folder.items[component] {
                node = nextNode
            }
        }
        
        if let file = node as? File {
            file.content.append(content)
        }
        else if let folder = node as? Folder {
            let name = components.last!
            let newFile = File(name: name, content: content)
            folder.items[name] = newFile
        }
    }
    
    func readContentFromFile(_ filePath: String) -> String {
        let components = filePath.components(separatedBy: "/").dropFirst()
        var node: FSNode = root
        
        for component in components {
            if let folder = node as? Folder, let nextNode = folder.items[component] {
                node = nextNode
            }
        }
        
        if let file = node as? File {
            return file.content
        }
        
        return ""
    }
    
}
