//
//  AppDelegate.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder
{
    var window: UIWindow?

    // store must be initialized when app is launched.
    private(set) var store: SyncManagerModel

    override init() {
        // initialize store
        var env: DomainAppConfiguration = .dev
        // get env from info plist and assign
        if let envString = Bundle.main.object(forInfoDictionaryKey: "ENV") as? String,
            let uEnv = DomainAppConfiguration(rawValue: envString)
        {
            env = uEnv
        }
        store = SyncManagerModel(with : env)
        super.init()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HeadyAssessment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data stack
       
       var context: NSManagedObjectContext {
           return persistentContainer.viewContext
       }
       
     
       // MARK: - Core Data Saving support
       
      
      func fetchUsers() throws -> [SearchHistory] {
          let context = persistentContainer.viewContext
          let historie = try! context.fetch(SearchHistory.fetchRequest() as NSFetchRequest<SearchHistory>)
          return historie
      }
       
       func insertRecored(itemname: String, timestamp:Int64) {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return
           }
           // Check userid value & use default guest user id = -101
           let userid = "-101"
           let managedContext = appDelegate.persistentContainer.viewContext
           
           /*
            An NSEntityDescription object is associated with a specific class instance
            Class
            NSEntityDescription
            A description of an entity in Core Data.
            
            Retrieving an Entity with a Given Name here SearchHistory
            */
           let entity = NSEntityDescription.entity(forEntityName: "SearchHistory",
                                                   in: managedContext)!
           
           let historie = NSManagedObject(entity: entity,
                                          insertInto: managedContext)
         
           historie.setValue(itemname, forKeyPath: "itemname")
           historie.setValue(userid, forKeyPath: "userid")
           historie.setValue(timestamp, forKeyPath: "timestamp")
           
         
           do {
               try managedContext.save()
             
           } catch let error as NSError {
               print("Could not save. \(error), \(error.userInfo)")
           }
       }
       
       func fetchRecordsForEntity(_ entity: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [NSManagedObject] {
           
           // Check userid value & use default guest user id = -101
           let userid = "-101"

           // Create Fetch Request
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
           
        fetchRequest.predicate = NSPredicate(format: "userid = %@", userid)
           
           // Helpers
           var result = [NSManagedObject]()
           
           do {
               // Execute Fetch Request
               let records = try managedObjectContext.fetch(fetchRequest)
               
               if let records = records as? [NSManagedObject] {
                   result = records
               }
               
           } catch {
               print("Unable to fetch managed objects for entity \(entity).")
           }
           
           return result
       }
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
        -> Bool
    {
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}




