import 'package:estructura_practica_uno/models/product_dessert.dart';
import 'package:estructura_practica_uno/models/product_grains.dart';
import 'package:estructura_practica_uno/models/product_hot_drinks.dart';
import 'package:estructura_practica_uno/models/product_repository.dart';
import 'package:flutter/material.dart';

// home
const String APP_TITLE = "Snacks shop";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "Cerrar sesion";
const String PROFILE_CART = "Lista de compras";
const String PROFILE_WISHES = "Lista de deseos";
const String PROFILE_HISTORY = "Historial de compras";
const String PROFILE_SETTINGS = "Ajustes";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PICTURE =
    "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg";

// app

const Color PRIMARY_COLOR = Colors.indigo;

// Listas

List<ProductHotDrinks> hotDrinksItems =
    ProductRepository.loadProducts(ProductType.BEBIDAS);

List<ProductDesserts> dessertsItems =
    ProductRepository.loadProducts(ProductType.POSTRES);

List<ProductGrains> grainsItems =
    ProductRepository.loadProducts(ProductType.GRANO);

List<String> products = List<String>();
