// src/components/Home.js
import React from 'react';
import { Box, Heading, Text, Button } from '@chakra-ui/react';
import { useAuth0 } from '@auth0/auth0-react';

const Home = (context) => {
  const { loginWithRedirect, isAuthenticated } = useAuth0();

  return (
    <Box textAlign="center" mt={10}>
      <Heading>Welcome to back2base!</Heading>
      <Text fontSize="l" mt={4}>
        back2base is a service management tool that helps you optimize your team's in-person productivity
      </Text>
      {!isAuthenticated && (
        <Button
          colorScheme="teal"
          size="lg"
          mt={6}
          onClick={() =>
            loginWithRedirect({
              redirectUri: `${window.location.origin}/dashboard`,
            })
          }>
          Get Started
        </Button>
      )}
    </Box>
  );
};

export default Home;
