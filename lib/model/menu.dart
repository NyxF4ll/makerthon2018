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

const HOT = const Modifier("Hot", "assets/hot.png", const Video("assets/Hot.mp4", "Hot"));
const ICED = const Modifier("Iced (Peng)", "assets/cold.png", const Video("assets/Iced.mp4", "Iced (Peng)"));

const TEMP = [HOT, ICED];

const LESS_SWEET = const Modifier("Siew Dai (Less Sweet)", "assets/50%.png", const Video("assets/Siewdai.mp4", "Siew Dai (Less Sweet)"));
const NORMAL_SWEET = const Modifier("Normal", "assets/100%.png", null);
const MORE_SWEET = const Modifier("Ga Dai (More Sweet)", "assets/150%.png", const Video("assets/Gadai.mp4", "Ga Dai (More Sweet)"));
const KOSONG = const Modifier("Kosong (No Sugar)", "assets/0%.png", const Video("assets/Kosong.mp4", "Kosong (No Sugar)"));


const SWEETNESS = [KOSONG, LESS_SWEET, NORMAL_SWEET, MORE_SWEET];

const THICK = const Modifier("Gao (Thicker Brew)", "assets/gao.png", const Video("assets/Gao.mp4", "Gao (Thicker Brew)"));
const LIGHT = const Modifier("Poh (Lighter Brew)", "assets/poh.png", const Video("assets/Poh.mp4", "Poh (Lighter Brew)"));
const NORMAL_INTENSITY = const Modifier("Normal", "assets/normal.png", null);

const THICKNESS = [LIGHT, NORMAL_INTENSITY, THICK];

const MOFIFIERS = [TEMP, SWEETNESS, THICKNESS];
