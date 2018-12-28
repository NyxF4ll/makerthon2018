import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/model/order.dart';

// Drinks
const COFFEE = const Video("assets/coffee.mp4", "coffee");
const TEA = const Video("assets/tea.mp4", "tea");

// Type 
const BLACK = const Video("assets/black.mp4", "black");
const C = const Video("assets/c.mp4", "C");
const MILK = const Video("assets/milk.mp4", "milk");

// Menu

const KOPI_O = const Order("Kopi O",[COFFEE, BLACK] , [], "assets/kopi-o.jpg");
const KOPI_C = const Order("Kopi C",[COFFEE, C] , [], "assets/kopi-c.jpeg");
const KOPI_STANDARD = const Order("Kopi",[COFFEE, MILK] , [], "assets/kopi.jpg");

const TEA_O = const Order("Tea O",[TEA, BLACK] , [], "assets/tea-o.jpg");
const TEA_C = const Order("Tea C",[TEA, C] , [], "assets/tea-c.jpg");
const TEA_STANDARD = const Order("Tea",[TEA, MILK] , [], "assets/tea.jpg");

const MENU = [KOPI_STANDARD, KOPI_C, KOPI_O, TEA_STANDARD, TEA_C, TEA_O];
