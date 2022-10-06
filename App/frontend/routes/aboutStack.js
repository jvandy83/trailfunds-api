import { createStackNavigator } from "@react-navigation/stack";
import { AboutPage } from "../pages/AboutUs";

const Stack = createStackNavigator();

const aboutStackNav = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
      }}
    >
      <Stack.Screen name="AboutPage" component={AboutPage} />
    </Stack.Navigator>
  );
};

export { aboutStackNav };