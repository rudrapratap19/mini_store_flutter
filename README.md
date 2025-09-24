# Mini Flutter Store App

A simple **Flutter mobile application** demonstrating product listing, cart functionality, wishlist, and mock authentication using a clean UI. This project fetches products from [Fake Store API](https://fakestoreapi.com/products).

## 📱 Release APK 
[Download APK (v1.0.0)](https://github.com/rudrapratap19/mini_store_flutter/releases/download/v1.0.0/app-release.apk)

---

## Features

- **User Authentication (Mock)**  
  - Login screen with Email & Password fields  
  - Basic validation (non-empty & valid email format)  
  - Demo credentials: `test@test.com / 123456`  
  - No real backend; authentication is hardcoded

- **Product Listing (API Integration)**  
  - Fetch products from Fake Store API  
  - Display product image, title, and price in a clean grid layout  
  - Handle loading and error states  

- **Product Detail Page**  
  - View full product description, image, and price  
  - Add to cart or wishlist from detail page  

- **Cart Functionality**  
  - Add/remove products to/from cart  
  - View total price  
  - Checkout simulated with alert dialog  

- **Wishlist / Favorites**  
  - Add/remove products from wishlist  
  - Persist wishlist locally (using SharedPreferences)  
  - UI updates on wishlist changes  

---



## Getting Started

### Prerequisites
- Flutter SDK installed ([Setup Guide](https://flutter.dev/docs/get-started/install))  
- Android Studio / VSCode or any IDE for Flutter development

### Installation
1. Clone the repository:  
```bash
git clone https://github.com/rudrapratap19/mini_store_flutter.git
