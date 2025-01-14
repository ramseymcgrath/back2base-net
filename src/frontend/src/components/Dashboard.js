// src/components/Dashboard.js
import {
  Heading,
  List,
  ListItem,
  Button,
  Input,
  Flex,
  Box,
  Stack,
  Text,
  Spinner,
  Alert,
  AlertIcon,
  Select,
  InputGroup,
  InputLeftAddon,
} from '@chakra-ui/react';

const Dashboard = () => {
 return (
   <Box>
     <Heading>Service Management</Heading>
     <Text>Manage your backend apis here</Text>
      <Box>
        <Button colorScheme="teal">Create Service</Button>
        </Box>
        <Box>
          <List>
            <ListItem>
              <Flex>
                <Text>Outlook</Text>
                <Stack direction="row" spacing={4}>
                  <Button colorScheme="teal" size="sm">Edit</Button>
                  <Button colorScheme="red" size="sm">Delete</Button>
                </Stack>
              </Flex>
            </ListItem>
            <ListItem>
              <Flex>
                <Text>Slack</Text>
                <Stack direction="row" spacing={4}>
                  <Button colorScheme="teal" size="sm">Edit</Button>
                  <Button colorScheme="red" size="sm">Delete</Button>
                </Stack>
              </Flex>
            </ListItem>
            <ListItem>
              <Flex>
                <Text>Teams</Text>
                <Stack direction="row" spacing={4}>
                  <Button colorScheme="teal" size="sm">Edit</Button>
                  <Button colorScheme="red" size="sm">Delete</Button>
                </Stack>
              </Flex>
            </ListItem>
          </List>
   </Box>
  </Box>
 );
}

export default Dashboard;
