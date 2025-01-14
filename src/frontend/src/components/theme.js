import { extendTheme, withDefaultColorScheme, withDefaultSize } from '@chakra-ui/react'

const theme = extendTheme({
  colors: {
    teal: {
      _default: '#4361ee',
      50: '#e5eeff',
      100: '#b7cbfe',
      200: '#89a4f6',
      300: '#5a7af1',
      400: '#2d4eec',
      500: '#1342d2',
      600: '#0c3da5',
      700: '#063377',
      800: '#01254a',
      900: '#00101e',
    }
  },
}, withDefaultColorScheme({ colorScheme: 'primary' }),
withDefaultSize({
  size: 'lg',
  components: ['Button', 'Badge'],
}));

export default theme;
