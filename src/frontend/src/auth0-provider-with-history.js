// src/index.js or src/auth0-provider-with-history.js

import React from 'react';
import { Auth0Provider } from '@auth0/auth0-react';
import { useNavigate } from 'react-router-dom';

const Auth0ProviderWithHistory = ({ children }) => {
  const navigate = useNavigate();

  const domain = "login.back2base.net";
  const clientId = "9TO3lOweY0oT7RKNw0MPFRWuujGlxrir";
  const audience = "https://api.back2base.com/api/v1/";

  const onRedirectCallback = (appState) => {
    navigate(appState?.returnTo || window.location.pathname);
  };

  return (
    <Auth0Provider
      domain={domain}
      clientId={clientId}
      onRedirectCallback={onRedirectCallback}
      audience={audience}
      useRefreshTokens
      authorizationParams={{
        scope: 'profile email read:users',
        audience: process.env.NEXT_PUBLIC_AUDIENCE,
        redirect_uri: window.location.origin,
      }}
      scope="profile email read:users"
    >
      {children}
    </Auth0Provider>
  );
};

export default Auth0ProviderWithHistory;
