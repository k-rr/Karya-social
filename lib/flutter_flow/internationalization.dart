import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['hi', 'en'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? hiText = '',
    String? enText = '',
  }) =>
      [hiText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ProfilePage
  {
    'hzkptrjx': {
      'hi': '32',
      'en': '',
    },
    'c0bmd9tz': {
      'hi': 'Posts',
      'en': '',
    },
    'qm6u5jlf': {
      'hi': 'following',
      'en': '',
    },
    'b37pr9m7': {
      'hi': 'followers',
      'en': '',
    },
    '2d0ngunb': {
      'hi': 'Edit Profile & Settings',
      'en': '',
    },
    '639zrltv': {
      'hi': 'Profile',
      'en': '',
    },
  },
  // Addpost
  {
    '1d3dk7cd': {
      'hi': 'Create Post',
      'en': '',
    },
    '8rmytlyh': {
      'hi': 'Enter post details here...',
      'en': '',
    },
    'x7znpti4': {
      'hi': 'Create Post',
      'en': '',
    },
    'idka27m2': {
      'hi': 'Post',
      'en': '',
    },
  },
  // search
  {
    '5s2ftilp': {
      'hi': 'Add Members',
      'en': '',
    },
    'md94xuag': {
      'hi': 'Search...',
      'en': '',
    },
    '900xx5ch': {
      'hi': 'Followers',
      'en': '',
    },
    'jdq4qyah': {
      'hi': 'Remove',
      'en': '',
    },
    'w2573anv': {
      'hi': 'Add Members',
      'en': '',
    },
    '5wurfm9s': {
      'hi': 'Follow',
      'en': '',
    },
    '505fis4y': {
      'hi': 'Followers',
      'en': '',
    },
    'y2ccqnso': {
      'hi': 'Remove',
      'en': '',
    },
    'llxvwmb0': {
      'hi': 'Add Members',
      'en': '',
    },
    'd545f5kh': {
      'hi': 'Follow',
      'en': '',
    },
    'g1pi1hpv': {
      'hi': 'Followers',
      'en': '',
    },
    'e510felk': {
      'hi': 'Remove',
      'en': '',
    },
    'dxh2czvj': {
      'hi': 'Add Members',
      'en': '',
    },
    'q2o4nslq': {
      'hi': 'Follow',
      'en': '',
    },
    'm92l74cg': {
      'hi': 'Followers',
      'en': '',
    },
    'agw5xzt6': {
      'hi': 'Remove',
      'en': '',
    },
    'jc53hh8e': {
      'hi': 'Add Members',
      'en': '',
    },
    'fxi6ap95': {
      'hi': 'Follow',
      'en': '',
    },
    'smztzfty': {
      'hi': 'Followers',
      'en': '',
    },
    '2c7ya43d': {
      'hi': 'Remove',
      'en': '',
    },
    'etalu99n': {
      'hi': 'Add Members',
      'en': '',
    },
    '4xr5hixo': {
      'hi': 'Follow',
      'en': '',
    },
    'x44bnwq8': {
      'hi': 'Search',
      'en': '',
    },
  },
  // Sign-in-up
  {
    'wkirbgth': {
      'hi': 'KARYA MEET POINT',
      'en': '',
    },
    '7wkavzvp': {
      'hi': 'Sign In',
      'en': '',
    },
    'dmwnbpm4': {
      'hi': 'Enter your email...',
      'en': '',
    },
    't0sm7tkp': {
      'hi': 'Enter your password...',
      'en': '',
    },
    'vuoiv3b2': {
      'hi': 'Sign In',
      'en': '',
    },
    'be6wjbpw': {
      'hi': 'Forgot Password?',
      'en': '',
    },
    'zkq6hac8': {
      'hi': 'Field is required',
      'en': '',
    },
    'usokaei3': {
      'hi': 'Field is required',
      'en': '',
    },
    'lwuvs518': {
      'hi': 'Sign Up',
      'en': '',
    },
    'rlp55xro': {
      'hi': 'Upload',
      'en': '',
    },
    'h0h8w48y': {
      'hi': 'Enter your email...',
      'en': '',
    },
    'c1ol9vvg': {
      'hi': 'Enter your password...',
      'en': '',
    },
    'vobjxmoa': {
      'hi': 'Create Account',
      'en': '',
    },
    '0y787ne6': {
      'hi': 'Field is required',
      'en': '',
    },
    'ro5hx7do': {
      'hi': 'Field is required',
      'en': '',
    },
    '92h69jt8': {
      'hi': 'Login',
      'en': '',
    },
  },
  // Settings
  {
    'fnxrzrkb': {
      'hi': '[User Name Here]',
      'en': '',
    },
    'v2lxoglt': {
      'hi': 'Account Settings',
      'en': '',
    },
    '5yn16mn2': {
      'hi': 'Order History',
      'en': '',
    },
    '6gfh3tll': {
      'hi': 'My Settings',
      'en': '',
    },
    'uheb7wfr': {
      'hi': 'My Notifications',
      'en': '',
    },
    'ulomg6qq': {
      'hi': 'Terms of Service',
      'en': '',
    },
    'u4pikbz6': {
      'hi': 'Log Out',
      'en': '',
    },
    '27i25dgb': {
      'hi': '[User Name]',
      'en': '',
    },
    'a0tvmzba': {
      'hi': '[username@domain.com]',
      'en': '',
    },
    'pp250fjy': {
      'hi': 'Settings',
      'en': '',
    },
  },
  // Following
  {
    '147v5dqo': {
      'hi': 'All',
      'en': '',
    },
    'ftx0fsbw': {
      'hi': 'UnFollow',
      'en': '',
    },
    '7r6yi236': {
      'hi': 'Active',
      'en': '',
    },
    'or4ck31q': {
      'hi': 'Inspector Name',
      'en': '',
    },
    'pk4s084h': {
      'hi': 'Title',
      'en': '',
    },
    'mr9abklh': {
      'hi': 'Inactive',
      'en': '',
    },
    'nvp0vx5j': {
      'hi': 'Inspector Name',
      'en': '',
    },
    'pzsc4wzb': {
      'hi': 'Title',
      'en': '',
    },
    'khlgmrn8': {
      'hi': 'Following',
      'en': '',
    },
    '0yfv6i97': {
      'hi': '•',
      'en': '',
    },
  },
  // Followers
  {
    'pomp9tl8': {
      'hi': 'All',
      'en': '',
    },
    'g8dkf23i': {
      'hi': 'Inspector Name',
      'en': '',
    },
    '5dq2d01g': {
      'hi': 'Title',
      'en': '',
    },
    'bxbhp0zv': {
      'hi': 'Inspector Name',
      'en': '',
    },
    'yurquc4y': {
      'hi': 'Title',
      'en': '',
    },
    'noy4u4zz': {
      'hi': 'Active',
      'en': '',
    },
    'ueao8any': {
      'hi': 'Inspector Name',
      'en': '',
    },
    'w7wcq9p2': {
      'hi': 'Title',
      'en': '',
    },
    'g9dxw03b': {
      'hi': 'Inactive',
      'en': '',
    },
    'mwx2h243': {
      'hi': 'Inspector Name',
      'en': '',
    },
    'ea63vbtx': {
      'hi': 'Title',
      'en': '',
    },
    'ns3nkgln': {
      'hi': 'Followers',
      'en': '',
    },
    'ltjxkwjw': {
      'hi': '•',
      'en': '',
    },
  },
  // EditProfile
  {
    'gg7i00zu': {
      'hi': 'Change Photo',
      'en': '',
    },
    'fzwfpxjc': {
      'hi': 'Your Name',
      'en': '',
    },
    '8f60g4iz': {
      'hi': 'Your bio',
      'en': '',
    },
    'vzotn4ot': {
      'hi': 'Save Changes',
      'en': '',
    },
    'bclwcpom': {
      'hi': 'Edit Profile',
      'en': '',
    },
  },
  // Allcommnets
  {
    'rbl1l25g': {
      'hi': 'Comments...',
      'en': '',
    },
    'ng39a9mp': {
      'hi': 'Field is required',
      'en': '',
    },
    'h9bqw3le': {
      'hi': 'All Comments',
      'en': '',
    },
    'j69wy6ja': {
      'hi': 'Home',
      'en': '',
    },
  },
  // Story
  {
    'df2ibin2': {
      'hi': 'Create  Story',
      'en': '',
    },
    '0f1ag5gc': {
      'hi': 'Share',
      'en': '',
    },
  },
  // feedpage
  {
    'l2dd5kxi': {
      'hi': 'story',
      'en': '',
    },
    'bd56iodv': {
      'hi': 'Home',
      'en': '',
    },
  },
  // Allstories
  {
    'lz0it3b5': {
      'hi': 'Stories',
      'en': '',
    },
    'iu0s6dta': {
      'hi': 'Home',
      'en': '',
    },
  },
  // audioChatDemo
  {
    'wyvqrlfi': {
      'hi':
          'This is a long message. The container  is limited to 70% max width and the text will start floating',
      'en': '',
    },
    'akx7tlmc': {
      'hi': '25',
      'en': '',
    },
    'k0tlfn3i': {
      'hi': 'last seen recently',
      'en': '',
    },
    'db8n7ox1': {
      'hi': 'Start typing',
      'en': '',
    },
    '0nf54blv': {
      'hi': 'Home',
      'en': '',
    },
  },
  // SearchResults
  {
    'x7kssh1p': {
      'hi': 'Follow',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'f4q8tlrs': {
      'hi': '',
      'en': '',
    },
    'frtaowuf': {
      'hi': '',
      'en': '',
    },
    'p89bjj5c': {
      'hi': '',
      'en': '',
    },
    'gkt4hakv': {
      'hi': '',
      'en': '',
    },
    '8yq68cnr': {
      'hi': '',
      'en': '',
    },
    'egjva4zm': {
      'hi': '',
      'en': '',
    },
    '0h67zo09': {
      'hi': '',
      'en': '',
    },
    'n4a06m5n': {
      'hi': '',
      'en': '',
    },
    'ksii3n43': {
      'hi': '',
      'en': '',
    },
    'nnbpyg65': {
      'hi': '',
      'en': '',
    },
    '7gi00fle': {
      'hi': '',
      'en': '',
    },
    'd98wc194': {
      'hi': '',
      'en': '',
    },
    'dzqptijb': {
      'hi': '',
      'en': '',
    },
    '8op084r2': {
      'hi': '',
      'en': '',
    },
    'zqxemwuh': {
      'hi': '',
      'en': '',
    },
    '716jcrlf': {
      'hi': '',
      'en': '',
    },
    '0uxpnfuj': {
      'hi': '',
      'en': '',
    },
    'e7mo0boz': {
      'hi': '',
      'en': '',
    },
    '86hmwwld': {
      'hi': '',
      'en': '',
    },
    'v5y8eqb7': {
      'hi': '',
      'en': '',
    },
    'kr4zml33': {
      'hi': '',
      'en': '',
    },
    '4ue09xd9': {
      'hi': '',
      'en': '',
    },
    '701uhco2': {
      'hi': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
