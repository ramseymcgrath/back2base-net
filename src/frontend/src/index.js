// src/index.js
import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom';
import { ChakraProvider } from '@chakra-ui/react';
import Auth0ProviderWithHistory from './auth0-provider-with-history';
import App from './App';
import theme from './components/theme';
import { datadogRum } from '@datadog/browser-rum';

datadogRum.init({
    applicationId: '266fdd83-e14f-4b94-8883-abc69bc08578',
    clientToken: 'pubefad6ee510741e248df6038c5ed22302',
    // `site` refers to the Datadog site parameter of your organization
    // see https://docs.datadoghq.com/getting_started/site/
    site: 'datadoghq.com',
    service: 'back2base-frontend',
    env: 'production',
    // Specify a version number to identify the deployed version of your application in Datadog
    version: '1.0.1',
    sessionSampleRate: 100,
    sessionReplaySampleRate: 20,
    trackUserInteractions: true,
    trackResources: true,
    trackLongTasks: true,
    defaultPrivacyLevel: 'mask-user-input',
});

ReactDOM.render(
  <BrowserRouter>
    <Auth0ProviderWithHistory>
      <ChakraProvider theme={theme}>
        <App />
      </ChakraProvider>
    </Auth0ProviderWithHistory>
  </BrowserRouter>,
  document.getElementById('root')
);
