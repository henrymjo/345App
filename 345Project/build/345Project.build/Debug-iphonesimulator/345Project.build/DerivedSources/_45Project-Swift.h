// Generated by Apple Swift version 4.1.2 (swiftlang-902.0.54 clang-902.0.39.2)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import ObjectiveC;
@import UIKit;
@import CoreData;
@import Foundation;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="_45Project",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif


/// AlertCenter class deals with all things relating to notifications and alerts.
/// TODO: give alerts specific indexes so we can remove them if the task gets deleted
/// <ul>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project11AlertCenter")
@interface AlertCenter : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC10_45Project11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions SWIFT_WARN_UNUSED_RESULT;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC10_45Project11CustomCells")
@interface CustomCells : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;
@class UIButton;
@class UITextField;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC10_45Project7NewItem")
@interface NewItem : UIViewController
@property (nonatomic, strong) IBOutlet UIView * _Null_unspecified background;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified UrgencyButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified ReminderButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified TimeButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified AddTaskButton;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified taskName;
/// On load, set the urgency colour to the colour selected.
/// Also, if we are editing a task, change the “Add Task” button to “Edit Task”
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)viewDidLoad;
/// update task description when text is changed in the text box
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)textEditingDidChange:(UITextField * _Nonnull)sender;
- (void)didReceiveMemoryWarning;
/// Conform new task/ confirm edit of existing task.
/// Saves all variables to CoreData as a Task. Or updates existing variables of a CoreData task.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)addNewTask:(id _Nonnull)sender;
/// 4 possible segues from here.
/// Urgency page, time page, reminder page or going back to the initial task view page.
/// Variables get passed between pages so that if we revisit a page to change the last chosen value,
/// The page remembers that value and the counters will continue on from it.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIStepper;

SWIFT_CLASS("_TtC10_45Project22ReminderViewController")
@interface ReminderViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified dayLabel;
@property (nonatomic, weak) IBOutlet UIStepper * _Null_unspecified stepper;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified confirmButton;
- (void)viewDidLoad;
/// Finds how many days from now the date was previously set to.
/// If it hasn’t already been set the days from now will be 0, the default value to show.
/// Also give the stepper value that number of days, otherwise changing the days will reset back to 0.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
/// The day has been increased/decreased using the buttons.
/// Update the the label and the reminderDate.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)daysStepped:(id _Nonnull)sender;
/// Prepare for segue back to newItem.
/// Update all variables.
/// *
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSEntityDescription;
@class NSManagedObjectContext;

SWIFT_CLASS_NAMED("Task")
@interface Task : NSManagedObject
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end


@interface Task (SWIFT_EXTENSION(_45Project))
@property (nonatomic, copy) NSDate * _Nullable date;
@property (nonatomic) float time;
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, copy) NSString * _Nullable urgency;
@end

@class UISlider;

/// Class controls the updating and presenting of the time taken to perform the given task.
/// Uses a scrollWheel to adjust time.
/// <ul>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project18TimeViewController")
@interface TimeViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified confirmButton;
@property (nonatomic, weak) IBOutlet UISlider * _Null_unspecified scrollWheel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified hoursIcon;
/// Called when scroll wheel is moved.
/// sets the time and displays the number moved to.
/// @param sender the scrollWheel
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)scrolled:(UISlider * _Nonnull)sender;
/// sets time to display the previously chosen time when entering back into the controller.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
/// Only one segue to prepare for out of this controller, back to the newItem controller.
/// Update all variables and perform segue.
/// *
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10_45Project17UrgencyController")
@interface UrgencyController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified highButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified medButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified lowButton;
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified background;
/// All three of these functions are almost the same.
/// If a button is pressed, perform a segue using that buttons identifier.
/// *
- (IBAction)HighButton:(UIButton * _Nonnull)sender;
- (IBAction)MedButton:(UIButton * _Nonnull)sender;
- (IBAction)LowButton:(UIButton * _Nonnull)sender;
/// Load the view *
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
/// we are only segueing to once controller so we update all variables first.
/// Update the urgency variable depending on which button what clicked.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


/// Three classes identical other than a unique identifier is associated with each
/// <ul>
///   <li>
///     class. This identifier is used to adjust backgrounds later on.
///   </li>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project8highCell")
@interface highCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified taskName;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10_45Project7lowCell")
@interface lowCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified taskName;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10_45Project10mediumCell")
@interface mediumCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified taskName;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;

SWIFT_CLASS("_TtC10_45Project18taskListController")
@interface taskListController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified myTableView;
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified background;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified newTaskButton;
/// add task button is clicked, perform segue with identifier “newTask”
/// *
- (IBAction)addTask:(UIButton * _Nonnull)sender;
/// Sets the number of rows in the tableView to the number of tasks in our coreData storage.
/// *
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (void)viewDidAppear:(BOOL)animated;
- (IBAction)nightMode:(UIButton * _Nonnull)sender;
/// This goes through each tableViewCell and returns the height of each cell by looking at the index
/// of the task and getting its ‘time’ value. The bigger the time, the taller the cell.
/// \code
/// For some reason this method never gets called, although it should in the tableset up or reloadData().
/// *
///
/// \endcode
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
/// cellForRow at goes through each cell in the table and assigns the title and chooses which
/// customCell to use depending on the priority of the task.
/// Cells are rounded and I have used a small hack to give a gap between the cells by making the border
/// colour white. This makes it looks like they’re seperated. If we change the background colour
/// cell.layer.borderColor will need to change too.
/// *
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
/// Method for deleting tasks.
/// Deletes the task from CoreData and deletes the reminder
/// @param tableView is the tableView on the controller
/// @param editingStyle is a left swipe on the task in the table view.
/// @param indexPath is the index of the task in the tableView
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
/// If an item is selected, make a segue to the newItem page with the identifier “editTask”
/// This means we use the same newItem controller but it doesn’t create a new item, just edits
/// the selected one.
/// @param tableView is the tbaleView in the controller.
/// @param indexPath is the index of the task selected.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
/// Method does setup for the table when the tableView controller is loaded.
/// Fetches from core data and reloads data.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)viewDidLoad;
/// Once view did appear, reload data.
/// Also request to send alerts if not done so already.
/// *
- (void)didReceiveMemoryWarning;
/// Two possible segues from this controller.
/// We either want to create a new item or edit an existing item.
/// If editing, set all variables to the selected index. Change “Add Task” button to “Edit Task”
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface taskListController (SWIFT_EXTENSION(_45Project)) <NSFetchedResultsControllerDelegate>
- (void)controllerWillChangeContent:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller;
- (void)controllerDidChangeContent:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller;
- (void)controller:(NSFetchedResultsController<id <NSFetchRequestResult>> * _Nonnull)controller didChangeObject:(id _Nonnull)anObject atIndexPath:(NSIndexPath * _Nullable)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath * _Nullable)newIndexPath;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
