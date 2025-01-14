// src/components/Header.js
import React from 'react';
import { Flex, Image, Heading } from '@chakra-ui/react';
import AuthenticationButton from './AuthenticationButton';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <Flex as="header" align="center" justify="space-between" py={4}>
      <Link to="/">
        <Flex align="center">
          <Image src="https://back2base.net/logo.png" alt="back2base Logo" boxSize="50px" />
          <Heading as="h1" size="lg" ml={2}>
            back2base
          </Heading>
        </Flex>
      </Link>
      <AuthenticationButton />
    </Flex>
  );
};

export default Header;
