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
@import Foundation;
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

@class UITextField;
@class UIButton;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC10_45Project7NewItem")
@interface NewItem : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified TaskTextField;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified UrgencyButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified ReminderButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified TimeButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified AddTaskButton;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIDatePicker;
@class UISwitch;
@class UISegmentedControl;

/// Visualisation of the current task and be able to make edits to it.
/// <ul>
///   <li>
///     Needs to be 10x more visually appealing for Mainly Accessibility issues and also general consumpion
///   </li>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project17NewItemController")
@interface NewItemController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified displayDateChosen;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified input;
@property (nonatomic, weak) IBOutlet UIDatePicker * _Null_unspecified datePicker;
@property (nonatomic, weak) IBOutlet UISwitch * _Null_unspecified reminderSwitch;
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified repeatTask;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified ShowDateSelected;
/// <ul>
///   <li>
///     Shows the reminder time as a String below the reminder switch, also the current date chosen.
///   </li>
///   <li>
///     Mainly for visually impaired users
///   </li>
///   <li>
///     to be able to listen to the time the task and the reminder is set for for by swiping over the string.
///   </li>
///   <li>
///     Updates as the date picker date is changed.
///   </li>
///   <li>
///   </li>
/// </ul>
- (IBAction)myDateView:(UIDatePicker * _Nonnull)sender;
/// <ul>
///   <li>
///     Alters the reminder String if the reminder button is flicker on or off.
///   </li>
///   <li>
///     displays 15 minutes before the task time if on, or “No reminder” if off
///   </li>
///   <li>
///   </li>
/// </ul>
- (IBAction)remindersToggled:(id _Nonnull)sender;
/// <ul>
///   <li>
///     Action method for when the Add Task button is clicked.
///   </li>
///   <li>
///     Assigns all fields to variables and calls the Task manager to add to the task array.
///   </li>
///   <li>
///   </li>
/// </ul>
- (IBAction)addTask:(UIButton * _Nonnull)sender;
/// <ul>
///   <li>
///     View has loaded, calls super method.
///   </li>
///   <li>
///   </li>
/// </ul>
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
/// Called once the view has appeared instead of loaded.
/// * Sets the Date Picker to be set to the current date and time.
/// * Makes sure you can’t create a task in the past by setting minimum date to current date
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)viewDidAppear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


/// Edit task page controller.
/// Shows all currect settings for a task and makes them alterable
/// UI should be improved for Accessibily purposes.
/// <ul>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project22TaskEditViewController")
@interface TaskEditViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Nullable taskName;
@property (nonatomic, weak) IBOutlet UISwitch * _Null_unspecified InitialReminder;
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified InitialRepeat;
@property (nonatomic, weak) IBOutlet UIDatePicker * _Null_unspecified datePicked;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified showDateSelected;
/// Called if the date in the date picker wheel is changed.
/// Updates the date variable and shows the current current date chosen below the picker
/// (For disability purposes)
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)datePicker:(UIDatePicker * _Nonnull)sender;
/// Called if reminders switch is toggled
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)reminderSwitch:(id _Nonnull)sender;
/// Called if the repeats selector (Once, daily, weekly) is changed
/// <ul>
///   <li>
///   </li>
/// </ul>
- (IBAction)repeatSelector:(UISegmentedControl * _Nonnull)sender;
/// Called when “Edit task” button is pressed,
/// tests to see if any details have changed,
/// if yes then update them and segue back to task list
/// *
- (IBAction)editTask:(UIButton * _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
/// When the view appears set all the correct values for that task
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)viewDidAppear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


/// TaskManager class deals with all task actions:
/// <ul>
///   <li>
///     Creating, Deleting, Editing and getting task values.
///   </li>
///   <li>
///     accessed through taskMgr instance
///   </li>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project11TaskManager")
@interface TaskManager : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIStoryboardSegue;

SWIFT_CLASS("_TtC10_45Project17UrgencyController")
@interface UrgencyController : UIViewController
- (IBAction)HighButton:(UIButton * _Nonnull)sender;
- (IBAction)MedButton:(UIButton * _Nonnull)sender;
- (IBAction)LowButton:(UIButton * _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class UITableViewCell;

/// ViewController class controls the presentation of the task list on the main page.
/// Has a table view to control selections.
/// sends data to edit task page to show correct fields
/// TODO:
/// <ul>
///   <li>
///     Cell’s need to be designed to be bigger and clearer in the future for accessibity concerns.
///   </li>
///   <li>
///     Colour scheme should be alterable for accessibilty concerns.
///   </li>
/// </ul>
/// <ul>
///   <li>
///   </li>
/// </ul>
SWIFT_CLASS("_TtC10_45Project14ViewController")
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified myTableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
/// Fill in cell text label with text
/// Could be filled with much more to design cells
/// <ul>
///   <li>
///   </li>
/// </ul>
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
/// Implements ability to delete tasks.
/// \code
///  *  Complete removal of the alert should also be called here
/// *
///
/// \endcode
- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
/// Called when a cell is tapped.
/// reference using indexPath.row to give the index of the task in the TaskManager array.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
/// Data gets sent to the edit conroller so they can be seen and altered correctly.
/// <ul>
///   <li>
///   </li>
/// </ul>
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
/// Refresh the tableView to show updated tasks when this controller is opened *
- (void)viewDidAppear:(BOOL)animated;
/// Request to send alerts when the app opens for the first time *
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
