// src/components/Login.js

import React, { useEffect } from 'react';
import { useAuth0 } from '@auth0/auth0-react';

const Login = () => {
  const { loginWithRedirect, isAuthenticated } = useAuth0();

  useEffect(() => {
    if (!isAuthenticated) {
      loginWithRedirect({
        redirectUri: `${window.location.origin}/dashboard`,
      })    }
  }, [loginWithRedirect, isAuthenticated]);

  return null;
};

export default Login;
