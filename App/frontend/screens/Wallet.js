import React from 'react';
import { Text, View, Pressable } from 'react-native';

import { PageContainer } from '../components/layout/PageContainer';

import { PrimaryButton } from '../styles/frontendStyles';

import { defaults } from '../styles/frontendStyles';
import wallet from '../styles/walletStyles';

export const Wallet = ({ navigation }) => {
	return (
		<PageContainer styleProp={defaults.background}>
			<View style={wallet.container}>
				<Text style={wallet.label}> Bryan's Wallet</Text>

				<PrimaryButton
					text='Donate'
					onPress={() => navigation.navigate('Donate')}
				/>
				<PrimaryButton
					text='Refill'
					onPress={() => console.log('refill clicked')}
				/>

				<Pressable style={wallet.secondaryButton}>
					<Text style={[wallet.buttonText, { color: 'white' }]}>Show</Text>
				</Pressable>
			</View>
		</PageContainer>
	);
};