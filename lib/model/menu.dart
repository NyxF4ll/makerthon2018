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

const BLACK_COFFEE = const Order("Black Coffee",[COFFEE, BLACK] , []);
const COFFEE_C = const Order("Coffee C",[COFFEE, C] , []);
const COFFEE_MILK = const Order("Coffee Milk",[COFFEE, MILK] , []);

const BLACK_TEA = const Order("Black Tea",[TEA, BLACK] , []);
const TEA_C = const Order("Tea C",[TEA, C] , []);
const MILK_TEA = const Order("Milk Tea",[TEA, MILK] , []);

const MENU = [BLACK_COFFEE, COFFEE_C, COFFEE_MILK, BLACK_TEA, TEA_C, MILK_TEA];