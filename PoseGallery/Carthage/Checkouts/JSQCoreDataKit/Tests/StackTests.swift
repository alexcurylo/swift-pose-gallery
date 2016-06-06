//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQCoreDataKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQCoreDataKit
//
//
//  License
//  Copyright © 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import XCTest
import CoreData

import ExampleModel

@testable
import JSQCoreDataKit


class StackTests: XCTestCase {

    override func tearDown() {
        let model = CoreDataModel(name: modelName, bundle: modelBundle)
        _ = try? model.removeExistingStore()
        super.tearDown()
    }

    func test_ThatSQLiteStack_InitializesSuccessfully() {
        // GIVEN: a SQLite model
        let sqliteModel = CoreDataModel(name: modelName, bundle: modelBundle)

        // WHEN: we create a stack
        let factory = CoreDataStackFactory(model: sqliteModel)
        let result = factory.createStack()
        let stack = result.stack()!

        // THEN: it is setup as expected
        XCTAssertTrue(NSFileManager.defaultManager().fileExistsAtPath(sqliteModel.storeURL!.path!), "Model store should exist on disk")
        XCTAssertEqual(stack.mainContext.concurrencyType, NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        XCTAssertEqual(stack.backgroundContext.concurrencyType, NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
    }

    func test_ThatBinaryStack_InitializesSuccessfully() {
        // GIVEN: a binary model
        let binaryModel = CoreDataModel(name: modelName, bundle: modelBundle, storeType: .binary(NSURL(fileURLWithPath: NSTemporaryDirectory())))

        // WHEN: we create a stack
        let factory = CoreDataStackFactory(model: binaryModel)
        let result = factory.createStack()
        let stack = result.stack()!

        // THEN: it is setup as expected
        XCTAssertTrue(NSFileManager.defaultManager().fileExistsAtPath(binaryModel.storeURL!.path!), "Model store should exist on disk")
        XCTAssertEqual(stack.mainContext.concurrencyType, NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        XCTAssertEqual(stack.backgroundContext.concurrencyType, NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
    }

    func test_ThatInMemoryStack_InitializesSuccessfully() {
        // GIVEN: a in-memory model
        let inMemoryModel = CoreDataModel(name: modelName, bundle: modelBundle, storeType: .inMemory)

        // WHEN: we create a stack
        let factory = CoreDataStackFactory(model: inMemoryModel, options: nil)
        let result = factory.createStack()
        let stack = result.stack()!

        // THEN: it is setup as expected
        XCTAssertNil(inMemoryModel.storeURL, "Model store should not exist on disk")
        XCTAssertEqual(stack.mainContext.concurrencyType, NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        XCTAssertEqual(stack.backgroundContext.concurrencyType, NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
    }

    func test_ThatChildContext_IsCreatedSuccessfully_WithDefaultParameters() {
        // GIVEN: a model and stack
        let model = CoreDataModel(name: modelName, bundle: modelBundle)
        let factory = CoreDataStackFactory(model: model)
        let result = factory.createStack()
        let stack = result.stack()!

        // WHEN: we create a child context
        let childContext = stack.childContext()

        // THEN: it is initialized as expected
        XCTAssertEqual(childContext.name, "JSQCoreDataKit.CoreDataStack.context.main.child")
        XCTAssertEqual(childContext.parentContext!, stack.mainContext)
        XCTAssertEqual(childContext.concurrencyType, NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        XCTAssertEqual(childContext.mergePolicy.mergeType, NSMergePolicyType.MergeByPropertyObjectTrumpMergePolicyType)
    }

    func test_ThatChildContext_IsCreatedSuccessfully_WithCustomParameters() {
        // GIVEN: a model and stack
        let model = CoreDataModel(name: modelName, bundle: modelBundle)
        let factory = CoreDataStackFactory(model: model)
        let result = factory.createStack()
        let stack = result.stack()!

        // WHEN: we create a child context
        let childContext = stack.childContext(concurrencyType: .PrivateQueueConcurrencyType, mergePolicyType: .ErrorMergePolicyType)

        // THEN: it is initialized as expected
        XCTAssertEqual(childContext.name, "JSQCoreDataKit.CoreDataStack.context.background.child")
        XCTAssertEqual(childContext.parentContext!, stack.backgroundContext)
        XCTAssertEqual(childContext.concurrencyType, NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        XCTAssertEqual(childContext.mergePolicy.mergeType, NSMergePolicyType.ErrorMergePolicyType)
    }

    func test_Stack_Description() {
        let model = CoreDataModel(name: modelName, bundle: modelBundle)
        let factory = CoreDataStackFactory(model: model)
        let result = factory.createStack()
        let stack = result.stack()!
        print(stack)
    }
    
}
