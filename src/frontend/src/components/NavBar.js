// src/components/NavBar.js

import { Link } from 'react-router-dom';
import { Box, Flex, Button, Stack } from '@chakra-ui/react';

const NavBar = () => {
  return (
    <Box bg="teal.500" px={3}>
      <Flex h={8} alignItems={'center'} justifyContent={'space-between'}>
        <Box color="white" fontWeight="bold">
          back2base
        </Box>
        <Stack direction={'row'} spacing={7}>
          <Button as={Link} to="/dashboard" variant="ghost" color="white">
            Dashboard
          </Button>
        </Stack>
      </Flex>
    </Box>
  );
};

export default NavBar;
