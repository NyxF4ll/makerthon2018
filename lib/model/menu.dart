import 'package:makerthon2018/model/video.dart';
import 'package:makerthon2018/model/order.dart';

// Drinks
const COFFEE = const Video("assets/drinks/coffee.mp4");
const TEA = const Video("assets/drinks/tea.mp4");

// Type 
const BLACK = const Video("assets/types/black.mp4");
const C = const Video("assets/types/c.mp4");
const MILK = const Video("assets/types/milk.mp4");

// Menu

const BLACK_COFFEE = const Order("Black Coffee",[COFFEE, BLACK] , []);
const COFFEE_C = const Order("Coffee C",[COFFEE, C] , []);
const COFFEE_MILK = const Order("Coffee Milk",[COFFEE, MILK] , []);

const BLACK_TEA = const Order("Black Tea",[TEA, BLACK] , []);
const TEA_C = const Order("Tea C",[TEA, C] , []);
const MILK_TEA = const Order("Milk Tea",[TEA, MILK] , []);

const MENU = [BLACK_COFFEE, COFFEE_C, COFFEE_MILK, BLACK_TEA, TEA_C, MILK_TEA];