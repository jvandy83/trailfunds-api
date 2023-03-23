
import React, {useState, useEffect} from 'react';
import { StyleSheet, View, Text } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { LinearGradient } from 'expo-linear-gradient'
import { TouchableOpacity } from 'react-native-gesture-handler';
import refill from '../styles/refillStyles';

let STORAGE_KEY = '@user_input';

const WalletRefills = ({navigation}) => {
    const [input, setInput] = useState();

    useEffect(() => {
      readData();      
      },[]);
    
  
    const saveData = async (value) => {
      try {
        let temp = value.toString();
        await AsyncStorage.setItem(STORAGE_KEY, temp)
        alert('Data successfully saved')
      } catch (e) {
        alert('Failed to save the data to the storage')
      }
    }
  
    const readData = async () => {
      await AsyncStorage.getItem(STORAGE_KEY).then(value => {
        if(value !== null) {
          value = parseInt(value)
          setInput(value);   
        }
      })
    }

    const addFunds = async (value) => {
      let temp = parseInt(input) + value
      saveData(temp)
      setInput(temp);
    };
    
    return (
      <LinearGradient colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']} style={profile.background}>
        <View style={refill.container}>
          <View style={refill.panel}>
          <Text style={refill.title}>{input}</Text>
          <Text style={refill.text}>Add to your wallet</Text>
          <TouchableOpacity onPress={() => {
            addFunds(3);
            navigation.navigate("My Wallet");
            }} style={refill.button}>
            <Text style={refill.buttonText}>$3</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => { 
            addFunds(5);
            navigation.navigate("My Wallet");
            }} style={refill.button}>
            <Text style={refill.buttonText}>$5</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={() => { addFunds(10)
            navigation.navigate("My Wallet");
            }} style={refill.button}>
            <Text style={refill.buttonText}>$10</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={readData} style={refill.button}>
            <Text style={refill.buttonText}>Show</Text>
          </TouchableOpacity>
          </View>
        </View>
      </LinearGradient>
    );
  
  };
  
export default WalletRefills;