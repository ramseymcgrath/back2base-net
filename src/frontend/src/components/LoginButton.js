// src/components/LoginButton.js
import React from 'react';
import { useAuth0 } from '@auth0/auth0-react';
import { Button } from '@chakra-ui/react';

const LoginButton = () => {
  const { loginWithRedirect } = useAuth0();
  return (
    <Button
      colorScheme="teal"
      onClick={() =>
        loginWithRedirect({
          redirectUri: `${window.location.origin}/dashboard`,
        })
      }
    >
      Log In
    </Button>
  );
};

export default LoginButton;
