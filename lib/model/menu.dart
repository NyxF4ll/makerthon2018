import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/model/order.dart';
import 'package:makerthon2018/model/modifier.dart';

// Videos
const VKOPI_O = const Video("assets/KopiO.mp4", "Kopi O");
const VKOPI_C = const Video("assets/KopiC.mp4", "Kopi C");
const VKOPI_STANDARD = Video("assets/Kopi.mp4", "Kopi");

const VTEA_O = const Video("assets/TehO.mp4", "Teh O");
const VTEA_C = const Video("assets/TehC.mp4", "Teh C");
const VTEA_STANDARD = const Video("assets/Teh.mp4", "Teh");


// Menu

const KOPI_O = const Order("Kopi O",[VKOPI_O] , [], "assets/kopi-o.jpg");
const KOPI_C = const Order("Kopi C",[VKOPI_C] , [], "assets/kopi-c.jpeg");
const KOPI_STANDARD = const Order("Kopi",[VKOPI_STANDARD] , [], "assets/kopi.jpg");

const TEA_O = const Order("Tea O",[VTEA_O] , [], "assets/tea-o.jpg");
const TEA_C = const Order("Tea C",[VTEA_C] , [], "assets/tea-c.jpg");
const TEA_STANDARD = const Order("Tea",[VTEA_STANDARD] , [], "assets/tea.jpg");

const MENU = [KOPI_STANDARD, KOPI_C, KOPI_O, TEA_STANDARD, TEA_C, TEA_O];

// Modifiers

const NORMAL = const Modifier("Normal", "assets/tea-o.jpg", const Video(null, "Normal"));

const HOT = const Modifier("Hot", "assets/hot.jpg", const Video("assets/Hot.mp4", "Hot"));
const ICED = const Modifier("Iced (Peng)", "assets/cold.jpg", const Video("assets/Iced.mp4", "Iced (Peng)"));

const TEMP = [HOT, ICED];

const LESS_SWEET = const Modifier("Siew Dai (Less Sweet)", "assets/tea-o.jpg", const Video("assets/Siew Dai.mp4", "Siew Dai (Less Sweet)"));
const MORE_SWEET = const Modifier("Ga Dai (More Sweet)", "assets/tea-o.jpg", const Video("assets/Ga Dai.mp4", "Ga Dai (More Sweet)"));
const KOSONG = const Modifier("Kosong (No Sugar)", "assets/tea-o.jpg", const Video("assets/Kosong.mp4", "Kosong (No Sugar)"));


const SWEETNESS = [KOSONG, LESS_SWEET, NORMAL, MORE_SWEET];

const THICK = const Modifier("Gao (Thicker Brew)", "assets/tea-o.jpg", const Video("assets/Gao.mp4", "Gao (Thicker Brew)"));
const LIGHT = const Modifier("Poh (Lighter Brew)", "assets/tea-o.jpg", const Video("assets/Poh.mp4", "Poh (Lighter Brew)"));

const THICKNESS = [LIGHT, NORMAL, THICK];

const MOFIFIERS = [TEMP, SWEETNESS, THICKNESS];
