# flutter_app_state_management_riverpod

Flutter project with Riverpod State Management 

## Terms and understanding


In Flutter Riverpod, both Provider and StateProvider are used to manage state in an application. However, there is a difference in how they manage state:


- **Provider:** It is a simple way to expose a value to the rest of the application. It is suitable for cases where the value does not need to be mutable or where the value does not depend on other state. Once a provider value is created, it remains immutable throughout the life of the app.

- **StateProvider:** It is used when you need to expose a value that can change over time. It creates a state object that can be modified by the application. When the state object changes, all the widgets that depend on it are automatically rebuilt. A StateProvider can be created with an initial value and a function that can modify the value.

- **StateNotifierProvider:** A StateNotifierProvider is used to expose a StateNotifier to the widget tree. A StateNotifier is a class that extends the StateNotifier class from the Riverpod library and provides a way to manage a piece of state. The StateNotifierProvider is similar to the StateProvider, but it provides a way to update the state by calling methods on the StateNotifier.


For example, if you want to manage the count of items in a shopping cart, you can use a StateProvider because the count can change over time as items are added or removed from the cart. On the other hand, if you want to expose a constant value, like the name of the app, you can use a Provider.

In summary, Provider is used for immutable values while StateProvider is used for mutable values that can change over time.
 
