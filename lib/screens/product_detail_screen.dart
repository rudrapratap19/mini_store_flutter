import 'package:flutter/material.dart';
import 'package:mini_store/models/product.dart';
import 'package:mini_store/providers/cart_provider.dart';
import 'package:mini_store/services/wishlist_services.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late bool inWishlist;

  @override
  void initState() {
    super.initState();
    inWishlist = WishlistService.isInWishlist(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: Icon(
              inWishlist ? Icons.favorite : Icons.favorite_border,
              color: inWishlist ? Colors.red : Colors.black54,
            ),
            onPressed: () async {
              if (inWishlist) {
                await WishlistService.removeFromWishlist(widget.product.id);
              } else {
                await WishlistService.addToWishlist(widget.product.id);
              }
              setState(() => inWishlist = !inWishlist);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Image.network(
                  widget.product.image,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              widget.product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),

            // Price
            Text(
              "₹ ${widget.product.price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              widget.product.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 80), // leave space for bottom bar
          ],
        ),
      ),

      // Floating bottom bar for Add to Cart
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text(
                "Add to Cart",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                cart.add(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to Cart")),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
