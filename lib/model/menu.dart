import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/model/order.dart';
import 'package:makerthon2018/model/modifier.dart';

// Drinks
const COFFEE = const Video("assets/coffee.mp4", "Coffee");
const TEA = const Video("assets/tea.mp4", "Tea");

// Type 
const BLACK = const Video("assets/black.mp4", "Black");
const C = const Video("assets/c.mp4", "C");
const MILK = const Video("assets/milk.mp4", "Milk");

// Menu

const KOPI_O = const Order("Kopi O",[COFFEE, BLACK] , [], "assets/kopi-o.jpg");
const KOPI_C = const Order("Kopi C",[COFFEE, C] , [], "assets/kopi-c.jpeg");
const KOPI_STANDARD = const Order("Kopi",[COFFEE] , [], "assets/kopi.jpg");

const TEA_O = const Order("Tea O",[TEA, BLACK] , [], "assets/tea-o.jpg");
const TEA_C = const Order("Tea C",[TEA, C] , [], "assets/tea-c.jpg");
const TEA_STANDARD = const Order("Tea",[TEA] , [], "assets/tea.jpg");

const MENU = [KOPI_STANDARD, KOPI_C, KOPI_O, TEA_STANDARD, TEA_C, TEA_O];

// Modifiers

const NORMAL = const Modifier("Normal", "assets/", const Video(null, "Normal"));

const HOT = const Modifier("Hot", "assets/", const Video("assets/plain.mp4", "Hot"));
const ICED = const Modifier("Iced (Peng)", "assets/", const Video("assets/plain.mp4", "Iced (Peng)"));

const TEMP = [HOT, ICED];

const LESS_SWEET = const Modifier("Siew Dai (Less Sweet)", "assets/", const Video("assets/plain.mp4", "Siew Dai (Less Sweet)"));
const MORE_SWEET = const Modifier("Ga Dai (More Sweet)", "assets/", const Video("assets/plain.mp4", "Ga Dai (More Sweet)"));
const KOSONG = const Modifier("Kosong (No Sugar)", "assets/", const Video("assets/plain.mp4", "Kosong (No Sugar)"));

const SWEETNESS = [NORMAL, LESS_SWEET, MORE_SWEET, KOSONG];

const THICK = const Modifier("Gao (Thicker Brew)", "assets/plain.mp4", const Video("assets/plain.mp4", "Gao (Thicker Brew)"));
const LIGHT = const Modifier("Poh (Lighter Brew)", "assets/plain.mp4", const Video("assets/plain.mp4", "Poh (Lighter Brew)"));

const THICKNESS = [NORMAL, THICK, LIGHT];

const MOFIFIERS = [TEMP, SWEETNESS, THICKNESS];
