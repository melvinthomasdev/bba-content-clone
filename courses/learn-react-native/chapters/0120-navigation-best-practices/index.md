## Use constants for screen names

Always use constants for screen names instead of using hard-coded values. For
example, here for each `Stack.Screen` we have their names defined in a constant
`screenNames`.

```javascript
const screenNames = {
  Home: "Home",
  Profile: "Profile",
};
return (
  <NavigationContainer>
    <Stack.Navigator>
      <Stack.Screen name={screenNames.Home} component={HomeScreen} />
      <Stack.Screen name={screenNames.Profile} component={ProfileScreen} />
    </Stack.Navigator>
  </NavigationContainer>
);
```

## Setting tab bar icons

Custom Bottom Tab Icons can be added from the `BottomTab.Navigator` instead of
each `BottomTab.Screen` to avoid code duplication.

For example, here we have assigned an `Icon` to every `BottomTab.Screen`
individually.

```javascript
return (
  <BottomTab.Navigator>
    <BottomTab.Screen
      options={{
        tabBarIcon: () => <Icon name="ticket-line" />,
      }}
      name="HelpDesk"
      component={TicketsIndexScreen}
    />
    <BottomTab.Screen
      options={{
        tabBarIcon: () => <Icon name="chat-3-line" />,
      }}
      name="ChatScreen"
      component={ChatConversationScreen}
    />
    <BottomTab.Screen
      options={{
        tabBarIcon: () => <Icon name="notification-4-line" />,
      }}
      name="Notification"
      component={NotificationScreen}
    />
    <BottomTab.Screen
      options={{
        tabBarIcon: () => <Icon name="user-3-line" />,
      }}
      name="ProfileScreen"
      component={ProfileScreen}
    />
  </BottomTab.Navigator>
);
```

But here, we create an object with the `Icon` labels and assign them to the
screens based on the `route.name` from the `BottomTab.Navigator` itself.

```javascript
const BottomNavAssetNames = {
  TicketScreen: { icon: "ticket-line" },
  ChatScreen: { icon: "chat-3-line" },
  NotificationScreen: { icon: "notification-4-line" },
  ProfileScreen: { icon: "user-3-line" },
};

return (
  <BottomTab.Navigator
    screenOptions={({ route }) => ({
      tabBarIcon: ({ color, size, focused }) => (
        <Icon name={BottomNavAssetNames[route.name].icon} />
      ),
    })}
  >
    <BottomTab.Screen name="TicketScreen" component={TicketsIndexScreen} />
    <BottomTab.Screen name="ChatScreen" component={ChatConversationScreen} />
    <BottomTab.Screen
      name="NotificationScreen"
      component={NotificationScreen}
    />
    <BottomTab.Screen name="ProfileScreen" component={ProfileScreen} />
  </BottomTab.Navigator>
);
```
